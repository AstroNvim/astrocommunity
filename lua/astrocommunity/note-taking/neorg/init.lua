return {
  "nvim-neorg/neorg",
  build = ":Neorg sync-parsers",
  -- Pinned to last commit before v8.0.0's breaking changes as a temp fix
  -- TODO: remove this in AstroNvim v4 when #813 is merged
  commit = "583a82e",
  dependencies = { "nvim-lua/plenary.nvim" },
  event = "VeryLazy",
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
        },
      },
    },
  },
}
