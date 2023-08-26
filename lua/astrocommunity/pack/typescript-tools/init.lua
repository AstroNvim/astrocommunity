local utils = require "astronvim.utils"

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
    opts = function(_, opts)
      if opts.ensure_installed ~= "all" then
        opts.ensure_installed = utils.list_insert_unique(opts.ensure_installed, { "javascript", "typescript", "tsx" })
      end
    end,
  },
  {
    "jay-babu/mason-null-ls.nvim",

    opts = function(_, opts)
      opts.ensure_installed = utils.list_insert_unique(opts.ensure_installed, { "prettierd", "eslint_d" })
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
          or util.root_has_file "prettier.config.cjs"
          or util.root_has_file ".prettierrc.toml"
      end

      local has_eslint = function(util)
        return util.root_has_file ".eslintrc.js"
          or util.root_has_file ".eslintrc.cjs"
          or util.root_has_file ".eslintrc.yaml"
          or util.root_has_file ".eslintrc.yml"
          or util.root_has_file ".eslintrc.json"
          or check_json_key_exists(vim.fn.getcwd() .. "/package.json", "eslintConfig")
      end

      opts.handlers.prettierd = function()
        local null_ls = require "null-ls"
        null_ls.register(null_ls.builtins.formatting.prettierd.with { condition = has_prettier })
      end

      opts.handlers.eslint_d = function()
        local null_ls = require "null-ls"
        null_ls.register(null_ls.builtins.diagnostics.eslint_d.with { condition = has_eslint })
        null_ls.register(null_ls.builtins.formatting.eslint_d.with { condition = has_eslint })
        null_ls.register(null_ls.builtins.code_actions.eslint_d.with { condition = has_eslint })
      end
    end,
  },
  {
    "jay-babu/mason-nvim-dap.nvim",
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
    dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
    ft = {
      "typescript",
      "typescriptreact",
      "javascript",
      "javascriptreact",
    },
    opts = {
      on_attach = function(client)
        client.server_capabilities.documentFormattingProvider = false
        client.server_capabilities.documentRangeFormattingProvider = false
      end,
      settings = {
        expose_as_code_action = { "fix_all", "add_missing_imports", "remove_unused" },
      },
    },
  },
  {
    "antosha417/nvim-lsp-file-operations",
    opts = {},
    lazy = false,
    requires = {
      "nvim-lua/plenary.nvim",
      "nvim-neo-tree/neo-tree.nvim",
    },
  },
  {
    "dmmulroy/tsc.nvim",
    cmd = { "TSC" },
    opts = {},
  },
}
