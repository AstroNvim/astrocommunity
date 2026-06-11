# Mcphub.nvim

A powerful Neovim plugin for managing MCP (Model Context Protocol) servers.

> [!NOTE]
> This AstroCommunity spec configures the Neovim plugin only. It does not install the external `mcp-hub` binary automatically.

`mcphub.nvim` requires the `mcp-hub` command to be available before `:MCPHub` or `:checkhealth mcphub` can start the hub process. Install it with one of the upstream-supported methods, for example:

```sh
npm install -g mcp-hub@latest
```

Then verify that Neovim can see the binary:

```sh
mcp-hub --version
```

If you do not want a global install, use one of the upstream bundled-binary or custom-command setup options and override this spec in your user config. For example, to use the bundled binary:

```lua
{
  "ravitemer/mcphub.nvim",
  build = "bundled_build.lua",
  opts = {
    use_bundled_binary = true,
  },
}
```

**Repository:** <https://github.com/ravitemer/mcphub.nvim/tree/main>
