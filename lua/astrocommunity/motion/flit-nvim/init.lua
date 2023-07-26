local keys = {}
for _, key in ipairs { "f", "F", "t", "T" } do
  keys[key] = { key, desc = key }
end

return {
  {
    "AstroNvim/astrocore",
    opts = {
      mappings = {
        n = keys,
        x = keys,
        o = keys,
      },
    },
  },

  {
    "ggandor/flit.nvim",
    opts = { labeled_modes = "nx" },
    dependencies = {
      "ggandor/leap.nvim",
      dependencies = {
        "tpope/vim-repeat",
      },
    },
  },
}
