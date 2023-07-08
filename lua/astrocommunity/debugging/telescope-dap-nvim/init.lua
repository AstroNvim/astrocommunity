local prefix = "<leader>fd"

return {
  {
    "nvim-telescope/telescope-dap.nvim",
    name = "telescope_dap",
    event = "User AstroFile",
    keys = {
      {
        prefix .. "c",
        "<Cmd>lua require('telescope').extensions.dap.commands{}<CR>",
        { silent = true, expr = false },
        mode = {
          "n",
        },
        desc = "Telescope DAP commands",
      },
      {
        prefix .. "g",
        "<Cmd>lua require('telescope').extensions.dap.configurations{}<CR>",
        { silent = true, expr = false },
        mode = {
          "n",
        },
        desc = "Telescope DAP configurations",
      },
      {
        prefix .. "l",
        "<Cmd>lua require('telescope').extensions.dap.list_breakpoints{}<CR>",
        { silent = true, expr = false },
        mode = {
          "n",
        },
        desc = "Telescope DAP list breakpoints",
      },
      {
        prefix .. "v",
        "<Cmd>lua require('telescope').extensions.dap.variables{}<CR>",
        { silent = true, expr = false },
        mode = {
          "n",
        },
        desc = "Telescope DAP variables",
      },
      {
        prefix .. "f",
        "<Cmd>lua require('telescope').extensions.dap.frames{}<CR>",
        { silent = true, expr = false },
        mode = {
          "n",
        },
        desc = "Telescope DAP frames",
      },
    },
  },
  {
    "nvim-telescope/telescope.nvim",
    optional = true,
    dependencies = { "telescope_dap" },
    opts = function() require("telescope").load_extension "dap" end,
  },
}
