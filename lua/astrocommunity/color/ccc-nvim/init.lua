return {
  { "NvChad/nvim-colorizer.lua", enabled = false },
  {
    "uga-rosa/ccc.nvim",
    event = { "User AstroFile", "InsertEnter" },
    cmd = { "CccPick", "CccConvert", "CccHighlighterEnable", "CccHighlighterDisable", "CccHighlighterToggle" },
    dependencies = {
      {
        "AstroNvim/astrocore",
        opts = {
          mappings = {
            ["<Leader>uC"] = { "<CMD>CccHighlighterToggle<CR>", desc = "Toggle colorizer" },
            ["<Leader>zc"] = { "<CMD>CccConvert<CR>", desc = "Convert color" },
            ["<Leader>zp"] = { "<CMD>CccPick<CR>", desc = "Pick Color" },
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
  },
}
