return {
  "bluz71/vim-nightfly-colors",
  name = "nightfly",
  lazy = true,
  dependencies = {
    {
      "AstroNvim/astrocore",
      opts = {
        options = {
          g = {
            nightflyCursorColor = true,
            nightflyNormalFloat = true,
            nightflyUnderlineMatchParen = true,
            nightflyVirtualTextColor = true,
            nightflyWinSeparator = 2,
          },
        },
      },
    },
  },
}
