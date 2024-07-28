local is_available = function(plugin)
  local lazy_config_avail, lazy_config = pcall(require, "lazy.core.config")
  return (lazy_config_avail and lazy_config.spec.plugins[plugin] or nil) ~= nil
end
local haskell_ft = { "haskell", "lhaskell", "cabal", "cabalproject" }

local pack = {
  { import = "astrocommunity.pack.yaml" }, -- stack.yaml
  { import = "astrocommunity.pack.json" }, -- hls.json
  { import = "astrocommunity.test.neotest" }, -- neotest-haskell
  {
    "nvim-treesitter/nvim-treesitter",
    optional = true,
    opts = function(_, opts)
      if opts.ensure_installed ~= "all" then
        opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, { "haskell" })
      end
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    optional = true,
    opts = function(_, opts)
      opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, { "hls" })
    end,
  },
  {
    "jay-babu/mason-nvim-dap.nvim",
    optional = true,
    opts = function(_, opts)
      opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, { "haskell" })
    end,
  },
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    optional = true,
    opts = function(_, opts)
      opts.ensure_installed = require("astrocore").list_insert_unique(
        opts.ensure_installed,
        { "haskell-debug-adapter", "haskell-language-server" }
      )
    end,
  },
  {
    "mrcjkb/haskell-snippets.nvim",
    enabled = function() return is_available "LuaSnip" end,
    ft = haskell_ft,
    dependencies = { "L3MON4D3/LuaSnip" },
    config = function()
      local haskell_snippets = require("haskell-snippets").all
      require("luasnip").add_snippets("haskell", haskell_snippets, { key = "haskell" })
    end,
  },
  {
    "luc-tielen/telescope_hoogle",
    enabled = function() return is_available "telescope.nvim" end,
    ft = haskell_ft,
    dependencies = {
      { "nvim-telescope/telescope.nvim" },
    },
    config = function()
      local ok, telescope = pcall(require, "telescope")
      if ok then telescope.load_extension "hoogle" end
    end,
  },
  {
    "nvim-neotest/neotest",
    optional = true,
    dependencies = { "mrcjkb/neotest-haskell" },
    opts = function(_, opts)
      if not opts.adapters then opts.adapters = {} end
      table.insert(opts.adapters, require "neotest-haskell"(require("astrocore").plugin_opts "neotest-haskell"))
    end,
  },
}

if vim.fn.has "nvim-0.10" == 1 then
  -- haskell-tools v4 supports neovim v0.10+
  table.insert(pack, {
    "mrcjkb/haskell-tools.nvim",
    ft = haskell_ft,
    dependencies = {
      -- vim.fn.has >= nvim 0.9 removes plenary dependency
      { "nvim-lua/plenary.nvim", optional = vim.fn.has "nvim-0.9" == 1 },
      { "nvim-telescope/telescope.nvim", optional = true },
      { "mfussenegger/nvim-dap", optional = true },
      {
        "AstroNvim/astrolsp",
        ---@type AstroLSPOpts
        opts = {
          ---@diagnostic disable: missing-fields
          handlers = { hls = false },
        },
      },
    },
    version = "^4",
    init = function()
      local astrolsp_avail, astrolsp = pcall(require, "astrolsp")
      vim.g.haskell_tools = require("astrocore").extend_tbl({
        hls = astrolsp_avail and { capabilities = astrolsp.config.capabilities, on_attach = astrolsp.on_attach } or {},
      }, vim.g.haskell_tools)
    end,
  })
else
  -- TODO: Remove this with AstroNvim v5 when dropping Neovim v0.9 support
  -- haskell-tools v3 is the last version that supports neovim v0.9
  -- This is simply a copy/paste of the v3 configuration to be left alone just in case
  -- the setup gets breaking changes and diverges.
  table.insert(pack, {
    "mrcjkb/haskell-tools.nvim",
    ft = haskell_ft,
    dependencies = {
      -- vim.fn.has >= nvim 0.9 removes plenary dependency
      { "nvim-lua/plenary.nvim", optional = vim.fn.has "nvim-0.9" == 1 },
      { "nvim-telescope/telescope.nvim", optional = true },
      { "mfussenegger/nvim-dap", optional = true },
      {
        "AstroNvim/astrolsp",
        ---@type AstroLSPOpts
        opts = {
          ---@diagnostic disable: missing-fields
          handlers = { hls = false },
        },
      },
    },
    version = "^3",
    init = function()
      local astrolsp_avail, astrolsp = pcall(require, "astrolsp")
      vim.g.haskell_tools = require("astrocore").extend_tbl({
        hls = astrolsp_avail and { capabilities = astrolsp.config.capabilities, on_attach = astrolsp.on_attach } or {},
      }, vim.g.haskell_tools)
    end,
  })
end

return pack
