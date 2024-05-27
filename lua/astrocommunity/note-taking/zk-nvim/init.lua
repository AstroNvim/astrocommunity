return {
  {
    "zk-org/zk-nvim",
    main = "zk",
    event = "User AstroFile",
    cmd = {
      "ZkIndex",
      "ZkNew",
      "ZkNewFromTitleSelection",
      "ZkNewFromContentSelection",
      "ZkCd",
      "ZkNotes",
      "ZkBacklinks",
      "ZkLinks",
      "ZkInsertLinkAtSelection",
      "ZkInsertLink",
      "ZkMatch",
      "ZkTags",
    },
    dependencies = { "AstroNvim/astrolsp", opts = { handlers = { zk = function() end } } },
    opts = function()
      local lsp_config = require("astrolsp").lsp_opts "zk"
      return {
        lsp = {
          config = lsp_config,
          auto_attach = { filetypes = lsp_config.filetypes },
        },
      }
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    opts = function(_, opts)
      opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, { "zk" })
    end,
  },
}
