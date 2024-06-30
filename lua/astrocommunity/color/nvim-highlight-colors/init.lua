return {
  { "NvChad/nvim-colorizer.lua", enabled = false },
  {
    "brenoprata10/nvim-highlight-colors",
    event = "User AstroFile",
    cmd = "HighlightColors",
    dependencies = {
      {
        "AstroNvim/astrocore",
        opts = function(_, opts)
          local maps = opts.mappings
          maps.n["<Leader>uz"] = { function() vim.cmd.HighlightColors "Toggle" end, desc = "Toggle color highlight" }
        end,
      },
    },
    opts = { enabled_named_colors = false },
  },
  {
    "hrsh7th/nvim-cmp",
    optional = true,
    opts = function(_, opts)
      if not opts.formatting then opts.formatting = {} end
      local formatter = vim.tbl_get(opts, "formatting", "format")
      opts.formatting.format = function(entry, item)
        if formatter then
          local color_item = require("nvim-highlight-colors").format(entry, { kind = item.kind })
          item = formatter(entry, item)
          if color_item.abbr_hl_group then
            item.kind_hl_group = color_item.abbr_hl_group
            item.kind = color_item.abbr
          end
        else
          item = require("nvim-highlight-colors").format(entry, item)
        end
        return item
      end
    end,
  },
}
