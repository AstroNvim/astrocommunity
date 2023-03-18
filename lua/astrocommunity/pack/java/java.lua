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
      -- Add jdtls and lemminx lsps to opts.ensure_installed using vim.list_extend.
      utils.list_insert_unique(opts.ensure_installed, { "jdtls", "lemminx" })
    end,
  },

  {
    "jay-babu/mason-null-ls.nvim",
    opts = function(_, opts)
      -- Ensure that opts.ensure_installed exists and is a table.
      if not opts.ensure_installed then opts.ensure_installed = {} end
      -- Add clang_format to opts.ensure_installed
      utils.list_insert_unique(opts.ensure_installed, { "clang_format" })
    end,
  },

  {
    "jay-babu/mason-nvim-dap.nvim",
    opts = function(_, opts)
      -- Ensure that opts.ensure_installed exists and is a table.
      if not opts.ensure_installed then opts.ensure_installed = {} end
      -- Add javadgb to required
      utils.list_insert_unique(opts.ensure_installed, { "javadbg", "javatest" })
    end,
  },

  {
    "mfussenegger/nvim-jdtls",
    ft = { "java" },
    init = function()
      utils.list_insert_unique(astronvim.lsp.skip_setup, "jdtls")
    end,
    opts = function(_, opts)
      -- use this function notation to build some variables
      local root_markers = { ".git", "mvnw", "gradlew", "pom.xml", "build.gradle", ".project" }
      local root_dir = require("jdtls.setup").find_root(root_markers)

      -- calculate workspace dir
      local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
      local workspace_dir = vim.fn.stdpath "data" .. "/site/java/workspace-root/" .. project_name
      os.execute("mkdir " .. workspace_dir)

      -- get the mason install path
      local install_path = require("mason-registry").get_package("jdtls"):get_install_path()

      -- get the current OS
      local os
      if vim.fn.has("mac") == 1 then
        os = "mac"
      elseif vim.fn.has("unix") == 1 then
        os = "linux"
      elseif vim.fn.has("win32") == 1 then
        os = "win"
      end

      -- ensure that OS is valid
      if (not os or os == "") then
        require("astronvim.utils").notify("jdtls: Could not detect valid OS", vim.log.levels.ERROR)
      end

      local defaults = {
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
          install_path .. "/config_" .. os,
          "-data",
          workspace_dir,
        },
        root_dir = root_dir,
        settings = {
          java = {},
        },
        init_options = {
          bundles = {
            vim.fn.glob(require("mason-registry").get_package("java-debug-adapter"):get_install_path() ..
              "/extension/server/com.microsoft.java.debug.plugin-*.jar"),
            -- unpack remaining bundles
            table.unpack(
              vim.split(
                vim.fn.glob(
                  require("mason-registry").get_package("java-test"):get_install_path()
                  .. "/extension/server/*.jar"
                ),
                "\n", {}))
          },
        },
        handlers = {
          ["language/status"] = function(_, result)
            -- print(result)
          end,
          ["$/progress"] = function(_, result, ctx)
            -- disable progress updates.
          end,
        },
        filetypes = { "java" },
        on_attach = function(client, bufnr)
          local ut = require("astronvim.utils")

          require('jdtls').setup_dap()
          require("astronvim.utils.lsp").on_attach(client, bufnr)
        end,
      }

      -- TODO: add overwrite for on_attach

      -- ensure that table is valid
      if not opts then opts = {} end

      -- extend the current table with the defaults keeping options in the user opts
      -- this allows users to pass opts through an opts table in community.lua
      opts = vim.tbl_deep_extend("keep", opts, defaults)

      -- send opts to config
      return opts
    end,
    config = function(_, opts)
      -- setup autocmd on filetype detect java
      vim.api.nvim_create_autocmd("Filetype", {
        pattern = "java", -- autocmd to start jdtls
        callback = function()
          if opts.root_dir and opts.root_dir ~= "" then
            require("jdtls").start_or_attach(opts)
            -- require('jdtls.dap').setup_dap_main_class_configs()
          else
            require("astronvim.utils").notify("jdtls: root_dir not found. Please specify a root marker",
              vim.log.levels.ERROR)
          end
        end,
      })

      vim.api.nvim_create_autocmd("LspAttach", {
        pattern = "*.java",
        callback = function(args)
          local ut = require("astronvim.utils")
          ut.notify(vim.inspect(vim.api.nvim_buf_get_name(args.buf)))
          -- print(vim.inspect(bufnr))
          -- print(vim.inspect(args.buf))
          local client = vim.lsp.get_client_by_id(args.data.client_id)
          if client.name == "jdtls" then
            require('jdtls.dap').setup_dap_main_class_configs()
          end
        end,
      })
    end
  }

}
