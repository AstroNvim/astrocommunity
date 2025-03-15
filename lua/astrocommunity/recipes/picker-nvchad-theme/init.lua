return {
  {
    "nvim-telescope/telescope.nvim",
    optional = true,
    specs = {
      {
        "AstroNvim/astroui",
        ---@param opts AstroUIOpts
        opts = function(_, opts)
          if not opts.highlights then opts.highlights = {} end
          local original_init = opts.highlights.init
          local init_function
          if type(original_init) == "table" then
            init_function = function() return original_init end
          else
            init_function = original_init
          end
          opts.highlights.init = require("astrocore").patch_func(init_function, function(orig, colors_name)
            local highlights = orig(colors_name) or {}

            local get_hlgroup = require("astroui").get_hlgroup
            -- get highlights from highlight groups
            local normal = get_hlgroup "Normal"
            local fg, bg = normal.fg, normal.bg
            local bg_alt = get_hlgroup("Visual").bg
            local green = get_hlgroup("String").fg
            local red = get_hlgroup("Error").fg
            -- return a table of highlights for telescope based on
            -- colors gotten from highlight groups
            highlights.TelescopeBorder = { fg = bg_alt, bg = bg }
            highlights.TelescopeNormal = { bg = bg }
            highlights.TelescopePreviewBorder = { fg = bg, bg = bg }
            highlights.TelescopePreviewNormal = { bg = bg }
            highlights.TelescopePreviewTitle = { fg = bg, bg = green }
            highlights.TelescopePromptBorder = { fg = bg_alt, bg = bg_alt }
            highlights.TelescopePromptNormal = { fg = fg, bg = bg_alt }
            highlights.TelescopePromptPrefix = { fg = red, bg = bg_alt }
            highlights.TelescopePromptTitle = { fg = bg, bg = red }
            highlights.TelescopeResultsBorder = { fg = bg, bg = bg }
            highlights.TelescopeResultsNormal = { bg = bg }
            highlights.TelescopeResultsTitle = { fg = bg, bg = bg }
            return highlights
          end)
        end,
      },
    },
  },
  {
    "folke/snacks.nvim",
    optional = true,
    specs = {
      {
        "AstroNvim/astroui",
        ---@param opts AstroUIOpts
        opts = function(_, opts)
          if not opts.highlights then opts.highlights = {} end
          local original_init = opts.highlights.init
          local init_function
          if type(original_init) == "table" then
            init_function = function() return original_init end
          else
            init_function = original_init
          end
          opts.highlights.init = require("astrocore").patch_func(init_function, function(orig, colors_name)
            local highlights = orig(colors_name) or {}

            local get_hlgroup = require("astroui").get_hlgroup
            -- get highlights from highlight groups
            local bg = get_hlgroup("Normal").bg
            local bg_alt = get_hlgroup("Visual").bg
            local green = get_hlgroup("String").fg
            local red = get_hlgroup("Error").fg
            -- return a table of highlights for telescope based on
            -- colors gotten from highlight groups
            highlights.SnacksPickerBorder = { fg = bg_alt, bg = bg }
            highlights.SnacksPicker = { bg = bg }
            highlights.SnacksPickerPreviewBorder = { fg = bg, bg = bg }
            highlights.SnacksPickerPreview = { bg = bg }
            highlights.SnacksPickerPreviewTitle = { fg = bg, bg = green }
            highlights.SnacksPickerBoxBorder = { fg = bg, bg = bg }
            highlights.SnacksPickerInputBorder = { fg = bg, bg = bg }
            highlights.SnacksPickerInputSearch = { fg = red, bg = bg }
            highlights.SnacksPickerListBorder = { fg = bg, bg = bg }
            highlights.SnacksPickerList = { bg = bg }
            highlights.SnacksPickerListTitle = { fg = bg, bg = bg }
            return highlights
          end)
        end,
      },
    },
  },
}
