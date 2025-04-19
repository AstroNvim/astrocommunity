return {
  "neoclide/coc.nvim",
  branch = "release",
  cmd = {
    "CocCommand",
    "CocConfig",
    "CocDiagnostics",
    "CocDisable",
    "CocEnable",
    "CocInfo",
    "CocInstall",
    "CocList",
    "CocLocalConfig",
    "CocOpenLog",
    "CocOutline",
    "CocPrintErrors",
    "CocRestart",
    "CocSearch",
    "CocStart",
    "CocUninstall",
    "CocUpdate",
    "CocUpdateSync",
    "CocWatch",
  },
  event = { "User AstroFile", "InsertEnter" },
  dependencies = {
    "AstroNvim/astrocore",
    ---@param opts AstroCoreOpts
    opts = function(_, opts)
      if not opts.options then opts.options = {} end
      if not opts.options.g then opts.options.g = {} end
      if not opts.options.opt then opts.options.opt = {} end
      opts.options.opt.cmdheight = 1
      opts.options.g.coc_global_extensions = {
        "coc-json",
        "coc-marketplace",
      }

      if not opts.commands then opts.commands = {} end
      opts.commands.Format = { function() vim.fn.CocAction "format" end, desc = "Format file with LSP" }
      if not opts.mappings then opts.mappings = require("astrocore").empty_map_table() end
      local maps = assert(opts.mappings)
      maps.n["[d"] = { "<Plug>(coc-diagnostic-prev)", desc = "Previous diagnostic" }
      maps.n["]d"] = { "<Plug>(coc-diagnostic-next)", desc = "Next diagnostic" }
      maps.n["gD"] = { "<Plug>(coc-declaration)", desc = "Show the declaration of current symbol" }
      maps.n["gI"] = { "<Plug>(coc-implementation)", desc = "Show the implementation of current symbol" }
      maps.n["gT"] = { "<Plug>(coc-type-definition)", desc = "Show the definition of current type" }
      maps.n["gd"] = { "<Plug>(coc-definition)", desc = "Show the definition of current symbol" }
      maps.n["gr"] = { "<Plug>(coc-references)", desc = "Show the references of current symbol" }
      maps.n["<Leader>lR"] = maps.n.gr
      maps.n["<Leader>la"] = { "<Plug>(coc-codeaction-cursor)", desc = "LSP code action" }
      maps.n["<Leader>lc"] = { "<Cmd>CocConfig<CR>", desc = "Configuration" }
      maps.n["<Leader>lf"] = { function() vim.cmd.Format() end, desc = "Format buffer" }
      maps.n["<Leader>lm"] = { "<Cmd>CocList marketplace<CR>", desc = "Marketplace" }
      maps.n["<Leader>lr"] = { "<Plug>(coc-rename)", desc = "Rename current symbol" }
      maps.n["<Leader>ls"] = { "<Cmd>CocList symbols<CR>", desc = "Search symbols" }
      maps.n["<Leader>lS"] = { "<Cmd>CocOutline<CR>", desc = "Symbols outline" }
      maps.n["<Leader>lL"] = { "<Plug>(coc-codelens-action)", desc = "LSP CodeLens run" }
      maps.n["<Leader>uL"] = { "<Cmd>CocCommand document.toggleCodeLens<CR>", desc = "Toggle CodeLens" }
      maps.n["<Leader>uh"] = { "<Cmd>CocCommand document.toggleInlayHint<CR>", desc = "Toggle LSP inlay hints" }
      maps.x["<Leader>lF"] = { "<Plug>(coc-format-selected)", desc = "Format selection" }
      maps.n["K"] = {
        function()
          local cw = vim.fn.expand "<cword>"
          if vim.fn.index({ "vim", "help" }, vim.bo.filetype) >= 0 then
            vim.api.nvim_command("h " .. cw)
          elseif vim.api.nvim_eval "coc#rpc#ready()" then
            vim.fn.CocActionAsync "doHover"
          else
            vim.api.nvim_command("!" .. vim.o.keywordprg .. " " .. cw)
          end
        end,
        desc = "Hover symbol details",
      }
    end,
  },
  specs = {
    {
      "rebelot/heirline.nvim",
      optional = true,
      opts = function(_, opts)
        local statusline, status = opts.statusline, require "astroui.status"
        local function coc_diagnostic(coc_type, diagnostic_type)
          return {
            provider = function(self)
              local count = vim.b[self.bufnr or 0].coc_diagnostic_info[coc_type]
              return status.utils.stylize(
                count ~= 0 and tostring(count) or "",
                { icon = { kind = "Diagnostic" .. diagnostic_type, padding = { left = 1, right = 1 } } }
              )
            end,
            hl = { fg = "diag_" .. diagnostic_type:upper() },
          }
        end
        statusline[5] = status.component.builder { -- diagnostics
          coc_diagnostic("error", "Error"),
          coc_diagnostic("warning", "Warn"),
          coc_diagnostic("information", "Info"),
          coc_diagnostic("hint", "Hint"),
          update = { "User", pattern = "CocDiagnosticChange" },
          init = status.init.update_events { "BufEnter" },
          surround = {
            separator = "right",
            condition = function()
              for _, count in pairs(vim.b.coc_diagnostic_info or {}) do
                if type(count) == "number" and count > 0 then return true end
              end
              return false
            end,
          },
          on_click = { name = "coc_diagnostic", callback = function() vim.schedule(vim.cmd.CocDiagnostic) end },
        }
        -- FIXME: This update on every keypress, introducing delay for nearly all coc-extensions.
        --
        -- statusline[9] = status.component.builder { -- status
        --   {
        --     provider = function() return vim.g.coc_status end,
        --     on_click = { name = "coc_status", callback = function() vim.schedule(vim.cmd.CocInfo) end },
        --   },
        --   {
        --     provider = function()
        --       if vim.g.coc_status then
        --         return status.utils.stylize(" ", { icon = { kind = "ActiveLSP", padding = { left = 1 } } })
        --       end
        --     end,
        --     on_click = {
        --       name = "coc_services",
        --       callback = vim.schedule_wrap(function() vim.cmd.CocList "services" end),
        --     },
        --   },
        --   update = {
        --     "User",
        --     pattern = "CocStatusChange",
        --     callback = function() vim.schedule(vim.cmd.redrawstatus) end,
        --   },
        --   surround = { separator = "right", condition = function() return vim.g.coc_status ~= nil end },
        -- }
      end,
    },
    {
      "catppuccin",
      optional = true,
      ---@type CatppuccinOptions
      opts = { integrations = { coc_nvim = true } },
    },
    -- disable core lsp plugins
    { "AstroNvim/astrolsp", optional = true, enabled = false },
    { "folke/neoconf.nvim", optional = true, enabled = false },
    { "folke/neodev.nvim", optional = true, enabled = false },
    { "jay-babu/mason-null-ls.nvim", optional = true, enabled = false },
    { "neovim/nvim-lspconfig", optional = true, enabled = false },
    { "nvimtools/none-ls.nvim", optional = true, enabled = false },
    { "stevearc/aerial.nvim", optional = true, enabled = false },
    { "williamboman/mason-lspconfig.nvim", optional = true, enabled = false },
    -- cmp
    { "hrsh7th/cmp-buffer", optional = true, enabled = false },
    { "hrsh7th/cmp-nvim-lsp", optional = true, enabled = false },
    { "hrsh7th/cmp-path", optional = true, enabled = false },
    { "hrsh7th/nvim-cmp", optional = true, enabled = false },
    { "rcarriga/cmp-dap", optional = true, enabled = false },
    { "saadparwaiz1/cmp_luasnip", optional = true, enabled = false },
    -- luaship
    { "L3MON4D3/LuaSnip", optional = true, enabled = false },
    { "rafamadriz/friendly-snippets", optional = true, enabled = false },
    -- blink
    { "Saghen/blink.cmp", optional = true, enabled = false },
  },
}
