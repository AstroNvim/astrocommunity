return {
  {
    "AstroNvim/astrocore",
    ---@type AstroCoreOpts
    opts = {
      filetypes = {
        extension = { just = "just" },
        filename = {
          justfile = "just",
          Justfile = "just",
          [".Justfile"] = "just",
          [".justfile"] = "just",
        },
      },
    },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    optional = true,
    opts = function(_, opts) require("astrocore").list_insert_unique(opts.ensure_installed, { "just" }) end,
  },
}
