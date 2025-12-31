---@type LazySpec
return {
  "brianhuster/live-preview.nvim",
  ft = { "markdown", "markdown.mdx", "html", "asciidoc", "svg" },
  cmd = { "LivePreview" },
  specs = {
    { "AstroNvim/astroui", opts = { icons = { LivePreview = "󰐩" } } },
    {
      "AstroNvim/astrocore",
      optional = true,
      opts = function(_, opts)
        local maps = opts.mappings
        local prefix = "<Leader>P"

        maps.n[prefix] = { desc = require("astroui").get_icon("LivePreview", 1, true) .. "Preview" }
        maps.n[prefix .. "s"] = { "<cmd>LivePreview start<cr>", desc = "Start" }
        maps.n[prefix .. "c"] = { "<cmd>LivePreview close<cr>", desc = "Close" }
        maps.n[prefix .. "p"] = { "<cmd>LivePreview pick<cr>", desc = "Pick" }
      end,
    },

    -- INFO: One of the following pickers will be choose based on user preferences
    { "folke/snacks.nvim", optional = true },
    { "nvim-telescope/telescope.nvim", optional = true },
    { "ibhagwan/fzf-lua", optional = true },
    { "echasnovski/mini.pick", optional = true },
  },
}
