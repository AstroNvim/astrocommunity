return {
  "cbochs/grapple.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "AstroNvim/astroui", opts = { icons = { Grapple = "󰛢" } } },
    {
      "AstroNvim/astrocore",
      opts = function(_, opts)
        local maps = opts.mappings
        local prefix = "<Leader><Leader>"
        maps.n[prefix] = { desc = require("astroui").get_icon("Grapple", 1, true) .. "Grapple" }
        maps.n[prefix .. "a"] = { "<CMD>Grapple tag<CR>", desc = "Add file" }
        maps.n[prefix .. "d"] = { "<CMD>Grapple untag<CR>", desc = "Remove file" }
        maps.n[prefix .. "t"] = { "<CMD>Grapple toggle_tags<CR>", desc = "Toggle a file" }
        maps.n[prefix .. "e"] = { "<CMD>Grapple toggle_scopes<CR>", desc = "Select from tags" }
        maps.n[prefix .. "s"] = { "<CMD>Grapple toggle_loaded<CR>", desc = "Select a project scope" }
        maps.n[prefix .. "x"] = { "<CMD>Grapple reset<CR>", desc = "Clear tags from current project" }
        maps.n["<C-n>"] = { "<CMD>Grapple cycle forward<CR>", desc = "Select next tag" }
        maps.n["<C-p>"] = { "<CMD>Grapple cycle backward<CR>", desc = "Select previous tag" }
      end,
    },
    { "nvim-tree/nvim-web-devicons", lazy = true },
  },
  cmd = { "Grapple" },
}
