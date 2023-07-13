local prefix = "<leader>g"
local maps = { n = {} }
local icon = vim.g.icons_enabled and "󰰔 " or ""
maps.n[prefix] = { desc = icon .. "Neogit" }
require("astronvim.utils").set_mappings(maps)
return {
  {
    "NeogitOrg/neogit",
    dependencies = {
      { "nvim-lua/plenary.nvim" },
    },
    event = "User AstroGitFile",
    keys = {
      { prefix .. "nt", "<cmd>Neogit<CR>", desc = "Open Neogit Tab Page" },
      { prefix .. "nc", "<cmd>Neogit commit<CR>", desc = "Open Neogit Commit Page" },
      { prefix .. "nd", ":Neogit cwd=", desc = "Open Neogit Override CWD" },
      { prefix .. "nk", ":Neogit kind=", desc = "Open Neogit Override Kind" },
    },
  },
}
