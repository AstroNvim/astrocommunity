local prefix = "<Leader>r"
return {
  "rest-nvim/rest.nvim",
  ft = "http",
  cmd = "Rest",
  dependencies = {
    {
      "nvim-treesitter/nvim-treesitter",
      opts = function(_, opts)
        if opts.ensure_installed ~= "all" then
          opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, { "http" })
        end
      end,
    },
  },
  specs = {
    {
      "AstroNvim/astroui",
      ---@type AstroUIOpts
      opts = { icons = { RestNvim = "󰳘" } },
    },
    {
      "AstroNvim/astrocore",
      opts = function(_, opts)
        local maps = opts.mappings
        maps.n[prefix] = { desc = require("astroui").get_icon("RestNvim", 1, true) .. "RestNvim" }
        maps.n[prefix .. "r"] = { "<cmd>Rest run<cr>", desc = "Run request under the cursor" }
        maps.n[prefix .. "l"] = { "<cmd>Rest run last<cr>", desc = "Re-run latest request" }
      end,
    },
    {
      "nvim-telescope/telescope.nvim",
      optional = true,
      specs = {
        {
          "AstroNvim/astrocore",
          opts = function(_, opts)
            local maps = opts.mappings
            maps.n[prefix .. "e"] = { "<cmd>Telescope rest select_env<cr>", desc = "Select environment variables file" }
          end,
        },
      },
      opts = function() require("telescope").load_extension "rest" end,
    },
  },
  opts = {},
  config = function(_, opts) vim.g.rest_nvim = require("astrocore").extend_tbl(opts, vim.g.rest_nvim) end,
}
