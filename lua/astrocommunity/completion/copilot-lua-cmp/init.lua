local function has_words_before()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match "%s" == nil
end

return {
  "zbirenbaum/copilot.lua",
  specs = {
    { import = "astrocommunity.completion.copilot-lua" },
    {
      "hrsh7th/nvim-cmp",
      dependencies = { "zbirenbaum/copilot.lua" },
      opts = function(_, opts)
        local cmp, copilot = require "cmp", require "copilot.suggestion"
        local snip_status_ok, luasnip = pcall(require, "luasnip")
        if not snip_status_ok then return end

        if not opts.mapping then opts.mapping = {} end
        opts.mapping["<Tab>"] = cmp.mapping(function(fallback)
          if copilot.is_visible() then
            copilot.accept()
          elseif cmp.visible() then
            cmp.select_next_item()
          elseif luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
          elseif has_words_before() then
            cmp.complete()
          else
            fallback()
          end
        end, { "i", "s" })

        opts.mapping["<C-x>"] = cmp.mapping(function()
          if copilot.is_visible() then copilot.next() end
        end)

        opts.mapping["<C-z>"] = cmp.mapping(function()
          if copilot.is_visible() then copilot.prev() end
        end)

        opts.mapping["<C-right>"] = cmp.mapping(function()
          if copilot.is_visible() then copilot.accept_word() end
        end)

        opts.mapping["<C-l>"] = cmp.mapping(function()
          if copilot.is_visible() then copilot.accept_word() end
        end)

        opts.mapping["<C-down>"] = cmp.mapping(function()
          if copilot.is_visible() then copilot.accept_line() end
        end)

        opts.mapping["<C-j>"] = cmp.mapping(function()
          if copilot.is_visible() then copilot.accept_line() end
        end)

        opts.mapping["<C-c>"] = cmp.mapping(function()
          if copilot.is_visible() then copilot.dismiss() end
        end)

        return opts
      end,
    },
    {
      "Saghen/blink.cmp",
      optional = true,
      opts = function(_, opts)
        local copilot = require "copilot.suggestion"
        opts.keymap = opts.keymap or {}

        local function copilot_action(action)
          return function()
            if copilot.is_visible() then
              copilot[action]()
              return true -- doesn't run the next command
            end
          end
        end

        local keymap = {
          ["<Tab>"] = {
            copilot_action "accept",
            "select_next",
            "snippet_forward",
            function(cmp)
              if has_words_before() or vim.api.nvim_get_mode().mode == "c" then return cmp.show() end
            end,
            "fallback",
          },
          ["<C-x>"] = { copilot_action "next" },
          ["<C-z>"] = { copilot_action "prev" },
          ["<C-right>"] = { copilot_action "accept_word" },
          ["<C-l>"] = { copilot_action "accept_word" },
          ["<C-down>"] = { copilot_action "accept_line" },
          ["<C-j>"] = { copilot_action "accept_line", "select_next", "fallback" },
          ["<C-c>"] = { copilot_action "dismiss" },
        }

        for k, v in pairs(keymap) do
          opts.keymap[k] = v
        end

        return opts
      end,
    },
  },
}
