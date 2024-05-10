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

local root_has_file = function(file) return vim.loop.fs_stat(vim.fn.getcwd() .. "/" .. file) ~= nil end
local has_prettier = function()
  return check_json_key_exists(vim.fn.getcwd() .. "/package.json", "prettier")
    or root_has_file ".prettierrc"
    or root_has_file ".prettierrc.json"
    or root_has_file ".prettierrc.yml"
    or root_has_file ".prettierrc.yaml"
    or root_has_file ".prettierrc.json5"
    or root_has_file ".prettierrc.js"
    or root_has_file ".prettierrc.cjs"
    or root_has_file "prettier.config.js"
    or root_has_file ".prettierrc.mjs"
    or root_has_file "prettier.config.mjs"
    or root_has_file "prettier.config.cjs"
    or root_has_file ".prettierrc.toml"
end

local conform_formatter = function() return has_prettier() and { "prettierd" } or {} end

return {
  { import = "astrocommunity.pack.json" },
  { import = "astrocommunity.lsp.nvim-lsp-file-operations" },
  {
    "nvim-treesitter/nvim-treesitter",
    optional = true,
    opts = function(_, opts)
      if opts.ensure_installed ~= "all" then
        opts.ensure_installed =
          require("astrocore").list_insert_unique(opts.ensure_installed, { "javascript", "typescript", "tsx", "jsdoc" })
      end
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    opts = function(_, opts)
      opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, { "tsserver", "eslint" })
    end,
  },
  {
    "jay-babu/mason-null-ls.nvim",
    optional = true,
    opts = function(_, opts)
      opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, { "prettierd" })
      if not opts.handlers then opts.handlers = {} end

      opts.handlers.prettierd = function(source_name, methods)
        local null_ls = require "null-ls"
        for _, method in ipairs(methods) do
          null_ls.register(null_ls.builtins[method][source_name].with { condition = has_prettier })
        end
      end
    end,
  },
  {
    "stevearc/conform.nvim",
    optional = true,
    opts = {
      formatters_by_ft = {
        typescriptreact = conform_formatter,
        typescript = conform_formatter,
        javascriptreact = conform_formatter,
        javascript = conform_formatter,
      },
    },
  },
  {
    "jay-babu/mason-nvim-dap.nvim",
    optional = true,
    opts = function(_, opts)
      opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, { "js" })
    end,
  },
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    optional = true,
    opts = function(_, opts)
      opts.ensure_installed = require("astrocore").list_insert_unique(
        opts.ensure_installed,
        { "typescript-language-server", "eslint-lsp", "prettierd", "js-debug-adapter" }
      )
    end,
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
      optional = true,
      ---@diagnostic disable: missing-fields
      opts = {
        autocmds = {
          eslint_fix_on_save = {
            cond = function(client) return client.name == "eslint" and vim.fn.exists ":EslintFixAll" > 0 end,
            {
              event = "BufWritePost",
              desc = "Fix all eslint errors",
              callback = function() vim.cmd.EslintFixAll() end,
            },
          },
        },
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
    opts = function()
      local astrolsp_avail, astrolsp = pcall(require, "astrolsp")
      if astrolsp_avail then return astrolsp.lsp_opts "typescript-tools" end
    end,
  },
  {
    "dmmulroy/tsc.nvim",
    cmd = "TSC",
    opts = {},
  },
}
