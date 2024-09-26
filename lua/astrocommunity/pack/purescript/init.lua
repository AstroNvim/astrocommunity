local on_attach = function(client, bufnr)
  -- Keymap helper function
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local opts = { noremap = true, silent = true }

  -- :lua print(vim.inspect(require("nvimmer-ps")))
  -- add_clause = <function 1>,
  -- add_ident_import = <function 2>,
  -- add_ident_import_mod = <function 3>,
  -- add_import = <function 4>,
  -- add_module_import = <function 5>,
  -- apply_code_action = <function 6>,
  -- build = <function 7>,
  -- case_split = <function 8>,
  -- execute_command = <function 9>,
  -- restart = <function 10>,
  -- search = <function 11>,
  -- start = <function 12>,
  -- stop = <function 13>,
  -- typed_hole = <function 14>

  buf_set_keymap('n', '<space>ai', '<Cmd>lua require("nvimmer-ps").add_ident_import()<CR>', opts)
  -- buf_set_keymap('n', '<space>ai', '<Cmd>lua require("nvimmer-ps").add_import(vim.fn.expand("<cword>"), nil, vim.uri_from_bufnr(0))<CR>', opts)
  -- buf_set_keymap('n', '<space>am', '<Cmd>lua vim.ui.input({prompt="Module name: "}, function(module) require("nvimmer-ps").add_module_import(module, nil, vim.uri_from_bufnr(0)) end)<CR>', opts)
  buf_set_keymap('n', '<space>am', '<Cmd>lua require("nvimmer-ps").add_module_import()<CR>', opts)
  -- buf_set_keymap('n', '<space>at', '<Cmd>lua require("nvimmer-ps").get_available_modules()<CR>', opts)

  buf_set_keymap('n', '<space>as', '<Cmd>lua require("nvimmer-ps").case_split()<CR>', opts)
  buf_set_keymap('n', '<space>aa', '<Cmd>lua require("nvimmer-ps").add_clause()<CR>', opts)
  buf_set_keymap('n', '<space>at', '<Cmd>lua require("nvimmer-ps").typed_hole()<CR>', opts)
end

return {
  {
    "srghma/nvimmer-ps",
    -- dir = "~/projects/nvimmer-ps",
  },
  {
    "AstroNvim/astrocore",
    ---@type AstroCoreOpts
    opts = {
      filetypes = {
        extension = { purs = "purescript" },
      },
    },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    optional = true,
    opts = function(_, opts)
      if opts.ensure_installed ~= "all" then
        opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, { "purescript" })
      end
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    optional = true,
    opts = function(_, opts)
      opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, { "purescriptls" })
    end,
  },
  {
    "jay-babu/mason-null-ls.nvim",
    optional = true,
    opts = function(_, opts)
      opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, { "purs-tidy" })
    end,
  },
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    optional = true,
    opts = function(_, opts)
      opts.ensure_installed =
        require("astrocore").list_insert_unique(opts.ensure_installed, {
          "purescript-language-server",
          "purs-tidy"
        })
    end,
  },
  {
    "stevearc/conform.nvim",
    optional = true,
    opts = {
      formatters_by_ft = {
        purescript = { "purs-tidy" },
      },
    },
  },
  {
    "AstroNvim/astrolsp",
    ---@type AstroLSPOpts
    opts = {
      ---@diagnostic disable: missing-fields
      config = {
        purescriptls = {
          on_attach = on_attach,
          settings = {
            purescript = {
              -- formatter = "purs-tidy", -- uncomment, if want formatting on save
              flags = {
                debounce_text_changes = 150,
              }
            },
          },
        },
      },
    },
  },
}
