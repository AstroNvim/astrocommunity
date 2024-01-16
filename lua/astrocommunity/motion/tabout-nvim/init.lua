return {
  "abecodes/tabout.nvim",
  event = "InsertEnter",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    {
      "hrsh7th/nvim-cmp",
      opts = function(_, opts)
        local cmp, luasnip = require "cmp", require "luasnip"
        opts.mapping["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          elseif luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
          else
            fallback()
          end
        end, { "i", "s" })
      end,
    },
  },
  opts = {},
}
