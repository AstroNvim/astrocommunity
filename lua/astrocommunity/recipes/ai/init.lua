return {
  {
    "AstroNvim/astrocore",
    opts = {
      options = {
        g = {
          ai_inline = true,
          ai_accept = nil, -- set in AI plugins to connect to the completion engines.
        },
      },
    },
  },
  {
    "hrsh7th/nvim-cmp",
    optional = true,
    opts = function(_, opts)
      local cmp = require "cmp"
      if not opts.mapping then opts.mapping = {} end
      opts.mapping["<Tab>"] = cmp.mapping(function(fallback)
        -- Snippet jump next (with support for several popular snippet plugins)
        local mini_snippets_avail, mini_snippets = pcall(require, "mini.snippets")
        local luasnip_avail, luasnip = pcall(require, "luasnip")
        if mini_snippets_avail then
          if mini_snippets.session.get(false) then
            mini_snippets.session.jump "next"
            return
          end
        elseif luasnip_avail then
          if luasnip.locally_jumpable(1) then
            luasnip.jump(1)
            return
          end
        elseif vim.snippet and vim.snippet.active { direction = 1 } then
          vim.schedule(function() vim.snippet.jump(1) end)
          return
        end
        -- AI accept
        if vim.g.ai_accept and vim.g.ai_accept() then return end
        -- Fallback
        fallback()
      end, { "i", "s" })
      opts.mapping["<S-Tab>"] = cmp.mapping(function(fallback)
        -- Snippet jump previous
        local mini_snippets_avail, mini_snippets = pcall(require, "mini.snippets")
        local luasnip_avail, luasnip = pcall(require, "luasnip")
        if mini_snippets_avail then
          if mini_snippets.session.get(false) then
            mini_snippets.session.jump "prev"
            return
          end
        elseif luasnip_avail then
          if luasnip.locally_jumpable(-1) then
            luasnip.jump(-1)
            return
          end
        elseif vim.snippet and vim.snippet.active { direction = -1 } then
          vim.schedule(function() vim.snippet.jump(-1) end)
          return
        end
        -- Fallback
        fallback()
      end, { "i", "s" })
    end,
  },
  {
    "Saghen/blink.cmp",
    optional = true,
    opts = function(_, opts)
      if not opts.keymap then opts.keymap = {} end
      opts.keymap["<Tab>"] = {
        "snippet_forward",
        function()
          if vim.g.ai_accept then return vim.g.ai_accept() end
        end,
        "fallback",
      }
      opts.keymap["<S-Tab>"] = { "snippet_backward", "fallback" }
    end,
  },
}
