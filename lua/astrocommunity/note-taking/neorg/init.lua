return {
  "nvim-neorg/neorg",
  version = "^9",
  event = "VeryLazy",
  dependencies = { "nvim-treesitter/nvim-treesitter" },
  opts = {
    load = {
      ["core.defaults"] = {}, -- Loads default behaviour
      ["core.concealer"] = {}, -- Adds pretty icons to your documents
      ["core.keybinds"] = {}, -- Adds default keybindings
      ["core.completion"] = {
        config = {
          engine = "nvim-cmp",
        },
      }, -- Enables support for completion plugins
      ["core.journal"] = {}, -- Enables support for the journal module
      ["core.dirman"] = { -- Manages Neorg workspaces
        config = {
          workspaces = {
            notes = "~/projects/notes",
          },
          default_workspace = "notes",
        },
      },
    },
  },
  specs = {
    {
      "nvim-treesitter/nvim-treesitter",
      opts = function(_, opts)
        if opts.ensure_installed ~= "all" then
          opts.ensure_installed =
            require("astrocore").list_insert_unique(opts.ensure_installed, { "norg", "norg_meta" })
        end
      end,
    },
  },
}
