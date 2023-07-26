return {
  {
    "AstroNvim/astrocore",
    opts = {
      mappings = {
        ["<leader>uC"] = { "<cmd>CccHighlighterToggle<cr>", desc = "Toggle colorizer" },
        ["<leader>zc"] = { "<cmd>CccConvert<cr>", desc = "Convert color" },
        ["<leader>zp"] = { "<cmd>CccPick<cr>", desc = "Pick Color" },
      },
    },
  },
  { "NvChad/nvim-colorizer.lua", enabled = false },
  {
    "uga-rosa/ccc.nvim",
    event = { "User AstroFile", "InsertEnter" },
    cmd = { "CccPick", "CccConvert", "CccHighlighterEnable", "CccHighlighterDisable", "CccHighlighterToggle" },
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
