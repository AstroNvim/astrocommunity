return {
  {
    "folke/which-key.nvim",
    enabled = false,
  },
  {
    "echasnovski/mini.clue",
    keys = {
      "<Leader>",
    },
    dependecies = { "AstroNvim/astrocore" },
    opts = function()
      local miniclue = require "mini.clue"
      local astrocore_clues = {}
      for mode, maps in pairs(require("astrocore").which_key_queue) do
        for keys, map in pairs(maps) do
          if type(map) == "table" then
            local desc = map.name or map.desc
            if desc then table.insert(astrocore_clues, { mode = mode, keys = keys, desc = desc }) end
          end
        end
      end
      return {
        window = {
          config = { anchor = "SW", row = "auto", col = "auto", border = "none" },
        },
        triggers = {
          -- Leader triggers
          { mode = "n", keys = "<Leader>" },
          { mode = "x", keys = "<Leader>" },

          -- Built-in completion
          { mode = "i", keys = "<C-x>" },

          -- `g` key
          { mode = "n", keys = "g" },
          { mode = "x", keys = "g" },

          -- Marks
          { mode = "n", keys = "'" },
          { mode = "n", keys = "`" },
          { mode = "x", keys = "'" },
          { mode = "x", keys = "`" },

          -- Registers
          { mode = "n", keys = '"' },
          { mode = "x", keys = '"' },
          { mode = "i", keys = "<C-r>" },
          { mode = "c", keys = "<C-r>" },

          -- Window commands
          { mode = "n", keys = "<C-w>" },

          -- `z` key
          { mode = "n", keys = "z" },
          { mode = "x", keys = "z" },
        },
        clues = {
          astrocore_clues,
          miniclue.gen_clues.builtin_completion(),
          miniclue.gen_clues.g(),
          miniclue.gen_clues.marks(),
          miniclue.gen_clues.registers(),
          miniclue.gen_clues.windows(),
          miniclue.gen_clues.z(),
          require("astrocore").which_key_register(),
        },
      }
    end,
  },
}
