local prefix = "<Leader>H"

return {
  "jellydn/hurl.nvim",
  ft = "hurl",
  dependencies = {
    "MunifTanjim/nui.nvim",
    "nvim-lua/plenary.nvim",
    {
      "nvim-treesitter/nvim-treesitter",
      opts = function(_, opts)
        if opts.ensure_installed ~= "all" then
          opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, { "hurl" })
        end
      end,
    },
    {
      "WhoIsSethDaniel/mason-tool-installer.nvim",
      optional = true,
      opts = function(_, opts)
        opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, { "jq", "prettier" })
      end,
    },
  },
  specs = {
    {
      "AstroNvim/astroui",
      ---@type AstroUIOpts
      opts = { icons = { HurlNvim = "" } },
    },
    {
      "AstroNvim/astrocore",
      opts = function(_, opts)
        local maps = opts.mappings
        maps.n[prefix] = { desc = require("astroui").get_icon("HurlNvim", 1, true) .. "HurlNvim" }
        maps.n[prefix .. "R"] = { "<cmd>HurlRunner<cr>", desc = "Run all requests in the file" }
        maps.n[prefix .. "r"] = { "<cmd>HurlRunnerAt<cr>", desc = "Run request under the cursor" }
        maps.n[prefix .. "e"] = { "<cmd>HurlRunnerToEntry<cr>", desc = "Run request to the entry" }
        maps.n[prefix .. "E"] = { "<cmd>HurlRunnerToEnd<cr>", desc = "Run all request to the end" }
        maps.n[prefix .. "v"] = { "<cmd>HurlVerbose<cr>", desc = "Toggle verbose mode" }
        maps.n[prefix .. "V"] = { "<cmd>HurlVeryVerbose<cr>", desc = "Toggle very verbose mode" }
      end,
    },
  },
  opts = {},
}
