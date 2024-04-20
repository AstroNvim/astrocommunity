return {
  {
    "HiPhish/rainbow-delimiters.nvim",
    main = "rainbow_delimiters",
    opts = {},
    config = function() require("rainbow-delimiters.setup").setup {} end,
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = {},
    config = function()
      local highlight = {
        "RainbowRed",
        "RainbowYellow",
        "RainbowBlue",
        "RainbowOrange",
        "RainbowGreen",
        "RainbowViolet",
        "RainbowCyan",
      }

      local highlightIndent = {
        "RainbowRedIndent",
        "RainbowYellowIndent",
        "RainbowBlueIndent",
        "RainbowOrangeIndent",
        "RainbowGreenIndent",
        "RainbowVioletIndent",
        "RainbowCyanIndent",
      }

      local hooks = require "ibl.hooks"
      -- create the highlight groups in the highlight setup hook, so they are reset
      -- every time the colorscheme changes
      hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
        vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#E06C75" })
        vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#E5C07B" })
        vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#61AFEF" })
        vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#D19A66" })
        vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#98C379" })
        vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#C678DD" })
        vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#56B6C2" })
        vim.api.nvim_set_hl(0, "RainbowRedIndent", { fg = "#6e171e" })
        vim.api.nvim_set_hl(0, "RainbowYellowIndent", { fg = "#765517" })
        vim.api.nvim_set_hl(0, "RainbowBlueIndent", { fg = "#0c497a" })
        vim.api.nvim_set_hl(0, "RainbowOrangeIndent", { fg = "#603d1d" })
        vim.api.nvim_set_hl(0, "RainbowGreenIndent", { fg = "#3b5727" })
        vim.api.nvim_set_hl(0, "RainbowVioletIndent", { fg = "#5a1b6d" })
        vim.api.nvim_set_hl(0, "RainbowCyanIndent", { fg = "#1e4c52" })
      end)

      vim.g.rainbow_delimiters = { highlight = highlight }
      require("ibl").setup {
        scope = { highlight = highlight, char = "┃" },
        indent = { highlight = highlightIndent, char = "╎" },
      }

      hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)
    end,
  },
}
