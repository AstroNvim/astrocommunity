return {
  {
    "neoclide/coc.nvim",
    branch = "release",
    init = function()
      vim.g.coc_global_extensions = {
        "coc-json",
      }
    end,
    cmd = {
      "CocCommand",
      "CocConfig",
      "CocDiagnostics",
      "CocDisable",
      "CocEnable",
      "CocInfo",
      "CocInstall",
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
        if not opts.commands then opts.commands = {} end
        opts.commands.Format = { "call CocAction('format')", desc = "Format file with LSP" }
        if not opts.mappings then opts.mappings = require("astrocore").empty_map_table() end
        local maps = assert(opts.mappings)
        maps.n["[d"] = { "<Plug>(coc-diagnostic-prev)", desc = "Previous diagnostic" }
        maps.n["]d"] = { "<Plug>(coc-diagnostic-next)", desc = "Next diagnostic" }
        maps.n.gd = { "<Plug>(coc-definition)", desc = "Show the definition of current symbol" }
        maps.n.gT = { "<Plug>(coc-type-definition)", desc = "Show the definition of current type" }
        maps.n.gI = { "<Plug>(coc-implementation)", desc = "Show the implementation of current symbol" }
        maps.n.gr = { "<Plug>(coc-references)", desc = "Show the references of current symbol" }
        maps.n["<Leader>lR"] = maps.n.gr
        maps.n["<Leader>lr"] = { "<Plug>(coc-rename)", desc = "Rename current symbol" }
        maps.n["<Leader>lf"] = { function() vim.cmd.Format() end, desc = "Format buffer", nowait = true }
        maps.n["<Leader>la"] = { "<Plug>(coc-codeaction-cursor)", desc = "LSP code action" }
        maps.n["<Leader>lL"] = { "<Plug>(coc-codelens-action)", desc = "LSP CodeLens run" }
        maps.n["<Leader>lc"] = { function() vim.cmd.CocConfig() end, desc = "Configuration" }
        maps.n.K = {
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
  },
  {
    "rebelot/heirline.nvim",
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
      statusline[9] = status.component.builder { -- status
        { provider = function() return vim.g.coc_status end },
        update = { "User", pattern = "CocStatusChange" },
        surround = { separator = "right", condition = function() return vim.g.coc_status ~= nil end },
        on_click = { name = "coc_status", callback = function() vim.schedule(vim.cmd.CocInfo) end },
      }
    end,
  },
  -- disable unnecessary plugins
  { "AstroNvim/astrolsp", enabled = false },
  { "hrsh7th/cmp-nvim-lsp", enabled = false },
  { "jose-elias-alvarez/null-ls.nvim", enabled = false },
  { "nvimtools/none-ls.nvim", enabled = false },
  { "jay-babu/mason-null-ls.nvim", enabled = false },
  { "williamboman/nvim-lsp-installer", enabled = false },
  { "neovim/nvim-lspconfig", enabled = false },
  { "williamboman/mason-lspconfig.nvim", enabled = false },
  { "hrsh7th/cmp-nvim-lsp", enabled = false },
  { "lvimuser/lsp-inlayhints.nvim", enabled = false },
  { "rcarriga/cmp-dap", enabled = false },
  -- refactor
  { "ThePrimeagen/refactoring.nvim", enabled = false },
  -- luaship
  { "L3MON4D3/LuaSnip", enabled = false },
  { "rafamadriz/friendly-snippets", enabled = false },
  -- cmp
  { "hrsh7th/nvim-cmp", enabled = false },
  { "hrsh7th/cmp-buffer", enabled = false },
  { "hrsh7th/cmp-path", enabled = false },
  { "saadparwaiz1/cmp_luasnip", enabled = false },
  { "folke/trouble.nvim", enabled = false },
  { "folke/neoconf.nvim", enabled = false },
}
