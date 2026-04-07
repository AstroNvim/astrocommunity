return {
  { import = "astrocommunity.pack.json" },
  {
    "AstroNvim/astrocore",
    ---@type AstroCoreOpts
    opts = {
      filetypes = { extension = {
        pcss = "postcss",
        postcss = "postcss",
      } },
      treesitter = { ensure_installed = { "html", "css", "scss", "styled" } },
    },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    optional = true,
    opts = function() vim.treesitter.language.register("scss", { "less", "postcss" }) end,
  },
  {
    "mason-org/mason-lspconfig.nvim",
    optional = true,
    opts = function(_, opts)
      opts.ensure_installed =
        require("astrocore").list_insert_unique(opts.ensure_installed, { "html", "cssls", "emmet_ls" })
    end,
  },
  {
    "AstroNvim/astrolsp",
    opts = {
      config = {
        html = { init_options = { provideFormatter = false } },
        cssls = { init_options = { provideFormatter = false } },
      },
    },
  },
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    optional = true,
    opts = function(_, opts)
      opts.ensure_installed =
        require("astrocore").list_insert_unique(opts.ensure_installed, { "html-lsp", "css-lsp", "emmet-ls" })
    end,
  },
  {
    "nvim-mini/mini.icons",
    optional = true,
    opts = {
      filetype = {
        postcss = { glyph = "󰌜", hl = "MiniIconsOrange" },
      },
    },
  },
}
