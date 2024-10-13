local on_attach = function(_, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local opts = { noremap = true, silent = true }

  buf_set_keymap("n", "<space>ai", '<Cmd>lua require("nvimmer-ps").add_ident_import()<CR>', opts)
  buf_set_keymap("n", "<space>am", '<Cmd>lua require("nvimmer-ps").add_module_import()<CR>', opts)
  buf_set_keymap("n", "<space>as", '<Cmd>lua require("nvimmer-ps").case_split()<CR>', opts)
  buf_set_keymap("n", "<space>aa", '<Cmd>lua require("nvimmer-ps").add_clause()<CR>', opts)
  buf_set_keymap("n", "<space>at", '<Cmd>lua require("nvimmer-ps").typed_hole()<CR>', opts)
end

return {
  {
    "srghma/nvimmer-ps",
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
      opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, {
        "purescript-language-server",
        "purs-tidy",
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
          -- root_dir fixes
          -- "Problem running build: Reading Spago workspace configuration...\n\n✘ Your spago.yaml doesn't contain a workspace section."
          -- when language server is being run in a monorepo (lot of spago.yaml files, but only the top one has "workspace section")
          root_dir = function(_) return vim.fn.getcwd() end,
          on_attach = on_attach,
          settings = {
            purescript = {
              flags = {
                debounce_text_changes = 150,
              },
            },
          },
        },
      },
    },
  },
}
