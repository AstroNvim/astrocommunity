return {
  "mikavilpas/yazi.nvim",
  version = "*",
  cmd = "Yazi",
  dependencies = {
    { "nvim-lua/plenary.nvim", lazy = true },
    {
      "AstroNvim/astrocore",
      ---@type AstroCoreOpts
      opts = {
        mappings = {
          n = {
            ["<Leader>-"] = { "<Cmd>Yazi<CR>", desc = "Open yazi at the current file" },
            ["<Leader>Yc"] = { "<Cmd>Yazi cwd<CR>", desc = "Open yazi in nvim's working directory" },
            ["<Leader>Yt"] = { "<Cmd>Yazi toggle<CR>", desc = "Resume the last yazi session" },
          },
          v = {
            ["<Leader>-"] = { "<Cmd>Yazi<CR>", desc = "Open yazi at the current file" },
          },
        },
      },
    },
  },
  opts = function()
    local opts = {
      open_for_directories = false,
      keymaps = {
        show_help = "<F1>",
      },
    }

    if pcall(require, "snacks") then
      opts.integrations = {
        grep_in_directory = "snacks.picker",
        grep_in_selected_files = "snacks.picker",
      }
    end

    return opts
  end,
}
