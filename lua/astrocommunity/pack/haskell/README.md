# Haskell Language Pack

Requires:

- plenary.nvim: Since v3 droppped this requirement, it is handled by the pack
  during install.

Optionally:

- A local [hoogle](https://github.com/ndmitchell/hoogle) installation
  (recommended by haskell-tools)
- [fast-tags](https://github.com/elaforge/fast-tags) (recommended by
  haskell-tools)

This plugin pack does the following:

- Adds `haskell` treesitter parsers
- Adds `haskell-language-server` language server
- Adds `haskell-debug-adapter` dap adapter
- Adds [haskell-tools.nvim](https://github.com/mrcjkb/haskell-tools.nvim) (v3 or v4 depending on nvim version)
- Adds `yaml` language pack
- Adds `json` language pack
- Adds `neotest` from Astrocommunity
- Adds [neotest-haskell](https://github.com/mrcjkb/neotest-haskell)
- Adds [haskell-snippets.nvim](https://github.com/mrcjkb/haskell-snippets.nvim)

Optionally available:

> :warning: A local hoogle installation is required for this to work.

- Adds [telescope-hoogle](https://github.com/psiska/telescope-hoogle.nvim)

To install, set `{ "luc-tielen/telescope_hoogle" },` in `user/plugins/core.lua`
and install this pack as normal.
