local prefix = "<leader>fd"

return {
  "nvim-telescope/telescope.nvim",
  keys = {
    { prefix .. "c", function() require("telescope").extensions.dap.commands() end, desc = "Telescope DAP commands" },
    { prefix .. "f", function() require("telescope").extensions.dap.frames() end, desc = "Telescope DAP frames" },
    {
      prefix .. "g",
      function() require("telescope").extensions.dap.configurations() end,
      desc = "Telescope DAP configurations",
    },
    {
      prefix .. "l",
      function() require("telescope").extensions.dap.list_breakpoints() end,
      desc = "Telescope DAP list breakpoints",
    },
    { prefix .. "v", function() require("telescope").extensions.dap.variables() end, desc = "Telescope DAP variables" },
  },
  dependencies = { "nvim-telescope/telescope-dap.nvim" },
  opts = function() require("telescope").load_extension "dap" end,
}
