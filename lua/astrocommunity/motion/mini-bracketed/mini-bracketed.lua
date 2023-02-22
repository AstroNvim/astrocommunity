return {
  "echasnovski/mini.bracketed",
  init = function() table.insert(astronvim.file_plugins, "mini.bracketed") end,
  config = function(_, opts) require("mini.bracketed").setup(opts) end,
  version = false,
}
