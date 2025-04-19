local function has_words_before()
  local line, col = (unpack or table.unpack)(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match "%s" == nil
end

---@type function?, function?
local icon_provider, hl_provider

local function get_kind_icon(CTX)
  -- Evaluate icon provider
  if not icon_provider then
    local _, mini_icons = pcall(require, "mini.icons")
    if _G.MiniIcons then
      icon_provider = function(ctx)
        local is_specific_color = ctx.kind_hl and ctx.kind_hl:match "^HexColor" ~= nil
        if ctx.item.source_name == "LSP" then
          local icon, hl = mini_icons.get("lsp", ctx.kind or "")
          if icon then
            ctx.kind_icon = icon
            if not is_specific_color then ctx.kind_hl = hl end
          end
        elseif ctx.item.source_name == "Path" then
          ctx.kind_icon, ctx.kind_hl = mini_icons.get(ctx.kind == "Folder" and "directory" or "file", ctx.label)
        end
      end
    end
    if not icon_provider then
      local lspkind_avail, lspkind = pcall(require, "lspkind")
      if lspkind_avail then
        icon_provider = function(ctx)
          if ctx.item.source_name == "LSP" then
            local icon = lspkind.symbolic(ctx.kind, { mode = "symbol" })
            if icon then ctx.kind_icon = icon end
          end
        end
      end
    end
    if not icon_provider then icon_provider = function() end end
  end
  -- Evaluate highlight provider
  if not hl_provider then
    local highlight_colors_avail, highlight_colors = pcall(require, "nvim-highlight-colors")
    if highlight_colors_avail then
      local kinds
      hl_provider = function(ctx)
        if not kinds then kinds = require("blink.cmp.types").CompletionItemKind end
        if ctx.item.kind == kinds.Color then
          local doc = vim.tbl_get(ctx, "item", "documentation")
          if doc then
            local color_item = highlight_colors_avail and highlight_colors.format(doc, { kind = kinds[kinds.Color] })
            if color_item and color_item.abbr_hl_group then
              if color_item.abbr then ctx.kind_icon = color_item.abbr end
              ctx.kind_hl = color_item.abbr_hl_group
            end
          end
        end
      end
    end
    if not hl_provider then hl_provider = function() end end
  end
  -- Call resolved providers
  icon_provider(CTX)
  hl_provider(CTX)
  -- Return text and highlight information
  return { text = CTX.kind_icon .. CTX.icon_gap, highlight = CTX.kind_hl }
end

return {
  "Saghen/blink.cmp",
  event = { "InsertEnter", "CmdlineEnter" },
  version = "^1",
  opts_extend = { "sources.default", "cmdline.sources", "term.sources" },
  opts = {
    -- remember to enable your providers here
    sources = {
      default = { "lsp", "path", "snippets", "buffer" },
    },
    keymap = {
      ["<C-Space>"] = { "show", "show_documentation", "hide_documentation" },
      ["<Up>"] = { "select_prev", "fallback" },
      ["<Down>"] = { "select_next", "fallback" },
      ["<C-N>"] = { "select_next", "show" },
      ["<C-P>"] = { "select_prev", "show" },
      ["<C-J>"] = { "select_next", "fallback" },
      ["<C-K>"] = { "select_prev", "fallback" },
      ["<C-U>"] = { "scroll_documentation_up", "fallback" },
      ["<C-D>"] = { "scroll_documentation_down", "fallback" },
      ["<C-e>"] = { "hide", "fallback" },
      ["<CR>"] = { "accept", "fallback" },
      ["<Tab>"] = {
        "select_next",
        "snippet_forward",
        function(cmp)
          if has_words_before() or vim.api.nvim_get_mode().mode == "c" then return cmp.show() end
        end,
        "fallback",
      },
      ["<S-Tab>"] = {
        "select_prev",
        "snippet_backward",
        function(cmp)
          if vim.api.nvim_get_mode().mode == "c" then return cmp.show() end
        end,
        "fallback",
      },
    },
    completion = {
      list = { selection = { preselect = false, auto_insert = true } },
      menu = {
        auto_show = function(ctx) return ctx.mode ~= "cmdline" end,
        border = "rounded",
        winhighlight = "Normal:NormalFloat,FloatBorder:FloatBorder,CursorLine:PmenuSel,Search:None",
        draw = {
          treesitter = { "lsp" },
          components = {
            kind_icon = {
              text = function(ctx) return get_kind_icon(ctx).text end,
              highlight = function(ctx) return get_kind_icon(ctx).highlight end,
            },
          },
        },
      },
      accept = {
        auto_brackets = { enabled = true },
      },
      documentation = {
        auto_show = true,
        auto_show_delay_ms = 0,
        window = {
          border = "rounded",
          winhighlight = "Normal:NormalFloat,FloatBorder:FloatBorder,CursorLine:PmenuSel,Search:None",
        },
      },
    },
    signature = {
      window = {
        border = "rounded",
        winhighlight = "Normal:NormalFloat,FloatBorder:FloatBorder",
      },
    },
  },
  specs = {
    {
      "L3MON4D3/LuaSnip",
      optional = true,
      specs = { { "Saghen/blink.cmp", opts = { snippets = { preset = "luasnip" } } } },
    },
    {
      "AstroNvim/astrolsp",
      optional = true,
      opts = function(_, opts)
        opts.capabilities = require("blink.cmp").get_lsp_capabilities(opts.capabilities)

        -- disable AstroLSP signature help if `blink.cmp` is providing it
        local blink_opts = require("astrocore").plugin_opts "blink.cmp"
        if vim.tbl_get(blink_opts, "signature", "enabled") == true then
          if not opts.features then opts.features = {} end
          opts.features.signature_help = false
        end
      end,
    },
    {
      "folke/lazydev.nvim",
      optional = true,
      specs = {
        {
          "Saghen/blink.cmp",
          opts = function(_, opts)
            if pcall(require, "lazydev.integrations.blink") then
              return require("astrocore").extend_tbl(opts, {
                sources = {
                  -- add lazydev to your completion providers
                  default = { "lazydev" },
                  providers = {
                    lazydev = { name = "LazyDev", module = "lazydev.integrations.blink", score_offset = 100 },
                  },
                },
              })
            end
          end,
        },
      },
    },
    {
      "catppuccin",
      optional = true,
      ---@type CatppuccinOptions
      opts = { integrations = { blink_cmp = true } },
    },
    -- disable built in completion plugins
    { "hrsh7th/nvim-cmp", enabled = false },
    { "rcarriga/cmp-dap", enabled = false },
  },
}
