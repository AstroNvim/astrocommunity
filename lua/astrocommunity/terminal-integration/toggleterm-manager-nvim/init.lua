return {
  "ryanmsnyder/toggleterm-manager.nvim",
  lazy = true,
  init = function(plugin) require("astrocore").on_load("telescope.nvim", plugin.name) end,
  dependencies = {
    "akinsho/toggleterm.nvim",
    "nvim-telescope/telescope.nvim",
    "nvim-lua/plenary.nvim",
    {
      "AstroNvim/astrocore",
      opts = {
        mappings = {
          n = {
            ["<Leader>ts"] = { "<cmd>Telescope toggleterm_manager<cr>", desc = "Search Toggleterms" },
          },
        },
      },
    },
  },
  opts = function(_, opts)
    local term_icon = require("astroui").get_icon "Terminal"
    local toggleterm_manager = require "toggleterm-manager"
    local actions = toggleterm_manager.actions

    return require("astrocore").extend_tbl(opts, {
      titles = { prompt = term_icon .. " Terminals" },
      results = { term_icon = term_icon },
      mappings = {
        n = {
          ["<CR>"] = { action = actions.toggle_term, exit_on_action = true }, -- toggles terminal open/closed
          ["r"] = { action = actions.rename_term, exit_on_action = false }, -- provides a prompt to rename a terminal
          ["d"] = { action = actions.delete_term, exit_on_action = false }, -- deletes a terminal buffer
          ["n"] = { action = actions.create_term, exit_on_action = false }, -- creates a new terminal buffer
        },
        i = {
          ["<CR>"] = { action = actions.toggle_term, exit_on_action = true }, -- toggles terminal open/closed
          ["<C-r>"] = { action = actions.rename_term, exit_on_action = false }, -- provides a prompt to rename a terminal
          ["<C-d>"] = { action = actions.delete_term, exit_on_action = false }, -- deletes a terminal buffer
          ["<C-n>"] = { action = actions.create_term, exit_on_action = false }, -- creates a new terminal buffer
        },
      },
    })
  end,
}
