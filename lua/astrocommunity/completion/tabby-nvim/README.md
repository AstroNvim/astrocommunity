# Mac/Windows Installation

https://tabby.tabbyml.com/docs/installation/

# Linux Installation

## Using Docker

### Install the latest version of node (this uses [Node Version Manager](https://github.com/nvm-sh/nvm))
```bash
nvm install node
```

### Install NVIDIA Container Toolkit
https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/latest/install-guide.html

### Run Docker container

Choose <model> from [Tabby Models Registry](https://tabby.tabbyml.com/docs/models/)

```bash
docker run -it --gpus all \
  -p 8080:8080 -v $HOME/.tabby:/data \
  tabbyml/tabby serve --model <model> --device cuda
```

### Tabby Server

If your Tabby server endpoint is different from the default http://localhost:8080, please set the endpoint in ~/.tabby-client/agent/config.toml

### Example Config
```lua
vim.g.tabby_keybinding_accept = '<Tab>'
vim.g.tabby_keybinding_trigger_or_dismiss = '<C-\\>'

vim.g.tabby_node_binary = '/path/to/node' -- find using `which node`

return {
  { 'TabbyML/vim-tabby' }
}
```


# Usage 

After installation, please exit and restart Vim or NeoVim. Then you can check the Tabby plugin status by running :Tabby in your vim command line. If you see any message reported by Tabby, it means the plugin is installed successfully. If you see Not an editor command: Tabby or any other error message, please check the installation steps.

In insert mode, Tabby plugin will show inline completion automatically when you stop typing. You can simply press <Tab> to accept the completion. If you want to dismiss the completion manually, you can press <C-\> to dismiss, and press <C-\> again to show the completion again.


# Known Conflicts

    For the default settings, Tabby will attempt to set up the <Tab> key mapping. If Tabby's inline completion is not displayed, it will fall back to the original mapping. However, this approach might not work when there is a conflict with other plugins that also map the <Tab> key, as they could overwrite Tabby's mapping. In such cases, you can use a different keybinding to accept the completion and avoid conflicts.

    Tabby internally utilizes the <C-R><C-O> command to insert the completion. If you have mapped <C-R> to other functions, you won't be able to accept the completion. In such scenarios, you may need to manually modify the function tabby#Accept() in autoload/tabby.vim.
