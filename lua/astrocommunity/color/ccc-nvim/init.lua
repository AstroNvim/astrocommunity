return {
  "uga-rosa/ccc.nvim",
  event = { "User AstroFile", "InsertEnter" },
  cmd = { "CccPick", "CccConvert", "CccHighlighterEnable", "CccHighlighterDisable", "CccHighlighterToggle" },
  specs = {
    { "brenoprata10/nvim-highlight-colors", enabled = false },
    { "NvChad/nvim-colorizer.lua", enabled = false },
  },
  dependencies = {
    {
      "AstroNvim/astrocore",
      opts = {
        mappings = {
          n = {
            ["<Leader>uC"] = { "<Cmd>CccHighlighterToggle<CR>", desc = "Toggle colorizer" },
            ["<Leader>zc"] = { "<Cmd>CccConvert<CR>", desc = "Convert color" },
            ["<Leader>zp"] = { "<Cmd>CccPick<CR>", desc = "Pick Color" },
          },
        },
      },
    },
  },
  opts = {
    highlighter = {
      auto_enable = true,
      lsp = true,
    },
  },
  config = function(_, opts)
    require("ccc").setup(opts)
    if opts.highlighter and opts.highlighter.auto_enable then vim.cmd.CccHighlighterEnable() end
  end,
}
