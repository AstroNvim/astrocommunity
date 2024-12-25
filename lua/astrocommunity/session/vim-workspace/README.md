# vim-workspace

Automated Vim session management with file auto-save and persistent undo history 

The configuration of the plugin:

- disable resession.nvim - default astronvim session management
- auto create and auto load the workspace when neovim was started without any arguments
   - just `cd dir` and `nvim` to start the workspace
- auto save the workspace when neovim was closed
- handle neotree, NERDTree, git windows
- fix paths to use cache path of neovim

**Repository:** <https://github.com/thaerkh/vim-workspace>
