---@type LazySpec
return {
  {
    "AstroNvim/astrocore",
    ---@type AstroCoreOpts
    opts = { filetypes = { extension = {
      nf = "nextflow",
      ["nf.test"] = "nextflow",
    } } },
  },
  { "nextflow-io/vim-language-nextflow", ft = "nextflow" },
  {
    "L3MON4D3/LuaSnip",
    optional = true,
    specs = {
      "nextflow-io/vscode-language-nextflow",
      ft = "nextflow",
      dependencies = { "L3MON4D3/LuaSnip" },
      config = function(plugin)
        require("luasnip.loaders.from_vscode").lazy_load {
          paths = { plugin.dir },
        }
      end,
    },
  },
  {
    "echasnovski/mini.icons",
    optional = true,
    opts = {
      filetype = {
        nextflow = { glyph = "󰉛", hl = "MiniIconsGreen" },
      },
    },
  },
}
