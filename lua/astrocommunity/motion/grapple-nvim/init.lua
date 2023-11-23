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
        maps.n[prefix .. "a"] = { "<CMD>GrappleTag<CR>", desc = "Add file" }
        maps.n[prefix .. "d"] = { "<CMD>GrappleUntag<CR>", desc = "Remove file" }
        maps.n[prefix .. "t"] = { "<CMD>GrappleToggle<CR>", desc = "Toggle a file" }
        maps.n[prefix .. "e"] = { "<CMD>GrapplePopup tags<CR>", desc = "Select from tags" }
        maps.n[prefix .. "s"] = { "<CMD>GrapplePopup scopes<CR>", desc = "Select a project scope" }
        maps.n[prefix .. "x"] = { "<CMD>GrappleReset<CR>", desc = "Clear tags from current project" }
        maps.n["<C-n>"] = { "<CMD>GrappleCycle forward<CR>", desc = "Select next tag" }
        maps.n["<C-p>"] = { "<CMD>GrappleCycle backward<CR>", desc = "Select previous tag" }
      end,
    },
  },
  cmd = "Grapple",
}
