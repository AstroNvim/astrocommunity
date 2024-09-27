-- pick a location to cache colorscheme
local colorscheme_cache = vim.fs.joinpath(vim.fn.stdpath "state" --[[@as string]], "last_colorscheme")

return {
  {
    "AstroNvim/astroui",
    --@param opts AstroUIOpts
    opts = function(_, opts)
      -- read colorscheme cache on open
      require("astrocore").with_file(colorscheme_cache, "r", function(file) opts.colorscheme = file:read "*a" end)
    end,
  },
  {
    "AstroNvim/astrocore",
    ---@type AstroCoreOpts
    opts = {
      autocmds = {
        -- save colorscheme to cache on change
        cache_colorscheme = {
          {
            event = "ColorScheme",
            callback = function(args)
              if args.match then
                require("astrocore").with_file(colorscheme_cache, "w+", function(file) file:write(args.match) end)
              end
            end,
          },
        },
      },
    },
  },
}
