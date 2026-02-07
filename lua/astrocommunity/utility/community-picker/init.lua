---@type LazySpec
return {
  {
    "AstroNvim/astrocore",
    ---@param opts AstroCoreOpts
    opts = function(_, opts)
      if not opts.mappings then opts.mappings = {} end
      if not opts.mappings.n then opts.mappings.n = {} end
      
      opts.mappings.n["<Leader>pc"] = {
        function() require("astrocommunity.utility.community-picker.picker").open() end,
        desc = "Community Plugins",
      }
    end,
  },
  { "MunifTanjim/nui.nvim", lazy = true },
}
