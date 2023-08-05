local prefix = "<leader><leader>"
local icon = vim.g.icons_enabled and "󰛢 " or ""
return {
  {
    "AstroNvim/astrocore",
    opts = {
      mappings = {
        n = {
          [prefix] = { desc = icon .. "Grapple" },
          [prefix .. "a"] = { "<cmd>GrappleTag<CR>", desc = "Add file" },
          [prefix .. "d"] = { "<cmd>GrappleUntag<CR>", desc = "Remove file" },
          [prefix .. "t"] = { "<cmd>GrappleToggle<CR>", desc = "Toggle a file" },
          [prefix .. "e"] = { "<cmd>GrapplePopup tags<CR>", desc = "Select from tags" },
          [prefix .. "s"] = { "<cmd>GrapplePopup scopes<CR>", desc = "Select a project scope" },
          [prefix .. "x"] = { "<cmd>GrappleReset<CR>", desc = "Clear tags from current project" },
          ["<C-n>"] = { "<cmd>GrappleCycle forward<CR>", desc = "Select next tag" },
          ["<C-p>"] = { "<cmd>GrappleCycle backward<CR>", desc = "Select previous tag" },
        },
      },
    },
  },
  {
    "cbochs/grapple.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    cmd = { "Grapple" },
  },
}
