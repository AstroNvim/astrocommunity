return {
  { import = "astrocommunity.pack.toml" },
  {
    "AstroNvim/astrolsp",
    ---@param opts AstroLSPOpts
    opts = function(_, opts)
      -- add rust_analyzer to servers list if the command is available
      if vim.fn.executable "rust-analyzer" == 1 then
        opts.servers = require("astrocore").list_insert_unique(opts.servers, "rust_analyzer")
      end
      return vim.tbl_deep_extend("keep", opts, {
        ---@diagnostic disable: missing-fields
        config = {
          rust_analyzer = {
            settings = {
              ["rust-analyzer"] = {
                checkOnSave = {
                  command = "clippy",
                },
              },
            },
          },
        },
      })
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      if opts.ensure_installed ~= "all" then
        opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, "rust")
      end
    end,
  },
  {
    "vxpm/ferris.nvim",
    lazy = true,
    init = function()
      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("lazy_ferris", { clear = true }),
        desc = "Lazy load Ferris",
        once = true,
        callback = function(args)
          if vim.lsp.get_client_by_id(args.data.client_id).name == "rust_analyzer" then
            if require("ferris.private.config").opts.create_commands then
              require("ferris").create_commands(args.buf)
            end
          end
        end,
      })
    end,
    opts = {
      url_handler = function(str) require("astrocore").system_open(str) end,
    },
  },
  {
    "Saecki/crates.nvim",
    lazy = true,
    init = function()
      vim.api.nvim_create_autocmd("BufRead", {
        group = vim.api.nvim_create_augroup("CmpSourceCargo", { clear = true }),
        desc = "Load crates.nvim into Cargo buffers",
        pattern = "Cargo.toml",
        callback = function()
          require("cmp").setup.buffer { sources = { { name = "crates" } } }
          require "crates"
        end,
      })
    end,
    opts = {
      src = {
        cmp = { enabled = true },
      },
      null_ls = {
        enabled = true,
        name = "crates.nvim",
      },
    },
  },
}
