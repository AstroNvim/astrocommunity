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
      -- Add the "java" and "html" language to opts.ensure_installed.
      -- XML does not have it's own treesitter plugin so HTML can take over if necessary
      utils.list_insert_unique(opts.ensure_installed, { "java", "html" })
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    opts = function(_, opts)
      -- Ensure that opts.ensure_installed exists and is a table.
      if not opts.ensure_installed then opts.ensure_installed = {} end
      -- Add java and lemminx lsps to opts.ensure_installed using vim.list_extend.
      utils.list_insert_unique(opts.ensure_installed, { "jdtls", "lemminx" })
    end,
  },

  {
    "mfussenegger/nvim-jdtls",
    ft = { "java" },
    init = function()
      utils.list_insert_unique(astronvim.lsp.skip_setup, "jdtls")
    end,
    opts = function()
      local ut = require "astronvim.utils"
      -- use this function notation to build some variables
      local root_markers = { ".git", "mvnw", "gradlew", "pom.xml", "build.gradle", ".project" }
      local root_dir = require("jdtls.setup").find_root(root_markers)

      -- calculate workspace dir
      local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
      local workspace_dir = vim.fn.stdpath "data" .. "/site/java/workspace-root/" .. project_name
      os.execute("mkdir " .. workspace_dir)

      ut.notify("" .. workspace_dir)

      -- get the mason install path
      local install_path = require("mason-registry").get_package("jdtls"):get_install_path()

      -- get the current OS
      -- local os
      -- if vim.fn.has "macunix" then
      --   os = "mac"
      -- elseif vim.fn.has "win32" then
      --   os = "win"
      -- else
      --   os = "linux"
      -- end

      -- return the server config
      return {
        -- server = require("astronvim.utils.lsp").config "jdtls",
        cmd = {
          "java",
          "-Declipse.application=org.eclipse.jdt.ls.core.id1",
          "-Dosgi.bundles.defaultStartLevel=4",
          "-Declipse.product=org.eclipse.jdt.ls.core.product",
          "-Dlog.protocol=true",
          "-Dlog.level=ALL",
          "-javaagent:" .. install_path .. "/lombok.jar",
          "-Xms1g",
          "--add-modules=ALL-SYSTEM",
          "--add-opens",
          "java.base/java.util=ALL-UNNAMED",
          "--add-opens",
          "java.base/java.lang=ALL-UNNAMED",
          "-jar",
          vim.fn.glob(install_path .. "/plugins/org.eclipse.equinox.launcher_*.jar"),
          "-configuration",
          install_path .. "/config_" .. "linux",
          "-data",
          workspace_dir,
        },
        root_dir = root_dir,
        settings = {
          java = {},
        },
        init_options = {
          bundles = {},
        },
      }
    end,
    config = function(_, opts)
      -- local ut = require "astronvim.utils"

      if opts.root_dir and opts.root_dir ~= "" then require("jdtls").start_or_attach(opts) end
    end
  }

}
