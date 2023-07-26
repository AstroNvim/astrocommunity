# Grapple.nvim

Neovim plugin for tagging important files

**Repository:** <https://github.com/cbochs/grapple.nvim>

### Example of a custom Heirline component for AstroNvim
![image](https://github.com/Subjective/astrocommunity/assets/56745535/333069eb-dea7-428f-b28d-31fd5912f95f)

```lua
local status = require "astrocore.status"

status.component.grapple = {
  provider = function()
    local available, grapple = pcall(require, "grapple")
    if available then
      local key = grapple.key { buffer = 0 }
      if key ~= nil then return " " .. key .. " " end
    end
  end,
}
```
**Example Configuration:**
```lua
return {
  plugins = {
    {
      "rebelot/heirline.nvim",
      opts = function(_, opts)
        local status = require("astrocore.status")

        -- custom heirline statusline component for grapple
        status.component.grapple = {
          provider = function()
            local available, grapple = pcall(require, "grapple")
            if available then
              local key = grapple.key { buffer = 0 }
              if key ~= nil then return " " .. key .. " " end
            end
          end,
        }

        opts.statusline = {
          hl = { fg = "fg", bg = "bg" },
          status.component.mode(),
          status.component.git_branch(),
          status.component.grapple, -- load the custom component
          status.component.file_info { filetype = {}, filename = false, file_modified = false },
          status.component.git_diff(),
          status.component.diagnostics(),
          status.component.fill(),
          status.component.cmd_info(),
          status.component.fill(),
          status.component.lsp(),
          status.component.treesitter(),
          status.component.nav(),
          status.component.mode { surround = { separator = "right" } },
        }
      end,
    },
  },
}
```
