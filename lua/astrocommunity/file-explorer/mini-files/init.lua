return {
  "echasnovski/mini.files",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
    {
      "AstroNvim/astrocore",
      opts = {
        mappings = {
          n = {
            ["<Leader>e"] = {
              function()
                if not require("mini.files").close() then require("mini.files").open() end
              end,
              desc = "Explorer",
            },
          },
        },
      },
    },
  },
  specs = {
    { "neo-tree.nvim", optional = true, enabled = false },
    {
      "catppuccin",
      optional = true,
      ---@type CatppuccinOptions
      opts = { integrations = { mini = true } },
    },
    {
      "AstroNvim/astrolsp",
      optional = true,
      specs = {
        {
          "AstroNvim/astrocore",
          ---@type AstroCoreOpts
          opts = {
            autocmds = {
              mini_files_lsp_operations = {
                {
                  event = "User",
                  pattern = "MiniFilesActionCreate",
                  desc = "execute `didCreateFiles` operation when creating files",
                  callback = function(args) require("astrolsp.file_operations").didCreateFiles(args.data.to) end,
                },
                {
                  event = "User",
                  pattern = "MiniFilesActionDelete",
                  desc = "execute `didDeleteFiles` operation when deleting files",
                  callback = function(args) require("astrolsp.file_operations").didDeleteFiles(args.data.from) end,
                },
                {
                  event = "User",
                  pattern = { "MiniFilesActionMove", "MiniFilesActionRename" },
                  desc = "execute `didRenameFiles` operation when moving or renaming files",
                  callback = function(args) require("astrolsp.file_operations").didRenameFiles(args.data) end,
                },
              },
            },
          },
        },
      },
    },
  },
  opts = {},
}
