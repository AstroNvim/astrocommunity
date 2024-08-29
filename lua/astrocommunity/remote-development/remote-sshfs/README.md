# remote-sshfs

- Add plugin [remote-sshfs.nvim](https://github.com/nosduco/remote-sshfs.nvim)
- Require `sshfs` & `ssh`
- Bind keymap for convenience:
    - `<leader>Re` edit ssh config file
    - `<leader>Rc` select ssh target which is saved in your ssh config file
    - `<leader>Rd` disconnect (this will unmount sshfs)
- Override telescope find_files and live_grep to make dynamic based on if connected to host
    - Need `fd` and `ripgrep` be installed on server machine
- Check plugin README for more information
