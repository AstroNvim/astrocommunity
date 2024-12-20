return {
  "thaerkh/vim-workspace",
  priority = 10000,
  lazy = false,
  specs = {
    { "resession.nvim", enabled = false },
    {
      "AstroNvim/astrocore",
      ---@param opts AstroCoreOpts
      opts = function(_, opts)
        local sessionoptions = {} -- https://github.com/thaerkh/vim-workspace/issues/11
        for _, value in ipairs(vim.tbl_get(opts, "options", "opt", "sessionoptions") or vim.opt.sessionoptions:get()) do
          if value ~= "blank" then table.insert(sessionoptions, value) end
        end
        return require("astrocore").extend_tbl(opts, {
          autocmds = {
            autoclose_neotree = {
              {
                event = "VimLeave",
                callback = function()
                  if vim.fn.exists ":Neotree" == 2 then vim.cmd.Neotree "close" end
                  if vim.fn.exists ":NERDTreeClose" == 2 then vim.cmd.NERDTreeClose() end
                end,
              },
            },
          },
          options = {
            opt = { sessionoptions = sessionoptions },
            g = {
              workspace_autosave_ignore = { "gitcommit", "neo-tree", "nerdtree", "qf", "tagbar" },
              workspace_session_disable_on_args = 1,
              workspace_session_directory = vim.fn.stdpath "cache" .. "/vim-workspace.sessions",
              workspace_undodir = vim.fn.stdpath "cache" .. "/vim-workspace.undodir",
              workspace_autocreate = 1,
              workspace_create_new_tabs = 0,
              -- Because a bug, these two populate search / history, just disable them.
              workspace_autosave_untrailtabs = 0,
              workspace_autosave_untrailspaces = 0,
              workspace_nocompatible = 0,
            },
          },
        })
      end,
    },
  },
}
