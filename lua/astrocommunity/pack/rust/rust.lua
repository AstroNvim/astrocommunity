local utils = require "astrocommunity.utils"
return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      -- Ensure that opts.ensure_installed exists and is a table or string "all".
      if not opts.ensure_installed then
        opts.ensure_installed = {}
      elseif opts.ensure_installed == "all" then
        return
      end
      -- Add the "rust" and "toml" language to opts.ensure_installed.
      utils.list_insert_unique(opts.ensure_installed, { "rust", "toml" })
    end,
  },
  {
    "simrat39/rust-tools.nvim",
    ft = { "rust" },
    init = function() utils.list_insert_unique(astronvim.lsp.skip_setup, "rust_analyzer") end,
    opts = function() return { server = require("astronvim.utils.lsp").config "rust_analyzer" } end,
    dependencies = {
      {
        "jay-babu/mason-nvim-dap.nvim",
        opts = function(_, opts)
          -- Ensure that opts.ensure_installed exists and is a table.
          if not opts.ensure_installed then opts.ensure_installed = {} end
          utils.list_insert_unique(opts.ensure_installed, "codelldb")
        end,
      },
    },
  },
  {
    "williamboman/mason-lspconfig.nvim",
    opts = function(_, opts)
      -- Ensure that opts.ensure_installed exists and is a table.
      if not opts.ensure_installed then opts.ensure_installed = {} end
      -- Add rust and taplo lsps to opts.ensure_installed using vim.list_extend.
      utils.list_insert_unique(opts.ensure_installed, { "rust_analyzer", "taplo" })
    end,
  },
  {
    "Saecki/crates.nvim",
    event = { "BufRead Cargo.toml" },
    opts = {
      null_ls = {
        enabled = true,
        name = "crates.nvim",
      },
    },
    init = function()
      vim.api.nvim_create_autocmd("BufRead", {
        group = vim.api.nvim_create_augroup("CmpSourceCargo", { clear = true }),
        pattern = "Cargo.toml",
        callback = function()
          require("cmp").setup.buffer { sources = { { name = "crates" } } }
          require "crates"
        end,
      })
    end,
  },
}
