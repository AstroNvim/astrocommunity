return {
  {
    "AstroNvim/astrocore",
    opts = {
      mappings = {
        n = {
          ["<leader>p"] = { "<cmd>Telescope yank_history<CR>", desc = "Open Yank History" },
          ["y"] = { "<Plug>(YankyYank)", desc = "Yank text" },
          ["p"] = { "<Plug>(YankyPutAfter)", desc = "Put yanked text after cursor" },
          ["P"] = { "<Plug>(YankyPutBefore)", desc = "Put yanked text before cursor" },
          ["gp"] = { "<Plug>(YankyGPutAfter)", desc = "Put yanked text after selection" },
          ["gP"] = { "<Plug>(YankyGPutBefore)", desc = "Put yanked text before selection" },
          ["[y"] = { "<Plug>(YankyCycleForward)", desc = "Cycle forward through yank history" },
          ["]y"] = { "<Plug>(YankyCycleBackward)", desc = "Cycle backward through yank history" },
          ["]p"] = { "<Plug>(YankyPutIndentAfterLinewise)", desc = "Put indented after cursor (linewise)" },
          ["[p"] = { "<Plug>(YankyPutIndentBeforeLinewise)", desc = "Put indented before cursor (linewise)" },
          ["]P"] = { "<Plug>(YankyPutIndentAfterLinewise)", desc = "Put indented after cursor (linewise)" },
          ["[P"] = { "<Plug>(YankyPutIndentBeforeLinewise)", desc = "Put indented before cursor (linewise)" },
          [">p"] = { "<Plug>(YankyPutIndentAfterShiftRight)", desc = "Put and indent right" },
          ["<p"] = { "<Plug>(YankyPutIndentAfterShiftLeft)", desc = "Put and indent left" },
          [">P"] = { "<Plug>(YankyPutIndentBeforeShiftRight)", desc = "Put before and indent right" },
          ["<P"] = { "<Plug>(YankyPutIndentBeforeShiftLeft)", desc = "Put before and indent left" },
          ["=p"] = { "<Plug>(YankyPutAfterFilter)", desc = "Put after applying a filter" },
          ["=P"] = { "<Plug>(YankyPutBeforeFilter)", desc = "Put before applying a filter" },
        },
        x = {
          ["y"] = { "<Plug>(YankyYank)", desc = "Yank text" },
          ["p"] = { "<Plug>(YankyPutAfter)", desc = "Put yanked text after cursor" },
          ["P"] = { "<Plug>(YankyPutBefore)", desc = "Put yanked text before cursor" },
          ["gp"] = { "<Plug>(YankyGPutAfter)", desc = "Put yanked text after selection" },
          ["gP"] = { "<Plug>(YankyGPutBefore)", desc = "Put yanked text before selection" },
        },
      },
    },
  },
  {
    "gbprod/yanky.nvim",
    dependencies = { { "kkharji/sqlite.lua", enabled = not jit.os:find "Windows" } },
    opts = function()
      local mapping = require "yanky.telescope.mapping"
      local mappings = mapping.get_defaults()
      mappings.i["<c-p>"] = nil
      return {
        highlight = { timer = 200 },
        ring = { storage = jit.os:find "Windows" and "shada" or "sqlite" },
        picker = {
          telescope = {
            use_default_mappings = false,
            mappings = mappings,
          },
        },
      }
    end,
  },
}
