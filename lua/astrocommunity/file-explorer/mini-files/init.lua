-- This function is taken from LazyVim: https://github.com/LazyVim/LazyVim/blob/cb223553ff73eb2f37ffb5dc0bb75b76a4677faf/lua/lazyvim/plugins/extras/editor/mini-files.lua
local function map_split(buf_id, lhs, direction, close_on_file)
  local files = require "mini.files"
  local should_close = close_on_file == nil and true or close_on_file

  local rhs = function()
    local cur_target = files.get_explorer_state().target_window
    local new_target = vim.api.nvim_win_call(cur_target, function()
      vim.cmd(direction .. " split")
      return vim.api.nvim_get_current_win()
    end)

    files.set_target_window(new_target)
    files.go_in { close_on_file = should_close }
  end

  local desc = "Open in " .. direction .. " split"
  if should_close then desc = desc .. " and close" end
  vim.keymap.set("n", lhs, rhs, { buffer = buf_id, desc = desc })
end

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
                  pattern = "MiniFilesBufferCreate",
                  desc = "Create mappings to modify target window via split",
                  callback = function(args)
                    local buf_id = args.data.buf_id

                    map_split(buf_id, "<C-w>s", "belowright horizontal")
                    map_split(buf_id, "<C-w>v", "belowright vertical")
                    map_split(buf_id, "<C-w>t", "tab")

                    map_split(buf_id, "<C-w>S", "belowright horizontal", false)
                    map_split(buf_id, "<C-w>V", "belowright vertical", false)
                    map_split(buf_id, "<C-w>T", "tab", false)
                  end,
                },
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
