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
              "<CMD>lua require('telescope').extensions.dap.commands()<CR>",
              desc = "Telescope DAP commands",
            },
            [prefix .. "f"] = {
              "<CMD>lua require('telescope').extensions.dap.frames()<CR>",
              desc = "Telescope DAP frames",
            },
            [prefix .. "g"] = {
              "<CMD>lua require('telescope').extensions.dap.configurations()<CR>",
              desc = "Telescope DAP configurations",
            },
            [prefix .. "l"] = {
              "<CMD>lua require('telescope').extensions.dap.list_breakpoints()<CR>",
              desc = "Telescope DAP list breakpoints",
            },
            [prefix .. "v"] = {
              "<CMD>lua require('telescope').extensions.dap.variables()<CR>",
              desc = "Telescope DAP variables",
            },
          },
        },
      },
    },
  },
  opts = function() require("telescope").load_extension "dap" end,
}
