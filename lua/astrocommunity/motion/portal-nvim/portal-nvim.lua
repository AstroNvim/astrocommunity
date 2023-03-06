return {
  "cbochs/portal.nvim",
  keys = {
    { "<leader>o", function() require("portal").jump_backward {} end, desc = "Portal Jump backward" },
    { "<leader>i", function() require("portal").jump_forward {} end, desc = "Portal Jump forward" },
  },
}
