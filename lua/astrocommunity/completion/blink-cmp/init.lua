local function has_words_before()
  local line, col = (unpack or table.unpack)(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match "%s" == nil
end

---@type function?
local icon_provider

local function get_icon(CTX)
  if not icon_provider then
    local base = function(ctx) ctx.kind_hl_group = "BlinkCmpKind" .. ctx.kind end
    local _, mini_icons = pcall(require, "mini.icons")
    if _G.MiniIcons then
      icon_provider = function(ctx)
        base(ctx)
        if ctx.item.source_name == "LSP" then
          local item_doc, color_item = ctx.item.documentation, nil
          if item_doc then
            local highlight_colors_avail, highlight_colors = pcall(require, "nvim-highlight-colors")
            color_item = highlight_colors_avail and highlight_colors.format(item_doc, { kind = ctx.kind })
          end
          local icon, hl = mini_icons.get("lsp", ctx.kind or "")
          if icon then
            ctx.kind_icon = icon
            ctx.kind_hl_group = hl
          end
          if color_item and color_item.abbr and color_item.abbr_hl_group then
            ctx.kind_icon, ctx.kind_hl_group = color_item.abbr, color_item.abbr_hl_group
          end
        elseif ctx.item.source_name == "Path" then
          ctx.kind_icon, ctx.kind_hl_group = mini_icons.get(ctx.kind == "Folder" and "directory" or "file", ctx.label)
        end
      end
    end
    local lspkind_avail, lspkind = pcall(require, "lspkind")
    if lspkind_avail then
      icon_provider = function(ctx)
        base(ctx)
        if ctx.item.source_name == "LSP" then
          local item_doc, color_item = ctx.item.documentation, nil
          if item_doc then
            local highlight_colors_avail, highlight_colors = pcall(require, "nvim-highlight-colors")
            color_item = highlight_colors_avail and highlight_colors.format(item_doc, { kind = ctx.kind })
          end
          local icon = lspkind.symbolic(ctx.kind, { mode = "symbol" })
          if icon then ctx.kind_icon = icon end
          if color_item and color_item.abbr and color_item.abbr_hl_group then
            ctx.kind_icon, ctx.kind_hl_group = color_item.abbr, color_item.abbr_hl_group
          end
        end
      end
    end
    icon_provider = base
  end
  icon_provider(CTX)
end

return {
  "Saghen/blink.cmp",
  event = { "InsertEnter", "CmdlineEnter" },
  version = "0.*",
  dependencies = { "rafamadriz/friendly-snippets" },
  opts_extend = { "sources.default", "sources.cmdline" },
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
          if has_words_before() then return cmp.show() end
        end,
        "fallback",
      },
      ["<S-Tab>"] = { "select_prev", "snippet_backward", "fallback" },
    },
    completion = {
      list = { selection = function(ctx) return ctx.mode == "cmdline" and "auto_insert" or "preselect" end },
      menu = {
        border = "rounded",
        winhighlight = "Normal:NormalFloat,FloatBorder:FloatBorder,CursorLine:PmenuSel,Search:None",
        draw = {
          components = {
            kind_icon = {
              text = function(ctx)
                get_icon(ctx)
                return ctx.kind_icon .. ctx.icon_gap
              end,
              highlight = function(ctx)
                get_icon(ctx)
                return ctx.kind_hl_group
              end,
            },
          },
        },
      },
      accept = {
        auto_brackets = { enabled = true },
      },
      documentation = {
        auto_show = true,
        auto_show_delay_ms = 200,
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
      "AstroNvim/astrolsp",
      optional = true,
      opts = function(_, opts) opts.capabilities = require("blink.cmp").get_lsp_capabilities(opts.capabilities) end,
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
    -- disable built in completion plugins
    { "hrsh7th/nvim-cmp", enabled = false },
    { "rcarriga/cmp-dap", enabled = false },
    { "L3MON4D3/LuaSnip", enabled = false },
  },
}
