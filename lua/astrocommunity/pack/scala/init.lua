return {
  {
    "AstroNvim/astrolsp",
    ---@type AstroLSPOpts
    opts = {
      ---@diagnostic disable: missing-fields
      handlers = { metals = false },
    },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    optional = true,
    opts = function(_, opts)
      if opts.ensure_installed ~= "all" then
        opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, "scala")
      end
    end,
  },
  {
    "scalameta/nvim-metals",
    ft = { "scala", "sbt", "java" },
    opts = function()
      local metals = require "metals"
      local user_config = require("astrolsp").lsp_opts "metals"
      if require("astrocore").is_available "nvim-dap" then
        local on_attach = user_config.on_attach
        user_config.on_attach = function(...)
          on_attach(...)
          metals.setup_dap()
        end
      end
      return require("astrocore").extend_tbl(metals.bare_config(), user_config)
    end,
    config = function(self, opts)
      vim.api.nvim_create_autocmd("FileType", {
        pattern = self.ft,
        group = vim.api.nvim_create_augroup("nvim-metals", { clear = true }),
        desc = "Initialize and attach nvim-metals",
        callback = function() require("metals").initialize_or_attach(opts) end,
      })
    end,
  },
  {
    "mfussenegger/nvim-dap",
    optional = true,
    config = function()
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
    dependencies = { "stevanmilic/neotest-scala" },
    opts = function(_, opts)
      if not opts.adapters then opts.adapters = {} end
      table.insert(opts.adapters, require "neotest-scala"(require("astrocore").plugin_opts "neotest-scala"))
    end,
  },
}
