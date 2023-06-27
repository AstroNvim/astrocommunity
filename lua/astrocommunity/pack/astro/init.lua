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
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      -- Ensure that opts.ensure_installed exists and is a table or string "all".
      if opts.ensure_installed ~= "all" then
        opts.ensure_installed = utils.list_insert_unique(opts.ensure_installed, "astro")
      end
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    opts = function(_, opts) opts.ensure_installed = utils.list_insert_unique(opts.ensure_installed, "astro") end,
  },
  {
    "jay-babu/mason-nvim-dap.nvim",
    opts = function(_, opts) opts.ensure_installed = utils.list_insert_unique(opts.ensure_installed, "js") end,
  },
  {
    "jay-babu/mason-null-ls.nvim",
    opts = function(_, opts)
      opts.ensure_installed = utils.list_insert_unique(opts.ensure_installed, { "eslint_d" })
      if not opts.handlers then opts.handlers = {} end

      local has_eslint = function(util)
        return util.root_has_file ".eslintrc.js"
          or util.root_has_file ".eslintrc.cjs"
          or util.root_has_file ".eslintrc.yaml"
          or util.root_has_file ".eslintrc.yml"
          or util.root_has_file ".eslintrc.json"
          or check_json_key_exists(vim.fn.getcwd() .. "/package.json", "eslintConfig")
      end

      opts.handlers.eslint_d = function()
        local null_ls = require "null-ls"
        null_ls.register(
          null_ls.builtins.diagnostics.eslint_d.with { condition = has_eslint, extra_filetypes = "astro" }
        )
        null_ls.register(
          null_ls.builtins.formatting.eslint_d.with { condition = has_eslint, extra_filetypes = "astro" }
        )
        null_ls.register(
          null_ls.builtins.code_actions.eslint_d.with { condition = has_eslint, extra_filetypes = "astro" }
        )
      end
    end,
  },
}
