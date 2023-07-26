return {
  {
    "AstroNvim/astrocore",
    opts = {
      mappings = {
        ["<leader>um"] = { "<cmd>MinimapToggle<CR>", desc = "Toggle minimap" },
      },
    },
  },
  {

    "wfxr/minimap.vim",
    event = "User AstroFile",
    cmd = { "Minimap", "MinimapClose", "MinimapToggle", "MinimapRefresh", "MinimapUpdateHighlight" },
    init = function()
      vim.g.minimap_width = 10
      vim.g.minimap_auto_start = 1
      vim.g.minimap_auto_start_win_enter = 1
      vim.g.minimap_block_filetypes = {
        "fugitive",
        "nerdtree",
        "tagbar",
        "fzf",
        "qf",
        "netrw",
        "NvimTree",
        "lazy",
        "mason",
        "prompt",
        "TelescopePrompt",
        "noice",
        "notify",
        "neo-tree",
      }
      vim.g.minimap_highlight_search = 1
      vim.g.minimap_git_colors = 1
    end,
  },
}
