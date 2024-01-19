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
    init = function()
      vim.api.nvim_create_autocmd("FileType", {
        pattern = { "scala", "sbt" },
        callback = function()
          if vim.fn.executable "metals" ~= 1 and vim.fn.executable "coursier" ~= 1 then
            vim.notify "`metals` or `coursier` are required to be installed for `nvim-metals` to work."
            return
          end

          local metals = require "metals"

          local user_config = require("astrolsp").lsp_opts "metals"
          local old_on_attach = user_config.on_attach
          user_config.on_attach = function(...)
            old_on_attach(...)
            metals.setup_dap()
          end

          metals.initialize_or_attach(require("astrocore").extend_tbl(metals.bare_config(), user_config))
        end,
        group = vim.api.nvim_create_augroup("nvim-metals", { clear = true }),
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
