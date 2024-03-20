return {
  "wfxr/minimap.vim",
  cmd = { "Minimap", "MinimapClose", "MinimapToggle", "MinimapRefresh", "MinimapUpdateHighlight" },
  dependencies = {
    {
      "AstroNvim/astrocore",
      opts = {
        mappings = {
          n = {
            ["<Leader>um"] = { "<Cmd>MinimapToggle<CR>", desc = "Toggle minimap" },
          },
        },
        options = {
          g = {
            minimap_width = 10,
            minimap_auto_start = 1,
            minimap_auto_start_win_enter = 1,
            minimap_block_filetypes = {
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
            },
            minimap_highlight_search = 1,
            minimap_git_colors = 1,
          },
        },
      },
    },
  },
}
