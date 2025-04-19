local prefix = "gz"
return {
  "echasnovski/mini.surround",
  dependencies = {
    { "AstroNvim/astroui", opts = { icons = { Surround = "󰑤" } } },
    {
      "AstroNvim/astrocore",
      opts = function(_, opts)
        local maps = opts.mappings
        maps.n[prefix] = { desc = require("astroui").get_icon("Surround", 1, true) .. "Surround" }
      end,
    },
  },
  keys = function(_, keys)
    local plugin = require("lazy.core.config").spec.plugins["mini.surround"]
    local opts = require("lazy.core.plugin").values(plugin, "opts", false) -- resolve mini.clue options
    -- Populate the keys based on the user's options
    local mappings = {
      { opts.mappings.add, desc = "Add surrounding", mode = { "n", "v" } },
      { opts.mappings.delete, desc = "Delete surrounding" },
      { opts.mappings.find, desc = "Find right surrounding" },
      { opts.mappings.find_left, desc = "Find left surrounding" },
      { opts.mappings.highlight, desc = "Highlight surrounding" },
      { opts.mappings.replace, desc = "Replace surrounding" },
      { opts.mappings.update_n_lines, desc = "Update `MiniSurround.config.n_lines`" },
    }
    mappings = vim.tbl_filter(function(m) return m[1] and #m[1] > 0 end, mappings)
    return vim.list_extend(mappings, keys)
  end,
  opts = {
    mappings = {
      add = prefix .. "a", -- Add surrounding in Normal and Visual modes
      delete = prefix .. "d", -- Delete surrounding
      find = prefix .. "f", -- Find surrounding (to the right)
      find_left = prefix .. "F", -- Find surrounding (to the left)
      highlight = prefix .. "h", -- Highlight surrounding
      replace = prefix .. "r", -- Replace surrounding
      update_n_lines = prefix .. "n", -- Update `n_lines`
    },
  },
  specs = {
    {
      "catppuccin",
      optional = true,
      ---@type CatppuccinOptions
      opts = { integrations = { mini = true } },
    },
  },
}
