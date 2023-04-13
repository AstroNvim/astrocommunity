local prefix = "<leader><leader>"
return {
  "cbochs/grapple.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  cmd = { "Grapple" },
  keys = {
    { prefix, desc = "Grapple" },
    { prefix .. "a", "<cmd>GrappleTag<CR>", desc = "Add file" },
    { prefix .. "d", "<cmd>GrappleUntag<CR>", desc = "Remove file" },
    { prefix .. "t", "<cmd>GrappleToggle<CR>", desc = "Toggle a file" },
    { prefix .. "e", "<cmd>GrapplePopup tags<CR>", desc = "Select from tags" },
    { prefix .. "s", "<cmd>GrapplePopup scopes<CR>", desc = "Select a project scope" },
    { prefix .. "x", "<cmd>GrappleReset<CR>", desc = "Clear tags from current project" },
    { prefix .. "l", "<cmd>GrappleCycle forward<CR>", desc = "Select next tag" },
    { prefix .. "h", "<cmd>GrappleReset<CR>", desc = "Select previous tag" },
  },
}
