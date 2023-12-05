local utils = require "astrocore"

local function on_file_remove(args)
  local ts_clients = vim.lsp.get_clients { name = "tsserver" }
  for _, ts_client in ipairs(ts_clients) do
    ts_client.request("workspace/executeCommand", {
      command = "_typescript.applyRenameFile",
      arguments = {
        {
          sourceUri = vim.uri_from_fname(args.source),
          targetUri = vim.uri_from_fname(args.destination),
        },
      },
    })
  end
end

local function check_json_key_exists(filename, key)
  -- Open the file in read mode
  local file = io.open(filename, "r")
  if not file then
    return false -- File doesn't exist or cannot be opened
  end

  -- Read the contents of the file
  local content = file:read "*all"
  file:close()

  -- Parse the JSON content
  local json_parsed, json = pcall(vim.fn.json_decode, content)
  if not json_parsed or type(json) ~= "table" then
    return false -- Invalid JSON format
  end

  -- Check if the key exists in the JSON object
  return json[key] ~= nil
end

return {
  { import = "astrocommunity.pack.json" },
  {
    "nvim-treesitter/nvim-treesitter",
    optional = true,
    opts = function(_, opts)
      if opts.ensure_installed ~= "all" then
        opts.ensure_installed = utils.list_insert_unique(opts.ensure_installed, { "javascript", "typescript", "tsx" })
      end
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    optional = true,
    opts = function(_, opts) opts.ensure_installed = utils.list_insert_unique(opts.ensure_installed, "tsserver") end,
  },
  {
    "jay-babu/mason-null-ls.nvim",
    optional = true,
    opts = function(_, opts)
      opts.ensure_installed = utils.list_insert_unique(opts.ensure_installed, { "prettierd", "eslint-lsp" })
      if not opts.handlers then opts.handlers = {} end

      local has_prettier = function(util)
        return check_json_key_exists(vim.fn.getcwd() .. "/package.json", "prettier")
          or util.root_has_file ".prettierrc"
          or util.root_has_file ".prettierrc.json"
          or util.root_has_file ".prettierrc.yml"
          or util.root_has_file ".prettierrc.yaml"
          or util.root_has_file ".prettierrc.json5"
          or util.root_has_file ".prettierrc.js"
          or util.root_has_file ".prettierrc.cjs"
          or util.root_has_file "prettier.config.js"
          or util.root_has_file ".prettierrc.mjs"
          or util.root_has_file "prettier.config.mjs"
          or util.root_has_file "prettier.config.cjs"
          or util.root_has_file ".prettierrc.toml"
      end

      opts.handlers.prettierd = function()
        local null_ls = require "null-ls"
        null_ls.register(null_ls.builtins.formatting.prettierd.with { condition = has_prettier })
      end
    end,
  },
  {
    "jay-babu/mason-nvim-dap.nvim",
    optional = true,
    opts = function(_, opts) opts.ensure_installed = utils.list_insert_unique(opts.ensure_installed, "js") end,
  },
  {
    "vuki656/package-info.nvim",
    dependencies = { "MunifTanjim/nui.nvim" },
    opts = {},
    event = "BufRead package.json",
  },
  {
    "pmizio/typescript-tools.nvim",
    dependencies = {
      ---@type AstroLSPOpts
      "AstroNvim/astrolsp",
      ---@diagnostic disable: missing-fields
      opts = {
        handlers = { tsserver = false }, -- disable tsserver setup, this plugin does it
        config = {
          ["typescript-tools"] = { -- enable inlay hints by default for `typescript-tools`
            settings = {
              tsserver_file_preferences = {
                includeInlayParameterNameHints = "all",
                includeInlayParameterNameHintsWhenArgumentMatchesName = false,
                includeInlayFunctionParameterTypeHints = true,
                includeInlayVariableTypeHints = true,
                includeInlayVariableTypeHintsWhenTypeMatchesName = false,
                includeInlayPropertyDeclarationTypeHints = true,
                includeInlayFunctionLikeReturnTypeHints = true,
                includeInlayEnumMemberValueHints = true,
              },
            },
          },
        },
      },
    },
    ft = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx" },
    -- get AstroLSP provided options like `on_attach` and `capabilities`
    opts = function() return require("astrolsp").lsp_opts "typescript-tools" end,
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    optional = true,
    opts = function(_, opts)
      local events = require "neo-tree.events"
      opts.event_handlers = {
        {
          event = events.FILE_MOVED,
          handler = on_file_remove,
        },
        {
          event = events.FILE_RENAMED,
          handler = on_file_remove,
        },
      }
    end,
  },
  {
    "dmmulroy/tsc.nvim",
    cmd = { "TSC" },
    opts = {},
  },
}
