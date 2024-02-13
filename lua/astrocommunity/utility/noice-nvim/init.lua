return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      if opts.ensure_installed ~= "all" then
        opts.ensure_installed = require("astrocore").list_insert_unique(
          opts.ensure_installed,
          "bash",
          "markdown",
          "markdown_inline",
          "regex",
          "vim"
        )
      end
    end,
  },
  {
    "AstroNvim/astrolsp",
    ---@param opts AstroLSPOpts
    opts = function(_, opts)
      local noice_opts = require("astrocore").plugin_opts "noice.nvim"
      if -- check if noice handlers are disabled
        vim.tbl_get(noice_opts, "lsp", "hover", "enabled") ~= false
        or vim.tbl_get(noice_opts, "lsp", "signature", "enabled") ~= false
      then
        if not opts.features then opts.features = {} end
        opts.features.lsp_handlers = false
      end
    end,
  },
  {
    "heirline.nvim",
    optional = true,
    opts = function(_, opts)
      local noice_opts = require("astrocore").plugin_opts "noice.nvim"
      if vim.tbl_get(noice_opts, "lsp", "progress", "enabled") ~= false then -- check if lsp progress is enabled
        opts.statusline[9] = require("astroui.status").component.lsp { lsp_progress = false }
      end
    end,
  },
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = { "MunifTanjim/nui.nvim" },
    opts = function(_, opts)
      local utils = require "astrocore"
      return utils.extend_tbl(opts, {
        lsp = {
          -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
          override = {
            ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
            ["vim.lsp.util.stylize_markdown"] = true,
            ["cmp.entry.get_documentation"] = true,
          },
        },
        presets = {
          bottom_search = true, -- use a classic bottom cmdline for search
          command_palette = true, -- position the cmdline and popupmenu together
          long_message_to_split = true, -- long messages will be sent to a split
          inc_rename = utils.is_available "inc-rename.nvim", -- enables an input dialog for inc-rename.nvim
          lsp_doc_border = false, -- add a border to hover docs and signature help
        },
      })
    end,
  },
  {
    "folke/edgy.nvim",
    optional = true,
    opts = function(_, opts)
      if not opts.bottom then opts.bottom = {} end
      table.insert(opts.bottom, {
        ft = "noice",
        size = { height = 0.4 },
        filter = function(_, win) return vim.api.nvim_win_get_config(win).relative == "" end,
      })
    end,
  },
  {
    "catppuccin/nvim",
    optional = true,
    ---@type CatppuccinOptions
    opts = { integrations = { noice = true } },
  },
}
