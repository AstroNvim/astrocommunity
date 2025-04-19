---@type LazySpec
return {
  -- mason ensure install hyprls
  {
    "williamboman/mason-lspconfig.nvim",
    optional = true,
    opts = function(_, opts)
      opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, { "hyprls" })
    end,
  },
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    optional = true,
    opts = function(_, opts)
      opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, { "hyprls" })
    end,
  },
  {
    "AstroNvim/astrocore",
    optional = true,
    ---@type AstroCoreOpts
    opts = {
      -- add "hyprlang" file tpye
      filetypes = {
        extension = {
          hl = "hyprlang",
        },
        pattern = {
          [".*/hypr/.*.conf"] = "hyprlang",
          ["hypr.*.conf"] = "hyprlang",
        },
      },
    },
  },
  -- treesitter support for hyprlang
  {
    "nvim-treesitter/nvim-treesitter",
    optional = true,
    opts = function(_, opts)
      if opts.ensure_installed ~= "all" then
        opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, { "hyprlang" })
      end
    end,
  },
}
