return {
  { "resession.nvim", enabled = false },
  {
    "thaerkh/vim-workspace",
    enabled = true,
    priority = 10000,
    lazy = false,
    init = function()
      vim.cmd [[
      let g:workspace_autosave_ignore = ['gitcommit', "neo-tree", "nerdtree", "qf", "tagbar"]
      let g:workspace_session_disable_on_args = 1
      let g:workspace_session_directory = stdpath("cache") . '/vim-workspace.sessions'
      let g:workspace_undodir= stdpath("cache") . "/vim-workspace.undodir"
      let g:workspace_autocreate = 1
      " nnoremap <leader>W :ToggleWorkspace<CR>
      autocmd VimLeave *
          \ if exists(":Neotree") | execute 'Neotree close' | endif |
          \ if exists(":NERDTreeClose") | execute 'NERDTreeClose' | endif
	    let g:workspace_create_new_tabs = 0
	    " Because a bug, these two populate search / history, just disable them.
	    let g:workspace_autosave_untrailtabs = 0
	    let g:workspace_autosave_untrailspaces = 0
	    let g:workspace_nocompatible = 0
	    let g:workspace_session_disable_on_args = 1
	    " https://github.com/thaerkh/vim-workspace/issues/11
	    set sessionoptions-=blank
      ]]
    end,
  },
}
