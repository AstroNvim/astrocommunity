local utils = require "astrocommunity.utils"


local function dump(o)
  if type(o) == 'table' then
    local s = '{ '
    for k, v in pairs(o) do
      if type(k) ~= 'number' then k = '"' .. k .. '"' end
      s = s .. '[' .. k .. '] = ' .. dump(v) .. ','
    end
    return s .. '} '
  else
    return tostring(o)
  end
end

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
    opts = {
      test = "stinky poopy"
    },
    config = function(_, opts)
      local ut = require "astronvim.utils"
      ut.notify(opts.test)
    end
    -- opts = {
    --   server = require("astronvim.utils.lsp").config "jdtls"
    -- }
    -- opts = {
    --   config = {
    --     cmd = "java"
    --   }
    -- }
    -- opts = function()
    --   return {
    --     setup = {
    --       jdtls = function(_, opts)
    --         vim.api.nvim_create_autocmd("FileType", {
    --           pattern = "java",
    --           callback = function()
    --             -- use this function notation to build some variables
    --           end,
    --         })
    --
    --         local root_markers = { ".git", "mvnw", "gradlew", "pom.xml", "build.gradle" }
    --         local root_dir = require("jdtls.setup").find_root(root_markers)
    --
    --         -- calculate workspace dir
    --         local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
    --         local workspace_dir = vim.fn.stdpath "data" .. "/site/java/workspace-root/" .. project_name
    --         os.execute("mkdir " .. workspace_dir)
    --
    --         -- get the mason install path
    --         local install_path = require("mason-registry").get_package("jdtls"):get_install_path()
    --
    --         -- get the current OS
    --         local os
    --         if vim.fn.has "macunix" then
    --           os = "mac"
    --         elseif vim.fn.has "win32" then
    --           os = "win"
    --         else
    --           os = "linux"
    --         end
    --       end,
    --     }
    --   }
    -- end,
  }

}
