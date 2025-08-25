# Ansible Language Pack

This plugin pack does the following:

- Adds a set of local functions to help with Ansible's filetype detection
- Adds `yaml` Treesitter parsers
- Adds `ansible-lint` and `ansible-language-server` via `mason-tool-installer.nvim`, if enabled
- Sets up `mason-lspconfig.nvim` to use `ansiblels` if enabled
- Adds the following `null-ls` sources:
  - [ansible-lint](https://github.com/ansible/ansible-lint)
- Adds the following `nvim-lint` sources:
  - [ansible-lint](https://github.com/ansible/ansible-lint)
- Adds [pearofducks/ansible-vim](https://github.com/pearofducks/ansible-vim), and sets it up to be loaded for `yaml.ansible` file types
