# Jujutsu/jj Pack

Pack for the [Jujutsu/jj](https://github.com/jj-vcs/jj) Git-compatible VCS.

This plugin pack does the following:

- Adds jj tab to Neo-tree with [neo-tree-jj.nvim](https://github.com/Cretezy/neo-tree-jj.nvim)
- Adds Telescope pickers with [telescope-jj.nvim](https://github.com/zschreur/telescope-jj.nvim)
  - `<Leader>jf` for files in repository (falls back to git files if not in jj repo), like `jj files`
  - `<Leader>jd` for files with changes, like `jj diff`
  - `<Leader>jc` for files with conflicts, like `jj resolve --list`
- Adds syntax highlighting for `.jjdescription` files (for use with `jj describe`) with [vim-jjdescription](https://github.com/avm99963/vim-jjdescription)
- Adds a [lazyjj](https://github.com/Cretezy/lazyjj) and [jjui](https://github.com/idursun/jjui) (TUIs for jj) terminal with `<Leader>jl` or `<Leader>ju` respectively, if the corresponding binaries are in `$PATH`
