if not vim.g.vscode then return {} end -- don't do anything in non-vscode instances

local enabled = {}
vim.tbl_map(function(plugin) enabled[plugin] = true end, {
  -- core plugins
  "lazy.nvim",
  "AstroNvim",
  "astrocore",
  "astroui",
  "Comment.nvim",
  "nvim-autopairs",
  "nvim-treesitter",
  "nvim-ts-autotag",
  "nvim-treesitter-textobjects",
  "nvim-ts-context-commentstring",
  -- more known working
  "flash.nvim",
  "flit.nvim",
  "leap.nvim",
  "mini.ai",
  "mini.comment",
  "mini.surround",
  "vim-easy-align",
  "vim-repeat",
  "vim-sandwich",
  -- feel free to open PRs to add more support!
})

local Config = require "lazy.core.config"
-- disable plugin update checking
Config.options.checker.enabled = false
Config.options.change_detection.enabled = false
-- replace the default `cond`
Config.options.defaults.cond = function(plugin) return enabled[plugin.name] end

---@type LazySpec
return {
  -- add a few keybindings
  {
    "AstroNvim/astrocore",
    ---@type AstroCoreOpts
    opts = {
      mappings = {
        n = {
          ["<Leader>ff"] = "<Cmd>Find<CR>",
          ["<Leader>fw"] = function() require("vscode-neovim").action "workbench.action.findInFiles" end,

          -- LSP Mappings
          ["K"] = function() require("vscode-neovim").action "editor.action.showHover" end,
          ["gI"] = function() require("vscode-neovim").action "editor.action.goToImplementation" end,
          ["gd"] = function() require("vscode-neovim").action "editor.action.revealDefinition" end,
          ["gD"] = function() require("vscode-neovim").action "editor.action.revealDeclaration" end,
          ["gr"] = function() require("vscode-neovim").action "editor.action.goToReferences" end,
          ["gy"] = function() require("vscode-neovim").action "editor.action.goToTypeDefinition" end,
          ["<Leader>la"] = function() require("vscode-neovim").action "editor.action.quickFix" end,
          ["<Leader>lG"] = function() require("vscode-neovim").action "workbench.action.showAllSymbols" end,
          ["<Leader>lR"] = function() require("vscode-neovim").action "editor.action.goToReferences" end,
          ["<Leader>lr"] = function() require("vscode-neovim").action "editor.action.rename" end,
          ["<Leader>ls"] = function() require("vscode-neovim").action "workbench.action.gotoSymbol" end,
          ["<Leader>lf"] = function() require("vscode-neovim").action "editor.action.formatDocument" end,
        },
      },
    },
  },
  -- disable colorscheme setting
  { "AstroNvim/astroui", opts = { colorscheme = false } },
  -- disable treesitter highlighting
  { "nvim-treesitter/nvim-treesitter", opts = { highlight = { enable = false } } },
}
