return {
  "nvzone/floaterm",
  dependencies = {
    { "nvzone/volt", lazy = true },
    {
      "AstroNvim/astrocore",
      ---@type AstroCoreOpts
      opts = {
        mappings = {
          n = {
            ["<leader>tF"] = { "<cmd>FloatermToggle<cr>", desc = "Toggle Floaterm (NvZone)" },
          },
        },
      },
    },
  },
  cmd = "FloatermToggle",
  opts = {
    border = false,
  },
}
