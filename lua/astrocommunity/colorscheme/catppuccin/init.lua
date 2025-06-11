return {
  "catppuccin/nvim",
  name = "catppuccin",
  lazy = true,
  ---@type CatppuccinOptions
  opts = {
    integrations = {
      aerial = true,
      alpha = true,
      beacon = true,
      blink_cmp = true,
      coc_nvim = true,
      colorful_winsep = {
        enabled = true,
        color = "lavender",
      },
      dashboard = true,
      diffview = true,
      dropbar = { enabled = true },
      fern = true,
      fidget = true,
      flash = true,
      fzf = true,
      gitgraph = true,
      gitsigns = true,
      grug_far = true,
      harpoon = true,
      headlines = true,
      hop = true,
      leap = true,
      lightspeed = true,
      lir = { enabled = true, git_status = true },
      lsp_saga = true,
      markdown = true,
      markview = true,
      mason = true,
      neotree = true,
      neogit = true,
      neotest = true,
      noice = true,
      notifier = true,
      cmp = true,
      copilot_vim = true,
      dap = true,
      dap_ui = true,
      navic = { enabled = true },
      notify = true,
      semantic_tokens = true,
      nvim_surround = true,
      nvimtree = true,
      treesitter_context = true,
      treesitter = true,
      ts_rainbow2 = true,
      ts_rainbow = true,
      ufo = true,
      window_picker = true,
      octo = true,
      overseer = true,
      pounce = true,
      rainbow_delimiters = true,
      render_markdown = true,
      telekasten = true,
      lsp_trouble = true,
      dadbod_ui = true,
      gitgutter = true,
      sandwich = true,
      signify = true,
      vim_sneak = true,
      vimwiki = true,
      which_key = true,
      symbols_outline = true,
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
