local utils = require "astrocommunity.utils"
return {
  { import = "astrocommunity.pack.toml" },
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
      utils.list_insert_unique(opts.ensure_installed, "rust")
    end,
  },
  {
    "simrat39/rust-tools.nvim",
    ft = { "rust" },
    init = function() utils.list_insert_unique(astronvim.lsp.skip_setup, "rust_analyzer") end,
    opts = function()
      local package_path = require("mason-registry").get_package("codelldb"):get_install_path()
      local codelldb_path = package_path .. "/codelldb"
      local liblldb_path = package_path .. "/extension/lldb/lib/liblldb"
      local this_os = vim.loop.os_uname().sysname;

      -- The path in windows is different
      if this_os:find 'Windows' then
        codelldb_path = package_path .. "\\extension\\adapter\\codelldb.exe"
        liblldb_path = package_path .. "\\extension\\lldb\\bin\\liblldb.dll"
      else
        -- The liblldb extension is .so for linux and .dylib for macOS
        liblldb_path = liblldb_path .. (this_os == "Linux" and ".so" or ".dylib")
      end

      return {
        server = require("astronvim.utils.lsp").config "rust_analyzer",
        dap = {
          adapter = require("rust-tools.dap").get_codelldb_adapter(
            codelldb_path,
            liblldb_path
          ),
        },
      }
    end,
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
      utils.list_insert_unique(opts.ensure_installed, "rust_analyzer")
    end,
  },
  {
    "Saecki/crates.nvim",
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
    opts = {
      null_ls = {
        enabled = true,
        name = "crates.nvim",
      },
    },
  },
}
