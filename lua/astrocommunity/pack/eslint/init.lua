return {
  {
    "AstroNvim/astrolsp",
    optional = true,
    ---@type AstroLSPOpts
    opts = {
      autocmds = {
        eslint_fix_on_save = {
          cond = function(client) return client.name == "eslint" and vim.fn.exists ":EslintFixAll" > 0 end,
          {
            event = "BufWritePost",
            desc = "Fix all eslint errors",
            callback = function(args)
              if vim.F.if_nil(vim.b[args.buf].autoformat, vim.g.autoformat, true) then vim.cmd.EslintFixAll() end
            end,
          },
        },
      },
    },
  },
  {
    "williamboman/mason-lspconfig.nvim",
    optional = true,
    opts = function(_, opts)
      opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed or {}, { "eslint" })
    end,
  },
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    optional = true,
    opts = function(_, opts)
      opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed or {}, { "eslint-lsp" })
    end,
  },
  {
    "echasnovski/mini.icons",
    optional = true,
    opts = function(_, opts)
      if not opts.file then opts.file = {} end
      opts.file[".eslintrc.js"] = { glyph = "󰱺", hl = "MiniIconsYellow" }
      opts.file["eslint.config.js"] = { glyph = "󰱺", hl = "MiniIconsYellow" }
    end,
  },
}
