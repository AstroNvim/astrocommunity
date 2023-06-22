return {
  "m4xshen/hardtime.nvim",
  event = "User AstroFile",
  opts = {
    hint_keys = {
      "k",
      "j",
      "^",
      -- "$", -- conflict with motion.leap-nvim
      "a",
      "i",
      "d",
      "y",
      "c",
      -- "l", -- conflict with motion.leap-nvim
    },
    disabled_keys = {
      "<UP>",
      "<DOWN>",
      "<LEFT>",
      "<RIGHT>",
      "<Insert>",
      "<Home>",
      "<End>",
      "<PageUp>",
      "<PageDown>",
    },
    disabled_filetypes = {
      "qf",
      "netrw",
      "NvimTree",
      "lazy",
      "mason",
      "prompt",
      "TelescopePrompt",
      "noice",
      "notify",
      "neo-tree",
    },
  },
}
