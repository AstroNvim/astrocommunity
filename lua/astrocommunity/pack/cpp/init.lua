return {
  {
    "AstroNvim/astrolsp",
    optional = true,
    ---@type AstroLSPOpts
    opts = {
      ---@diagnostic disable: missing-fields
      config = {
        clangd = {
          capabilities = {
            offsetEncoding = "utf-8",
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
        opts.ensure_installed =
          require("astrocore").list_insert_unique(opts.ensure_installed, { "cpp", "c", "objc", "cuda", "proto" })
      end
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    optional = true,
    opts = function(_, opts)
      opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, { "clangd" })
    end,
  },
  {
    "p00f/clangd_extensions.nvim",
    lazy = true,
    dependencies = {
      "AstroNvim/astrocore",
      opts = {
        autocmds = {
          clangd_extensions = {
            {
              event = "LspAttach",
              desc = "Load clangd_extensions with clangd",
              callback = function(args)
                if assert(vim.lsp.get_client_by_id(args.data.client_id)).name == "clangd" then
                  require "clangd_extensions"
                  vim.api.nvim_del_augroup_by_name "clangd_extensions"
                end
              end,
            },
          },
          clangd_extension_mappings = {
            {
              event = "LspAttach",
              desc = "Load clangd_extensions with clangd",
              callback = function(args)
                if assert(vim.lsp.get_client_by_id(args.data.client_id)).name == "clangd" then
                  require("astrocore").set_mappings({
                    n = {
                      ["<Leader>lw"] = { "<Cmd>ClangdSwitchSourceHeader<CR>", desc = "Switch source/header file" },
                    },
                  }, { buffer = args.buf })
                end
              end,
            },
          },
        },
      },
    },
  },
  {
    "Civitasv/cmake-tools.nvim",
    ft = { "c", "cpp", "objc", "objcpp", "cuda", "proto" },
    dependencies = {
      {
        "jay-babu/mason-nvim-dap.nvim",
        opts = function(_, opts)
          opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, { "codelldb" })
        end,
      },
    },
    opts = {},
  },
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    optional = true,
    opts = function(_, opts)
      opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, { "clangd", "codelldb" })
    end,
  },
  {
    "neoclide/coc.nvim",
    optional = true,
    opts = function(_, opts)
      vim.fn["coc#config"]("clangd.arguments", {
        -- Include index symbols that are not defined in scopes (e.g.
        -- namespaces). Such completions will insert scope qualifiers.
        "--all-scopes-completion=true",
        -- Index project code in the background and persist index on disk.
        "--background-index=true",
        -- Set thread priority for building the background index.
        "--background-index-priority=normal",
        -- Enable clang-tidy diagnostics.
        "--clang-tidy",
        -- Use clang-parser for code-completion consistently, and don't dilute
        -- results with text-based completion.
        "--completion-parse=always",
        -- Combine similar completion items (e.g. function overloads). Type
        -- information will be shown where possible.
        "--completion-style=bundled",
        -- Disable function parameter placeholders (e.g. std::endl(basic_ostream<_CharT, _Traits> &__os))
        "--function-arg-placeholders=false",
        -- Never insert headers with completion proposals. It causes more problems than it solves.
        "--header-insertion=never",
        -- Parse all emplace-like functions in included headers
        "--parse-forwarding-functions",
        -- Store PCHs in memory. Note that it may increases memory usages, but
        -- in return it will greatly improve performance.
        "--pch-storage=memory",
        -- Use Decision Forest-based ranking algorithm to rank completion candidates. In practice, this gives an estimated 6% accuracy boost.
        "--ranking-model=decision_forest",
        -- Avoid imposing arbitrary limits. In most instances, this is rarely a
        -- problem. If it is, it will likely require manual adjustment on a
        -- per-project or per-hardware basis anyway.
        "--limit-references=0",
        "--limit-results=0",
        "--rename-file-limit=0",
      })
    end,
  },
}
