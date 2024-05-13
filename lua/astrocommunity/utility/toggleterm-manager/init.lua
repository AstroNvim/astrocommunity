return {
  {
    "ryanmsnyder/toggleterm-manager.nvim",
    opts = function(_, opts)
      local toggleterm_manager = require "toggleterm-manager"
      local actions = toggleterm_manager.actions

      local mappings = {
        i = {
          ["<CR>"] = { action = actions.toggle_term, exit_on_action = true }, -- toggles terminal open/closed
          ["<C-i>"] = { action = actions.create_term, exit_on_action = false }, -- creates a new terminal buffer
          ["<C-d>"] = { action = actions.delete_term, exit_on_action = false }, -- deletes a terminal buffer
          ["<C-r>"] = { action = actions.rename_term, exit_on_action = false }, -- provides a prompt to rename a terminal
        },
        n = {
          ["<CR>"] = { action = actions.toggle_term, exit_on_action = true }, -- toggles terminal open/closed
          ["r"] = { action = actions.rename_term, exit_on_action = false }, -- provides a prompt to rename a terminal
          ["d"] = { action = actions.delete_term, exit_on_action = false }, -- deletes a terminal buffer
          ["n"] = { action = actions.create_term, exit_on_action = false }, -- creates a new terminal buffer
        },
      }

      if not opts.mappings then
        opts.mappings = mappings
      else
        opts.mappings = vim.tbl_deep_extend("force", opts.mappings, mappings)
      end
    end,

    config = function(_, opts)
      local toggleterm_manager = require "toggleterm-manager"
      toggleterm_manager.setup(opts)
    end,
    dependencies = {
      "akinsho/nvim-toggleterm.lua",
      "nvim-telescope/telescope.nvim",
      "nvim-lua/plenary.nvim", -- only needed because it's a dependency of telescope
      {
        "AstroNvim/astrocore",
        opts = {
          mappings = {
            n = {
              ["<Leader>ts"] = { "<cmd>Telescope toggleterm_manager<cr>", desc = "Toggleterm" },
            },
          },
        },
      },
    },
  },
}
