local function has_words_before()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match "%s" == nil
end

---@type LazySpec
return {
  "github/copilot.vim",
  specs = {
    { import = "astrocommunity.completion.copilot-vim" },
    {
      "hrsh7th/nvim-cmp",
      optional = true,
      opts = function(_, opts)
        local cmp = require "cmp"
        local snip_status_ok, luasnip = pcall(require, "luasnip")
        if not snip_status_ok then return end

        if not opts.mapping then opts.mapping = {} end
        opts.mapping["<Tab>"] = cmp.mapping(function(fallback)
          if vim.fn["copilot#GetDisplayedSuggestion"]().text ~= "" then
            vim.api.nvim_feedkeys(vim.fn["copilot#Accept"](), "n", true)
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

        opts.mapping["<M-]>"] = cmp.mapping(function() vim.fn["copilot#Next"]() end)
        opts.mapping["<M-[>"] = cmp.mapping(function() vim.fn["copilot#Previous"]() end)
        opts.mapping["<M-\\>"] = cmp.mapping(function() vim.fn["copilot#Suggest"]() end)
        opts.mapping["<M-Right>"] = cmp.mapping(function()
          local copilot_keys = vim.fn["copilot#AcceptWord"]()
          if copilot_keys ~= "" and type(copilot_keys) == "string" then
            vim.api.nvim_feedkeys(copilot_keys, "i", true)
          end
        end)
        opts.mapping["<M-C-Right>"] = cmp.mapping(function()
          local copilot_keys = vim.fn["copilot#AcceptLine"]()
          if copilot_keys ~= "" and type(copilot_keys) == "string" then
            vim.api.nvim_feedkeys(copilot_keys, "i", true)
          end
        end)
        opts.mapping["<C-]>"] = cmp.mapping(function() vim.fn["copilot#Dismiss"]() end)
      end,
    },
    {
      "Saghen/blink.cmp",
      optional = true,
      ---@param opts blink.cmp.Config
      opts = function(_, opts)
        if not opts.keymap then opts.keymap = {} end
        opts.keymap["<Tab>"] = {
          function()
            if vim.fn["copilot#GetDisplayedSuggestion"]().text ~= "" then
              vim.api.nvim_feedkeys(vim.fn["copilot#Accept"](), "n", true)
              return true
            else
              return false
            end
          end,
          "select_next",
          "snippet_forward",
          function(cmp)
            if has_words_before() or vim.api.nvim_get_mode().mode == "c" then return cmp.show() end
          end,
          "fallback",
        }
        opts.keymap["<M-]>"] = {
          function() vim.fn["copilot#Next"]() end,
        }
        opts.keymap["<M-[>"] = {
          function() vim.fn["copilot#Previous"]() end,
        }
        opts.keymap["<M-\\>"] = {
          function() vim.fn["copilot#Suggest"]() end,
        }
        opts.keymap["<M-Right>"] = {
          function()
            local copilot_keys = vim.fn["copilot#AcceptWord"]()
            if copilot_keys ~= "" and type(copilot_keys) == "string" then
              vim.api.nvim_feedkeys(copilot_keys, "i", true)
            end
          end,
        }
        opts.keymap["<M-C-Right>"] = {
          function()
            local copilot_keys = vim.fn["copilot#AcceptLine"]()
            if copilot_keys ~= "" and type(copilot_keys) == "string" then
              vim.api.nvim_feedkeys(copilot_keys, "i", true)
            end
          end,
        }
        opts.keymap["<C-]>"] = {
          function() vim.fn["copilot#Dismiss"]() end,
        }
      end,
    },
  },
}
