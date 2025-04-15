return {
  "brenton-leighton/multiple-cursors.nvim",
  cmd = {
    "MultipleCursorsAddDown",
    "MultipleCursorsAddUp",
    "MultipleCursorsMouseAddDelete",
    "MultipleCursorsAddMatches",
    "MultipleCursorsAddMatchesV",
    "MultipleCursorsAddJumpNextMatch",
    "MultipleCursorsJumpNextMatch",
    "MultipleCursorsLock",
  },
  dependencies = {
    { "AstroNvim/astroui", opts = { icons = { MultipleCursors = "󰗧" } } },
    {
      "AstroNvim/astrocore",
      opts = function(_, opts)
        local maps = opts.mappings
        for lhs, map in pairs {
          ["<C-Down>"] = { "<Cmd>MultipleCursorsAddDown<CR>", desc = "Add cursor down" },
          ["<C-Up>"] = { "<Cmd>MultipleCursorsAddUp<CR>", desc = "Add cursor up" },
          ["<C-LeftMouse>"] = { "<Cmd>MultipleCursorsMouseAddDelete<CR>", desc = "Add cursor with mouse" },
        } do
          maps.n[lhs] = map
          maps.i[lhs] = map
        end
        local prefix = "<Leader>m"
        for lhs, map in pairs {
          [prefix] = { desc = require("astroui").get_icon("MultipleCursors", 1, true) .. "MultipleCursors" },
          [prefix .. "a"] = { "<Cmd>MultipleCursorsAddMatches<CR>", desc = "Add cursor matches" },
          [prefix .. "A"] = {
            "<Cmd>MultipleCursorsAddMatchesV<CR>",
            desc = "Add cursor matches in previous visual area",
          },
          [prefix .. "j"] = { "<Cmd>MultipleCursorsAddJumpNextMatch<CR>", desc = "Add cursor and jump to next match" },
          [prefix .. "J"] = { "<Cmd>MultipleCursorsJumpNextMatch<CR>", desc = "Move cursor to next match" },
          [prefix .. "l"] = { "<Cmd>MultipleCursorsLock<CR>", desc = "Lock virtual cursors" },
        } do
          maps.n[lhs] = map
          maps.x[lhs] = map
        end
      end,
    },
  },
  opts = {},
}
