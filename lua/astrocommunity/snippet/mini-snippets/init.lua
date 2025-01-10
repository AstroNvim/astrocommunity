return {
  "echasnovski/mini.snippets",
  dependencies = "rafamadriz/friendly-snippets",
  opts_extend = { "snippets" },
  opts = function(_, opts)
    local mini_snippets = require "mini.snippets"
    local gen_loader = mini_snippets.gen_loader
    opts.snippets = vim.list_extend({
      -- global snippets file
      gen_loader.from_file(vim.fn.stdpath "config" .. "/snippets/global.json"),
      -- load language specific snippets from runtime
      gen_loader.from_lang(),
      -- load global, project local snippets
      gen_loader.from_file ".vscode/project.code-snippets",
      -- load language specific, project local snippets
      function(context)
        local rel_path = ".vscode/" .. context.lang .. ".code-snippets"
        return vim.fn.filereadable(rel_path) == 1 and mini_snippets.read_file(rel_path)
      end,
    }, opts.snippets or {})
  end,
  specs = {
    {
      "AstroNvim/astrocore",
      ---@param opts AstroCoreOpts
      opts = function(_, opts)
        local snippet_mode_change
        local stop_all_sessions = function()
          local mini_snippets = require "mini.snippets"
          while mini_snippets.session.get(false) do
            mini_snippets.session.stop()
          end
          snippet_mode_change = nil
        end
        opts.autocmds.mini_snippets_stop = {
          {
            event = "User",
            pattern = "MiniSnippetsSessionStart",
            desc = "Set up snippet stopping when going to normal mode autocmd",
            callback = function()
              if not snippet_mode_change then
                snippet_mode_change = vim.api.nvim_create_autocmd(
                  "ModeChanged",
                  { pattern = "*:n", once = true, callback = stop_all_sessions }
                )
              end
            end,
          },
        }
      end,
    },
    {
      "hrsh7th/nvim-cmp",
      optional = true,
      dependencies = { { "abeldekat/cmp-mini-snippets", lazy = true } },
      opts = function(_, opts)
        local mini_snippets, cmp = require "mini.snippets", require "cmp"

        if not opts.snippet then opts.snippet = {} end
        opts.snippet.expand = function(args)
          (mini_snippets.config.expand.insert or mini_snippets.default_insert) { body = args.body }
        end

        if not opts.sources then opts.sources = {} end
        table.insert(opts.sources, { name = "mini_snippets", priority = 750 })

        local function has_words_before()
          local line, col = (unpack or table.unpack)(vim.api.nvim_win_get_cursor(0))
          return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match "%s" == nil
        end
        local function is_visible(CMP) return CMP.core.view:visible() or vim.fn.pumvisible() == 1 end

        if not opts.mappings then opts.mappings = {} end
        opts.mapping["<Tab>"] = cmp.mapping(function(fallback)
          if is_visible(cmp) then
            cmp.select_next_item()
          elseif vim.api.nvim_get_mode().mode ~= "c" and mini_snippets.session.get(false) then
            mini_snippets.session.jump "next"
          elseif has_words_before() then
            cmp.complete()
          else
            fallback()
          end
        end)
        opts.mapping["<S-Tab>"] = cmp.mapping(function(fallback)
          if is_visible(cmp) then
            cmp.select_prev_item()
          elseif vim.api.nvim_get_mode().mode ~= "c" and mini_snippets.session.get(false) then
            mini_snippets.session.jump "prev"
          else
            fallback()
          end
        end)
      end,
    },
    {
      "Saghen/blink.cmp",
      dependencies = "echasnovski/mini.snippets",
      optional = true,
      opts = { snippets = { preset = "mini_snippets" } },
    },
    { "L3MON4D3/LuaSnip", enabled = false },
  },
}
