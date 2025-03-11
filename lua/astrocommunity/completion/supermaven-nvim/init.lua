return {
  "supermaven-inc/supermaven-nvim",
  event = "VeryLazy",
  opts = {
    keymaps = {
      accept_suggestion = false,
      clear_suggestion = "<C-h>",
      accept_word = "<C-w>",
    },
    log_level = "warn",
    disable_inline_completion = false, -- disables inline completion for use with cmp
    disable_keymaps = false, -- disables built in keymaps for more manual control
  },
  specs = {
    { import = "astrocommunity.recipes.ai" },
    {
      "AstroNvim/astrocore",
      opts = {
        options = {
          g = {
            -- set the ai_accept function
            ai_accept = function()
              if require("supermaven-nvim.completion_preview").has_suggestion() then
                vim.schedule(function() require("supermaven-nvim.completion_preview").on_accept_suggestion() end)
                return true
              end
            end,
          },
        },
      },
    },
  },
}
