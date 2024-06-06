return {
  "abecodes/tabout.nvim",
  event = "InsertEnter",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    {
      "hrsh7th/nvim-cmp",
      opts = function(_, opts)
        local cmp = require "cmp"
        local luasnip_avail, luasnip = pcall(require, "luasnip")
        opts.mapping["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          elseif luasnip_avail and luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
          elseif not luasnip_avail and pcall(vim.snippet.active, { direction = 1 }) then
            vim.snippet.jump(1)
          else
            fallback()
          end
        end, { "i", "s" })
      end,
    },
  },
  opts = {},
}
