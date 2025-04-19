return {
  "AstroNvim/astrolsp",
  init = function()
    require("astrocore").notify(
      "automatic signature help is now build into AstroLSP, enable it with `features.signature_help` in the AstroLSP `opts`",
      vim.log.levels.WARN
    )
  end,
  ---@type AstroLSPOpts
  opts = { features = { signature_help = true } },
}
