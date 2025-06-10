return {
  "catppuccin/nvim",
  name = "catppuccin",
  lazy = true,
  ---@type CatppuccinOptions
  opts = {
    integrations = {
      aerial = true,
      alpha = true,
      blink_cmp = true,
      cmp = true,
      dap = true,
      dap_ui = true,
      gitsigns = true,
      illuminate = true,
      indent_blankline = true,
      markdown = true,
      mason = true,
      native_lsp = { enabled = true },
      neotree = true,
      notify = true,
      semantic_tokens = true,
      symbols_outline = true,
      telescope = true,
      treesitter = true,
      ts_rainbow = false,
      ufo = true,
      which_key = true,
      window_picker = true,
      colorful_winsep = { enabled = true, color = "lavender" },
      snacks = {
        enabled = true,
        indent_scope_color = "lavender",
      },
    },
  },
  specs = {
    {
      "akinsho/bufferline.nvim",
      optional = true,
      opts = function(_, opts)
        return require("astrocore").extend_tbl(opts, {
          highlights = require("catppuccin.groups.integrations.bufferline").get(),
        })
      end,
    },
    {
      "famiu/feline.nvim",
      optional = true,
      opts = function(_, opts)
        local ctp_feline = require "catppuccin.groups.integrations.feline"
        ctp_feline.setup()

        return require("astrocore").extend_tbl(opts, { components = ctp_feline.get() })
      end,
    },
    {
      "nvimdev/lspsaga.nvim",
      optional = true,
      opts = {
        ui = {
          kind = require("catppuccin.groups.integrations.lsp_saga").custom_kind(),
        },
      },
    },
    {
      "nvim-lualine/lualine.nvim",
      optional = true,
      opts = {
        options = {
          theme = "catppuccin",
        },
      },
    },
  },
}
