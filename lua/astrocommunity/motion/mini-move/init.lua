return {
  {
    "echasnovski/mini.move",
    keys = function(plugin, keys)
      -- Populate the keys based on the user's options
      local mappings = {
        { plugin.opts.mappings.line_left, desc = "Move line left" },
        { plugin.opts.mappings.line_right, desc = "Move line right" },
        { plugin.opts.mappings.line_down, desc = "Move line down" },
        { plugin.opts.mappings.line_up, desc = "Move line up" },
        { plugin.opts.mappings.left, desc = "Move selection left", mode = "v" },
        { plugin.opts.mappings.right, desc = "Move selection right", mode = "v" },
        { plugin.opts.mappings.down, desc = "Move selection down", mode = "v" },
        { plugin.opts.mappings.up, desc = "Move selection up", mode = "v" },
      }
      mappings = vim.tbl_filter(function(m) return m[1] and #m[1] > 0 end, mappings)
      return vim.list_extend(mappings, keys)
    end,
    opts = {
      mappings = {
        left = "<A-h>",
        right = "<A-l>",
        down = "<A-j>",
        up = "<A-k>",
        line_left = "<A-h>",
        line_right = "<A-l>",
        line_down = "<A-j>",
        line_up = "<A-k>",
      },
    },
  },
  {
    "catppuccin/nvim",
    optional = true,
    ---@type CatppuccinOptions
    opts = { integrations = { mini = true } },
  },
}
