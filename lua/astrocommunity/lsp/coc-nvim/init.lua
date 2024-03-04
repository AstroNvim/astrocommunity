return {
  {
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
