# Julia Language Pack

**Requirements:** `julia` must be in your `PATH` and executable

This plugin pack does the following:

- Adds `julia` Treesitter parsers
- Adds `julials` language server
- Adds [cmp-latex-symbols](https://github.com/kdheepak/cmp-latex-symbols) for easily inserting unicode symbols into code with latex notation with autocompletion with `cmp`
- Adds [TOML language support](../toml)

## Using System Images

Because of the long pre-compilation times of Julia it is highly recommended to utilize system images for the `LanguageServer.jl`. This requires some manual setup which this pack will automatically detect and disable the installation of `julials` if it is detected. A description of how to set up precompiled system images for the Julia language server can be found at this repository: <https://github.com/mehalter/.julia>

If you are going down this route, along with importing the pack from AstroCommunity, you also need to add the following plugin specification to your `plugins/` directory:

> [!NOTE]
> You should make sure that `julials` is not installed in Mason

```lua
return {
  "AstroNvim/astrolsp",
  opts = {
    -- manually set up the Julia language server
    -- since we won't be using Mason
    servers = { "julials" },
    config = {
      julials = {
        on_new_config = function(new_config)
          -- check for nvim-lspconfig julia sysimage shim
          -- this path may need to be updated if you set it up differently
          -- than the repository recommends above
          local julia = (vim.env.JULIA_DEPOT_PATH or vim.fn.expand "~/.julia")
            .. "/environments/nvim-lspconfig/bin/julia"
          -- if the shim is found, then update the julia command
          if require("lspconfig").util.path.is_file(julia) then new_config.cmd[1] = julia end
        end,
      },
    },
  },
}
```
