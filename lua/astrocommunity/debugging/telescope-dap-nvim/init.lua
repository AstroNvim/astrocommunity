local prefix = "<Leader>fd"

return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-telescope/telescope-dap.nvim",
    {
      "AstroNvim/astrocore",
      opts = {
        mappings = {
          n = {
            [prefix .. "c"] = {
              "<Cmd>lua require('telescope').extensions.dap.commands()<CR>",
              desc = "Telescope DAP commands",
            },
            [prefix .. "f"] = {
              "<Cmd>lua require('telescope').extensions.dap.frames()<CR>",
              desc = "Telescope DAP frames",
            },
            [prefix .. "g"] = {
              "<Cmd>lua require('telescope').extensions.dap.configurations()<CR>",
              desc = "Telescope DAP configurations",
            },
            [prefix .. "l"] = {
              "<Cmd>lua require('telescope').extensions.dap.list_breakpoints()<CR>",
              desc = "Telescope DAP list breakpoints",
            },
            [prefix .. "v"] = {
              "<Cmd>lua require('telescope').extensions.dap.variables()<CR>",
              desc = "Telescope DAP variables",
            },
          },
        },
      },
    },
  },
  opts = function() require("telescope").load_extension "dap" end,
}
