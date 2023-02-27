return {
  "echasnovski/mini.basics",
  version = false,
  init = function() table.insert(astronvim.file_plugins, "mini.basics") end,
  config = function(_, opts) require("mini.basics").setup(opts) end,
  opts = {
    mappings = {
      windows = true,
      move_with_alt = true,
    },
  },
}
