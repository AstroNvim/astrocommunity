local function selene_configured(path)
  return #vim.fs.find("selene.toml", { path = path, upward = true, type = "file" }) > 0
end

local is_aarch64 = vim.loop.os_uname().machine == "aarch64"

return {
  {
    "AstroNvim/astrolsp",
    optional = true,
    opts = {
      config = {
        lua_ls = {
          settings = {
            Lua = {
              hint = {
                enable = true,
                arrayIndex = "Disable",
              },
            },
          },
        },
      },
    },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    optional = true,
    opts = function(_, opts)
      if opts.ensure_installed ~= "all" then
        opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, { "lua", "luap" })
      end
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    optional = true,
    opts = function(_, opts)
      opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, { "lua_ls" })
    end,
  },
  {
    "jay-babu/mason-null-ls.nvim",
    optional = true,
    opts = function(_, opts)
      opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, {
        "stylua",
        (not is_aarch64 and "selene") or nil,
      })

      if not opts.handlers then opts.handlers = {} end

      if not is_aarch64 then
        opts.handlers.selene = function(source_name, methods)
          local null_ls = require "null-ls"
          for _, method in ipairs(methods) do
            null_ls.register(null_ls.builtins[method][source_name].with {
              runtime_condition = function(params) return selene_configured(params.bufname) end,
            })
          end
        end
      end
    end,
  },
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    optional = true,
    opts = function(_, opts)
      opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, {
        "lua-language-server",
        "stylua",
        (not is_aarch64 and "selene") or nil,
      })
    end,
  },
  {
    "stevearc/conform.nvim",
    optional = true,
    opts = {
      formatters_by_ft = {
        lua = { "stylua" },
      },
    },
  },
  {
    "mfussenegger/nvim-lint",
    optional = true,
    opts = function(_, opts)
      if not is_aarch64 then
        opts.linters_by_ft = {
          lua = { "selene" },
        }
        opts.linters = opts.linters or {}
        opts.linters.selene = {
          condition = function(ctx) return selene_configured(ctx.filename) end,
        }
      end
    end,
  },
}
