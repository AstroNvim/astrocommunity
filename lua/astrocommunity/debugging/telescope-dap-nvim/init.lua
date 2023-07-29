local prefix = "<leader>fd"

return {
  {
    "AstroNvim/astrocore",
    opts = {
      mappings = {
        n = {
          [prefix .. "c"] = {
            "<cmd>lua require('telescope').extensions.dap.commands()<cr>",
            desc = "Telescope DAP commands",
          },
          [prefix .. "f"] = {
            "<cmd>lua require('telescope').extensions.dap.frames()<cr>",
            desc = "Telescope DAP frames",
          },
          [prefix .. "g"] = {
            "<cmd>lua require('telescope').extensions.dap.configurations()<cr>",
            desc = "Telescope DAP configurations",
          },
          [prefix .. "l"] = {
            "<cmd>lua require('telescope').extensions.dap.list_breakpoints()<cr>",
            desc = "Telescope DAP list breakpoints",
          },
          [prefix .. "v"] = {
            "<cmd>lua require('telescope').extensions.dap.variables()<cr>",
            desc = "Telescope DAP variables",
          },
        },
      },
    },
  },
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-telescope/telescope-dap.nvim" },
    opts = function() require("telescope").load_extension "dap" end,
  },
}
