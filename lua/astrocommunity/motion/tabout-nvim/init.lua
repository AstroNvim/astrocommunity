return {
  "abecodes/tabout.nvim",
  event = "InsertEnter",
  dependencies = { "nvim-treesitter/nvim-treesitter" },
  specs = {
    {
      "hrsh7th/nvim-cmp",
      optional = true,
      opts = function(_, opts)
        local cmp = require "cmp"
        local snippet_jumpable = function() return vim.snippet and vim.snippet.active { direction = 1 } end
        local snippet_jump = vim.schedule_wrap(function() vim.snippet.jump(1) end)
        local luasnip_avail, luasnip = pcall(require, "luasnip")
        if luasnip_avail then
          snippet_jumpable = luasnip.expand_or_jumpable
          snippet_jump = luasnip.expand_or_jump
        end
        opts.mapping["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          elseif vim.api.nvim_get_mode() ~= "c" and snippet_jumpable() then
            snippet_jump()
          elseif not luasnip_avail and pcall(vim.snippet.active, { direction = 1 }) then
            vim.snippet.jump(1)
          else
            fallback()
          end
        end, { "i", "s" })
      end,
    },
    {
      "Saghen/blink.cmp",
      optional = true,
      opts = {
        keymap = {
          ["<Tab>"] = {
            "select_next",
            "snippet_forward",
            "fallback",
          },
          ["<S-Tab>"] = {
            "select_prev",
            "snippet_backward",
            "fallback",
          },
        },
      },
    },
  },
  opts = {},
}
