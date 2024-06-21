---@type LazySpec
return {
  -- mason ensure install hyprls
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
        filename = {
          ["hyprland.conf"] = "hyprlang",
        },
        pattern = {
          ["*/hypr/*.conf"] = "hyprlang",
          ["hypr*.conf"] = "hyprlang",
        },
      },

      -- hyprls client auto-attach by filetype
      autocmds = {
        hyprland_support = {
          {
            desc = "Hyprls auto-attach",
            event = { "FileType" },
            pattern = { "hyprlang" },
            callback = function()
              local core = require "astrocore"
              if vim.fn.executable "hyprls" ~= 0 then
                vim.lsp.start { name = "hyprls", cmd = { "hyprls" }, root_dir = vim.fn.getcwd() }
              else
                core.notify(
                  "`hyprls` not installed yet. Install it by Mason or running `go install hyprls` to enable hyprland language support!",
                  vim.log.levels.WARN
                )
              end
            end,
          },
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
