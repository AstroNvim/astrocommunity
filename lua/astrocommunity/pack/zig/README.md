# Zig Language Pack

**Requirements:**

- git (required by zig-tools)
- curl / wget (required by zig-tools)
- Neovim (>= 0.7.x)
- ripgrep (>= 11.0)
- Zig (>= 0.12.0 required for Neotest support)
- Zls (Make sure this is the same version as your zig version)

This plugin pack does the following:

- Adds `zig` Treesitter parsers
- Adds [neotest-zig](https://github.com/lawrence-laz/neotest-zig/tree/v1.2.0)
- Adds [zig-tools.nvim](https://codeberg.org/NTBBloodbath/zig-tools.nvim)

## Manage zls with mason

If you want `zls` to be managed with mason, you can add this table to your config:

```lua
{
    "williamboman/mason-lspconfig.nvim",
    optional = true,
    opts = function(_, opts)
      opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, { "zls" })
    end,
  }
```

Or trough mason-tool-installer:

```lua
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    optional = true,
    opts = function(_, opts)
      opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, { "zls" })
    end,
  }
```
