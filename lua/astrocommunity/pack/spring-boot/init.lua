---@type LazySpec
return {
  { import = "astrocommunity.pack.java" },
  {
    "williamboman/mason-lspconfig.nvim",
    optional = true,
    opts = function(_, opts)
      opts.ensure_installed =
        require("astrocore").list_insert_unique(opts.ensure_installed, { "vscode-spring-boot-tools" })
    end,
  },
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    optional = true,
    opts = function(_, opts)
      local astrocore = require "astrocore"
      opts.ensure_installed = astrocore.list_insert_unique(opts.ensure_installed, { "vscode-spring-boot-tools" })
    end,
  },
  {
    "JavaHello/spring-boot.nvim",
    ft = { "java", "yaml", "jproperties" },
    specs = {
      {
        "mfussenegger/nvim-jdtls",
        optional = true,
        opts = function(_, opts)
          if not opts.init_options then opts.init_options = {} end
          if not opts.init_options.bundles then opts.init_options.bundles = {} end
          vim.list_extend(opts.init_options.bundles, require("spring_boot").java_extensions())
        end,
      },
    },
    opts = {},
  },
}
