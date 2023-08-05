local prefix = "<leader>s"
local maps = { n = {}, x = {} }

local icon = vim.g.icons_enabled and "󰛔 " or ""
maps.n[prefix] = { desc = icon .. "Search / Replace" }
maps.x[prefix] = { desc = icon .. "Search / Replace" }

require("astrocore").set_mappings(maps)

return {
  {
    "AstroNvim/astrocore",
    opts = {
      mappings = {
        n = {
          [prefix .. "s"] = { "<cmd>lua require('spectre').open()<CR>", desc = "Spectre" },
          [prefix .. "f"] = {
            "<cmd>lua require('spectre').open_file_search()<CR>",
            desc = "Spectre (current file)",
          },
        },
        x = {
          [prefix .. "w"] = {
            "<cmd>lua require('spectre').open_visual({select_word=true})<CR>",
            desc = "Spectre (current word)",
          },
        },
      },
    },
  },
  {
    "nvim-pack/nvim-spectre",
    cmd = "Spectre",
    opts = function()
      return {
        mapping = {
          send_to_qf = { map = "q" },
          replace_cmd = { map = "c" },
          show_option_menu = { map = "o" },
          run_current_replace = { map = "C" },
          run_replace = { map = "R" },
          change_view_mode = { map = "v" },
          resume_last_search = { map = "l" },
        },
      }
    end,
  },
  {
    "folke/edgy.nvim",
    optional = true,
    opts = function(_, opts)
      if not opts.bottom then opts.bottom = {} end
      table.insert(opts.bottom, { ft = "spectre_panel", title = "Search/Replace", size = { height = 0.4 } })
    end,
  },
}
