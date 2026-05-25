return {
  {
    "AstroNvim/astrocore",
    ---@type AstroCoreOpts
    opts = {
      filetypes = {
        extension = { just = "just" },
        filename = {
          justfile = "just",
          Justfile = "just",
          [".Justfile"] = "just",
          [".justfile"] = "just",
        },
      },
      treesitter = { ensure_installed = { "just" } },
      autocmds = {
        just_as_make = {
          {
            event = "BufReadPost",
            pattern = "*",
            desc = "Set just as :make if workdir have justfile",
            callback = function()
              local justfile = vim.fn.findfile("justfile", ".;")
              if justfile ~= "" then vim.bo.makeprg = "just" end
            end,
          },
        },
      },
    },
  },
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    optional = true,
    opts = function(_, opts)
      opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, { "just-lsp" })
    end,
  },
}
