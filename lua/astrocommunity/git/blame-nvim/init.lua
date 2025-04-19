return {
  "FabijanZulj/blame.nvim",
  cmd = "BlameToggle",
  opts = {},
  dependencies = {
    {
      "AstroNvim/astrocore",
      ---@type AstroCoreOpts
      opts = {
        mappings = {
          n = {
            ["<Leader>gB"] = {
              "<cmd>BlameToggle<cr>",
              desc = "Toggle git blame",
            },
          },
        },
      },
    },
    { "AstroNvim/astroui", opts = { status = { winbar = { enabled = { filetype = { "blame" } } } } } },
  },
}
