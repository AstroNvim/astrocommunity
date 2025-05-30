local sonarlint_ft = {
  "c",
  "cpp",
  "css",
  "docker",
  "go",
  "html",
  "java",
  "javascript",
  "javascriptreact",
  "python",
  "typescript",
  "typescriptreact",
  "yaml.docker-compose",
}

---@type LazySpec
return {
  "https://gitlab.com/schrieveslaach/sonarlint.nvim",
  optional = true,
  ft = sonarlint_ft,
  specs = {
    {
      "williamboman/mason-lspconfig.nvim",
      optional = true,
      opts = function(_, opts)
        opts.ensure_installed =
          require("astrocore").list_insert_unique(opts.ensure_installed, { "sonarlint-language-server" })
      end,
    },
    {
      "WhoIsSethDaniel/mason-tool-installer.nvim",
      optional = true,
      opts = function(_, opts)
        local astrocore = require "astrocore"
        opts.ensure_installed = astrocore.list_insert_unique(opts.ensure_installed, { "sonarlint-language-server" })
      end,
    },
  },
  config = function()
    local mason = vim.fn.stdpath "data" .. "/mason"
    require("sonarlint").setup {
      server = {
        cmd = {
          mason .. "/bin/sonarlint-language-server",
          "-stdio",
          "-analyzers",
          mason .. "/share/sonarlint-analyzers/sonarcfamily.jar",
          mason .. "/share/sonarlint-analyzers/sonargo.jar",
          mason .. "/share/sonarlint-analyzers/sonarhtml.jar",
          mason .. "/share/sonarlint-analyzers/sonariac.jar",
          mason .. "/share/sonarlint-analyzers/sonarjava.jar",
          mason .. "/share/sonarlint-analyzers/sonarjavasymbolicexecution.jar",
          mason .. "/share/sonarlint-analyzers/sonarpython.jar",
        },
      },
      filetypes = sonarlint_ft,
    }
  end,
}
