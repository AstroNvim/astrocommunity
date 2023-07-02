return {
  "m4xshen/hardtime.nvim",
  event = "User AstroFile",
  opts = {
    disabled_keys = {
      ["<UP>"] = { "", "i" },
      ["<DOWN>"] = { "", "i" },
      ["<LEFT>"] = { "", "i" },
      ["<RIGHT>"] = { "", "i" },
      ["<Insert>"] = { "", "i" },
      ["<Home>"] = { "", "i" },
      ["<End>"] = { "", "i" },
      ["<PageUp>"] = { "", "i" },
      ["<PageDown>"] = { "", "i" },
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
