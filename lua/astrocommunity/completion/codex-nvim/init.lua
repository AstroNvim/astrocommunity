return {
  "johnseth97/codex.nvim",
  specs = {
    {
      "AstroNvim/astrocore",
      opts = {
        mappings = {
          n = {
            ["<Leader>Oc"] = { function() require("codex").toggle() end, desc = "Toggle Codex popup" },
          },
        },
      },
    },
  },
  cmd = {
    "Codex",
    "CodexToggle",
  },
  opts = {
    keymaps = {}, -- Disable internal mapping
  },
}
