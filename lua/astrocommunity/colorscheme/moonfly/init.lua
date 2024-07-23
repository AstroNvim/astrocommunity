return {
  "bluz71/vim-moonfly-colors",
  name = "moonfly",
  lazy = true,
  dependencies = {
    {
      "AstroNvim/astrocore",
      opts = {
        options = {
          opt = {
            fillchars = {
              horiz = "━",
              horizup = "┻",
              horizdown = "┳",
              vert = "┃",
              vertleft = "┫",
              vertright = "┣",
              verthoriz = "╋",
            },
          },
          g = {
            moonflyCursorColor = true,
            moonflyNormalFloat = true,
            moonflyUnderlineMatchParen = true,
            moonflyVirtualTextColor = true,
            moonflyWinSeparator = 2,
          },
        },
      },
    },
  },
}
