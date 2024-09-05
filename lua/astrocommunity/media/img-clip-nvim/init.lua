return {
  "HakonHarnes/img-clip.nvim",
  cmd = { "PasteImage", "ImgClipDebug", "ImgClipConfig" },
  specs = {
    {
      "AstroNvim/astrocore",
      opts = {
        mappings = {
          n = {
            ["<Leader>P"] = { "<CMD>PasteImage<CR>", desc = "Paste image from system clipboard" },
          },
        },
      },
    },
  },
  opts = {
    default = {
      prompt_for_file_name = false,
      drag_and_drop = {
        insert_mode = true,
      },
      use_absolute_path = vim.fn.has "win32" == 1, -- default to absolute path for windows users
    },
  },
}
