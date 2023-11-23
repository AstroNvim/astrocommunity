return {
  {
    "folke/trouble.nvim",
    cmd = { "TroubleToggle", "Trouble" },
    dependencies = {
      { "AstroNvim/astroui", opts = { icons = { Trouble = "󱍼" } } },
      {
        "AstroNvim/astrocore",
        opts = function(_, opts)
          local maps = opts.mappings
          local prefix = "<Leader>x"
          maps.n[prefix] = { desc = require("astroui").get_icon("Trouble", 1, true) .. "Trouble" }
          maps.n[prefix .. "X"] =
            { "<CMD>TroubleToggle workspace_diagnostics<CR>", desc = "Workspace Diagnostics (Trouble)" }
          maps.n[prefix .. "x"] =
            { "<CMD>TroubleToggle document_diagnostics<CR>", desc = "Document Diagnostics (Trouble)" }
          maps.n[prefix .. "l"] = { "<CMD>TroubleToggle loclist<CR>", desc = "Location List (Trouble)" }
          maps.n[prefix .. "q"] = { "<CMD>TroubleToggle quickfix<CR>", desc = "Quickfix List (Trouble)" }
        end,
      },
    },
    opts = {
      use_diagnostic_signs = true,
      action_keys = {
        close = { "q", "<ESC>" },
        cancel = "<C-e>",
      },
    },
  },
  {
    "folke/edgy.nvim",
    optional = true,
    opts = function(_, opts)
      if not opts.bottom then opts.bottom = {} end
      table.insert(opts.bottom, "Trouble")
    end,
  },
  {
    "catppuccin/nvim",
    optional = true,
    opts = { integrations = { lsp_trouble = true } },
  },
}
