return {
  {
    "nvim-treesitter/nvim-treesitter",
    optional = true,
    opts = function(_, opts)
      if opts.ensure_installed ~= "all" then
        opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, { "scala" })
      end
    end,
  },
  {
    "scalameta/nvim-metals",
    ft = { "scala", "sbt", "java" },
    dependencies = {
      {
        "AstroNvim/astrolsp",
        optional = true,
        ---@type AstroLSPOpts
        opts = {
          ---@diagnostic disable: missing-fields
          handlers = { metals = false },
        },
      },
    },
    opts = function()
      local metals, astrocore = require "metals", require "astrocore"
      local astrolsp_avail, astrolsp = pcall(require, "astrolsp")
      local user_config = astrolsp_avail and astrolsp.lsp_opts "metals" or {}
      if astrocore.is_available "nvim-dap" then
        user_config.on_attach = astrocore.patch_func(user_config.on_attach, function(orig, ...)
          orig(...)
          metals.setup_dap()
        end)
      end
      return astrocore.extend_tbl(metals.bare_config(), user_config)
    end,
    config = function(self, opts)
      vim.api.nvim_create_autocmd("FileType", {
        pattern = self.ft,
        group = vim.api.nvim_create_augroup("nvim-metals", { clear = true }),
        desc = "Initialize and attach nvim-metals",
        callback = function(args)
          if not vim.b[args.buf].metals_initialized then
            require("metals").initialize_or_attach(opts)
            vim.b[args.buf].metals_initialized = true
          end
        end,
      })
    end,
  },
  {
    "mfussenegger/nvim-dap",
    optional = true,
    opts = function()
      local scala_config = {
        {
          type = "scala",
          request = "launch",
          name = "RunOrTest",
          metals = {
            runType = "runOrTestFile",
          },
        },
        {
          type = "scala",
          request = "launch",
          name = "Test Target",
          metals = {
            runType = "testTarget",
          },
        },
      }
      local dap = require "dap"
      dap.configurations.scala = dap.configurations.scala and vim.list_extend(dap.configurations.scala, scala_config)
        or scala_config
    end,
  },
  {
    "nvim-neotest/neotest",
    optional = true,
    dependencies = { "stevanmilic/neotest-scala", config = function() end },
    opts = function(_, opts)
      if not opts.adapters then opts.adapters = {} end
      table.insert(opts.adapters, require "neotest-scala"(require("astrocore").plugin_opts "neotest-scala"))
    end,
  },
}
