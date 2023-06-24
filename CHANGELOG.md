# Changelog

## [3.0.0](https://github.com/AstroNvim/astrocommunity/compare/v2.0.0...v3.0.0) (2023-06-24)


### ⚠ BREAKING CHANGES

* **harpoon:** fix mapping that conflicts with core mapping ([#308](https://github.com/AstroNvim/astrocommunity/issues/308))
* **harpoon:** remove "j" keymap, make "t" keymap dynamic based on $TMUX ([#292](https://github.com/AstroNvim/astrocommunity/issues/292))
* **treesj:** fix typo in plugin name ([#293](https://github.com/AstroNvim/astrocommunity/issues/293))
* **motion:** separate flit.nvim from leap.nvim ([#281](https://github.com/AstroNvim/astrocommunity/issues/281))

### Features

* **code-runner:** add compiler.nvim ([#298](https://github.com/AstroNvim/astrocommunity/issues/298)) ([9324921](https://github.com/AstroNvim/astrocommunity/commit/9324921725e1ccde3d6956a0db8d5d452f55f5bd))
* **completion:** add tabnine-nvim ([#291](https://github.com/AstroNvim/astrocommunity/issues/291)) ([09113da](https://github.com/AstroNvim/astrocommunity/commit/09113daeaf20bfe642b023deb24d8cc0befee796))
* **editing-support:** add suda.vim ([#284](https://github.com/AstroNvim/astrocommunity/issues/284)) ([aca1c8a](https://github.com/AstroNvim/astrocommunity/commit/aca1c8a1c55443f3fde0b0149471164239007f3d))
* **harpoon:** remove "j" keymap, make "t" keymap dynamic based on $TMUX ([#292](https://github.com/AstroNvim/astrocommunity/issues/292)) ([9bb0747](https://github.com/AstroNvim/astrocommunity/commit/9bb074739673af2fa35a2f0f30908291f4fb48b9))
* **markdown-and-latex:** add peek.nvim markdown preview ([#285](https://github.com/AstroNvim/astrocommunity/issues/285)) ([600c22e](https://github.com/AstroNvim/astrocommunity/commit/600c22ebef6b480fe24ab1f23a3de1b4fd8221d2))
* **motion:** separate flit.nvim from leap.nvim ([#281](https://github.com/AstroNvim/astrocommunity/issues/281)) ([dcaf64c](https://github.com/AstroNvim/astrocommunity/commit/dcaf64ca292031366842b0deefe6685a9b21eb65))
* **pack:** add cpp base pack ([#295](https://github.com/AstroNvim/astrocommunity/issues/295)) ([8ac4492](https://github.com/AstroNvim/astrocommunity/commit/8ac4492258141e6b22e824a9c29755f6bba73e60))
* **pack:** add luacheck linter to lua pack ([#270](https://github.com/AstroNvim/astrocommunity/issues/270)) ([569f4f8](https://github.com/AstroNvim/astrocommunity/commit/569f4f8ca83e8d3233e0d43944e8ae0ea3c0cb07))
* **peek:** add peek markdown preview ([600c22e](https://github.com/AstroNvim/astrocommunity/commit/600c22ebef6b480fe24ab1f23a3de1b4fd8221d2))
* **scrolling:** add neoscroll.nvim ([#276](https://github.com/AstroNvim/astrocommunity/issues/276)) ([df8e769](https://github.com/AstroNvim/astrocommunity/commit/df8e769b942180f17bf2ae06796ae4770e12694c))
* **split-and-window:** add edgy.nvim ([#306](https://github.com/AstroNvim/astrocommunity/issues/306)) ([83bf8a7](https://github.com/AstroNvim/astrocommunity/commit/83bf8a7035adcd39db5d3f68941a54772a066c21))
* **suda:** add suda-vim.lua ([aca1c8a](https://github.com/AstroNvim/astrocommunity/commit/aca1c8a1c55443f3fde0b0149471164239007f3d))


### Bug Fixes

* **ccc-nvim.lua:** highlighter attached buffer error ([#283](https://github.com/AstroNvim/astrocommunity/issues/283)) ([029aeb7](https://github.com/AstroNvim/astrocommunity/commit/029aeb713bc4cb460486f5dbd2a3f31ef94d2683))
* **dart:** fix dart pack ([#289](https://github.com/AstroNvim/astrocommunity/issues/289)) ([513cc02](https://github.com/AstroNvim/astrocommunity/commit/513cc029514de5ffc782b2c4abd9ae30ce6e5806))
* **grapple:** cycle keybind overrides default window switching keybind ([#296](https://github.com/AstroNvim/astrocommunity/issues/296)) ([40419cb](https://github.com/AstroNvim/astrocommunity/commit/40419cb34a41c4a6826f83f57db6b604638f90a8))
* **gruvbox:** readme on configuration ([#280](https://github.com/AstroNvim/astrocommunity/issues/280)) ([b4502e5](https://github.com/AstroNvim/astrocommunity/commit/b4502e52a628cbc4173ed702b04beabb725089dc))
* **harpoon:** fix mapping that conflicts with core mapping ([#308](https://github.com/AstroNvim/astrocommunity/issues/308)) ([400e87e](https://github.com/AstroNvim/astrocommunity/commit/400e87ec23babdcb1f5d105ae0b4e90feb03fd28))
* **harpoon:** typo in concatenation ([#303](https://github.com/AstroNvim/astrocommunity/issues/303)) ([901fc36](https://github.com/AstroNvim/astrocommunity/commit/901fc36da55f92de981fdc135125544c1b690ace))
* **pack/tailwindcss:** use icon when color is not available for cmp ([#297](https://github.com/AstroNvim/astrocommunity/issues/297)) ([53cea57](https://github.com/AstroNvim/astrocommunity/commit/53cea5793ad71e7c428165c8e2fa10c8ee725e7b))
* Remove rustywind from tailwindcss pack ([#294](https://github.com/AstroNvim/astrocommunity/issues/294)) ([bfb9f9c](https://github.com/AstroNvim/astrocommunity/commit/bfb9f9c0cb43d8933688f7234f6ffa9dfc6ce9b9))
* **treesj:** fix typo in plugin name ([#293](https://github.com/AstroNvim/astrocommunity/issues/293)) ([08c30f4](https://github.com/AstroNvim/astrocommunity/commit/08c30f40c5dc35a296bca00d4effcd324a75f86e))
* **typescript:** fix filetype lazy loading key ([#290](https://github.com/AstroNvim/astrocommunity/issues/290)) ([c7d16ac](https://github.com/AstroNvim/astrocommunity/commit/c7d16acdd362259a07784057bdea735a7081c73c))
* **typescript:** fix null_ls eslint_d registration(s) ([#274](https://github.com/AstroNvim/astrocommunity/issues/274)) ([947fbf0](https://github.com/AstroNvim/astrocommunity/commit/947fbf06716a86df5948a810c7146c39befd21fe))
* **typescript:** improve eslint and prettier loading ([#231](https://github.com/AstroNvim/astrocommunity/issues/231)) ([39835ba](https://github.com/AstroNvim/astrocommunity/commit/39835baf8410b869a527fcf27bee33b38ceec977))
* **typescript:** protect against malformed or empty package.json ([#307](https://github.com/AstroNvim/astrocommunity/issues/307)) ([9bf02e1](https://github.com/AstroNvim/astrocommunity/commit/9bf02e1e75dd53f63ba072d6a9b6ed98d5671715))
* **vim-sandwich:** load vim-sandwich on keys and not file event ([#299](https://github.com/AstroNvim/astrocommunity/issues/299)) ([a2d5a45](https://github.com/AstroNvim/astrocommunity/commit/a2d5a4571626b718eed605463b7f6210899be0b3))

## [2.0.0](https://github.com/AstroNvim/astrocommunity/compare/v1.11.0...v2.0.0) (2023-06-07)


### ⚠ BREAKING CHANGES

* rename plugins to follow convention ([#255](https://github.com/AstroNvim/astrocommunity/issues/255))
* **colorscheme:** rename colorshemes to guidelines ([#243](https://github.com/AstroNvim/astrocommunity/issues/243))

### Features

* add vim-highlighter ([#233](https://github.com/AstroNvim/astrocommunity/issues/233)) ([691fef1](https://github.com/AstroNvim/astrocommunity/commit/691fef14cf2d18200b5067e19253038320b25f85))
* **bars-and-lines:** add dropbar.nvim ([#246](https://github.com/AstroNvim/astrocommunity/issues/246)) ([60d92e2](https://github.com/AstroNvim/astrocommunity/commit/60d92e2a3ecdc24140691a15d7efc4c63fcaa87e))
* **colorscheme:** add 'vscode', 'onedarkpro', 'sonokai' ([#242](https://github.com/AstroNvim/astrocommunity/issues/242)) ([a717c95](https://github.com/AstroNvim/astrocommunity/commit/a717c95b9930c9772fb7175c92df448d0436abe3))
* **colorschemes:** adding mellow, juliana, neosolarized ([#238](https://github.com/AstroNvim/astrocommunity/issues/238)) ([02d0c1e](https://github.com/AstroNvim/astrocommunity/commit/02d0c1e03fb3f5c7331c7df56c65cadce491872d))
* **debugging:** add persistent-breakpoints.nvim ([#267](https://github.com/AstroNvim/astrocommunity/issues/267)) ([415befb](https://github.com/AstroNvim/astrocommunity/commit/415befb2d45c9d93c087504862e5ec7e2b20a36d))
* **editing-support:** Add descriptions to true zen bindings ([#261](https://github.com/AstroNvim/astrocommunity/issues/261)) ([7f72b6b](https://github.com/AstroNvim/astrocommunity/commit/7f72b6b106c429051435036feac6ee06b7f3c61b))
* **editing-support:** add keymaps to refactoring-nvim ([#264](https://github.com/AstroNvim/astrocommunity/issues/264)) ([e438b4b](https://github.com/AstroNvim/astrocommunity/commit/e438b4b2cffceff2a60b131e495bb34311138a7c))
* **editing-support:** add true-zen.nvim ([#223](https://github.com/AstroNvim/astrocommunity/issues/223)) ([5356792](https://github.com/AstroNvim/astrocommunity/commit/53567920cebca31feca08a900903132ce99a9b7b))
* **markdown-and-latex:** add markmap.nvim ([#229](https://github.com/AstroNvim/astrocommunity/issues/229)) ([49f60ac](https://github.com/AstroNvim/astrocommunity/commit/49f60ace000a86cb0ea41ab329b412dcaf915ead))
* **markdown-and-latex:** install markmap from mason ([#258](https://github.com/AstroNvim/astrocommunity/issues/258)) ([abd7777](https://github.com/AstroNvim/astrocommunity/commit/abd7777e9d50feed3c56b8e446b89596b4025784))
* **nord-nvim:** add interoperability with headlines and bufferline ([048bda4](https://github.com/AstroNvim/astrocommunity/commit/048bda4e82994bba7b5ce87157aa962e65cf3712))
* **pack:** add html-css base pack ([#260](https://github.com/AstroNvim/astrocommunity/issues/260)) ([a6fb350](https://github.com/AstroNvim/astrocommunity/commit/a6fb3506d7999204233e37d03ac1b25d3ee993e3))
* **pack:** add selene linter to lua pack ([#253](https://github.com/AstroNvim/astrocommunity/issues/253)) ([109b127](https://github.com/AstroNvim/astrocommunity/commit/109b127222498d0f9f1db96fec2b063cfb496f0c))
* **pack:** adds angular pack ([#254](https://github.com/AstroNvim/astrocommunity/issues/254)) ([5745eb0](https://github.com/AstroNvim/astrocommunity/commit/5745eb0da1bdf2ee37856586335af80c2ac4427c))
* **pack:** clojure language pack ([#248](https://github.com/AstroNvim/astrocommunity/issues/248)) ([dd38bb9](https://github.com/AstroNvim/astrocommunity/commit/dd38bb9a1573a1ffd71474e552944aa942cc6131))
* **resession:** enable resession extension if plugin is available ([#230](https://github.com/AstroNvim/astrocommunity/issues/230)) ([8655f09](https://github.com/AstroNvim/astrocommunity/commit/8655f09688e38c733db7acca623438639474bc0e))
* **satellite-nvim:** add interoperability with zen-mode ([cb6ad15](https://github.com/AstroNvim/astrocommunity/commit/cb6ad15697f3661bb35d1b1b79d96c60457d9b6c))
* **startup:** add fsplash plugin ([#221](https://github.com/AstroNvim/astrocommunity/issues/221)) ([b88a6e6](https://github.com/AstroNvim/astrocommunity/commit/b88a6e68c68b5fc5b780c767d8c0ba8cd360198e))
* **workflow:** add hardtime.nvim ([#236](https://github.com/AstroNvim/astrocommunity/issues/236)) ([32e14dd](https://github.com/AstroNvim/astrocommunity/commit/32e14ddceb1dd1348a0b9120bd8b9c1d51dbc412))


### Bug Fixes

* **colorscheme:** rename colorshemes to guidelines ([#243](https://github.com/AstroNvim/astrocommunity/issues/243)) ([9c1a10a](https://github.com/AstroNvim/astrocommunity/commit/9c1a10a926a33f869ecc36a7da8ca79e459e0fb3))
* disable some plugins that don't work with neovide ([#237](https://github.com/AstroNvim/astrocommunity/issues/237)) ([fe06ccf](https://github.com/AstroNvim/astrocommunity/commit/fe06ccf9057fc09e8804da0b1e1a47e3fc963eef))
* **editing-support:** Wrap true-zen opts in function ([#226](https://github.com/AstroNvim/astrocommunity/issues/226)) ([348e49c](https://github.com/AstroNvim/astrocommunity/commit/348e49c72c917b391f8b72e10fae96651f75bc99))
* **java:** use stable file locations for JARs provided by mason.nvim ([#245](https://github.com/AstroNvim/astrocommunity/issues/245)) ([8b0428b](https://github.com/AstroNvim/astrocommunity/commit/8b0428b0233cca87892514505f2284c075aa4e1f))
* **markmap-nvim:** fix issues with markmap.nvim plugin ([ef8eee3](https://github.com/AstroNvim/astrocommunity/commit/ef8eee381efc25b22d46bc27d7c346a06f1e8508))
* **neovide:** noice and mini.animate is not compatible with neovide ([fe06ccf](https://github.com/AstroNvim/astrocommunity/commit/fe06ccf9057fc09e8804da0b1e1a47e3fc963eef))
* opts could be null. use astronvim.conditional_func ([7f8374b](https://github.com/AstroNvim/astrocommunity/commit/7f8374b9e6ab921e4b703c6af0e76059abc9db95))
* **pack:** java pack dependecy on mason-lspconfig ([#265](https://github.com/AstroNvim/astrocommunity/issues/265)) ([4886b2b](https://github.com/AstroNvim/astrocommunity/commit/4886b2bd4dbcbe10d65693b14dae43f7234a1318))
* **pack:** remove `selene` from Lua pack ([c819d8d](https://github.com/AstroNvim/astrocommunity/commit/c819d8ded85a799f8c566b8eb964f3ac2748de21))
* rename plugins to follow convention ([#255](https://github.com/AstroNvim/astrocommunity/issues/255)) ([70755f5](https://github.com/AstroNvim/astrocommunity/commit/70755f5068a0fd90a2dc1510a486d5e9ff3e1da5))
* **scrolling:** opts could be null. use astronvim.conditional_func ([#259](https://github.com/AstroNvim/astrocommunity/issues/259)) ([7f8374b](https://github.com/AstroNvim/astrocommunity/commit/7f8374b9e6ab921e4b703c6af0e76059abc9db95))
* true-zen mappings ([#257](https://github.com/AstroNvim/astrocommunity/issues/257)) ([c0d5984](https://github.com/AstroNvim/astrocommunity/commit/c0d5984049f9e5bc139a2ecb31d7b21d38456ed8))

## [1.11.0](https://github.com/AstroNvim/astrocommunity/compare/v1.10.0...v1.11.0) (2023-05-24)


### Features

* **colorscheme:** Add github-nvim-theme ([#209](https://github.com/AstroNvim/astrocommunity/issues/209)) ([9c37756](https://github.com/AstroNvim/astrocommunity/commit/9c37756d52bcf068b58beb499a1146d407364ba2))
* **lsp:** add `&lt;leader&gt;uH` toggle for lsp-inlayhints ([#218](https://github.com/AstroNvim/astrocommunity/issues/218)) ([dfa7e90](https://github.com/AstroNvim/astrocommunity/commit/dfa7e902e657c48bfcbaf64c90b54f738ac92d33))
* **lsp:** add lsp-inlayhints plugin ([#217](https://github.com/AstroNvim/astrocommunity/issues/217)) ([38ad977](https://github.com/AstroNvim/astrocommunity/commit/38ad9776f6dc60fdaf9902dc4bfe9ec53666a09d))
* **motion:** Add hop.nvim ([#210](https://github.com/AstroNvim/astrocommunity/issues/210)) ([22fe02f](https://github.com/AstroNvim/astrocommunity/commit/22fe02f943c6fc1225d7d215f3f20b85a15f1898))
* **motion:** Add nvim-spider ([#212](https://github.com/AstroNvim/astrocommunity/issues/212)) ([7d84203](https://github.com/AstroNvim/astrocommunity/commit/7d84203eec5d981db75fcf5b406f6dc34fb50395))
* **pack:** Add tsc to typescript pack ([#219](https://github.com/AstroNvim/astrocommunity/issues/219)) ([2ad51c8](https://github.com/AstroNvim/astrocommunity/commit/2ad51c8441b4b810a57743393fa232cfcec0d916))
* **pack:** add typescript.nvim code actions ([#215](https://github.com/AstroNvim/astrocommunity/issues/215)) ([e4915db](https://github.com/AstroNvim/astrocommunity/commit/e4915dbbe0879cb9efdf867a5915d146c711e49c))
* **utility:** transparent-nvim works with NeoTree HL Groups ([#214](https://github.com/AstroNvim/astrocommunity/issues/214)) ([a0a841a](https://github.com/AstroNvim/astrocommunity/commit/a0a841a2b44bae2087ecfb71881c931102607a82))


### Bug Fixes

* **harpoon:** mapping overrides default window switching keybind ([#203](https://github.com/AstroNvim/astrocommunity/issues/203)) ([51df9c1](https://github.com/AstroNvim/astrocommunity/commit/51df9c12fcec1f0721ecc54ebee34755b77f2e3b))
* hop.nvim mappings ([54cd2c9](https://github.com/AstroNvim/astrocommunity/commit/54cd2c9f3f383e59d434cb152cc9f1c9d51aac60))
* **motion:** hop.nvim mappings ([#220](https://github.com/AstroNvim/astrocommunity/issues/220)) ([54cd2c9](https://github.com/AstroNvim/astrocommunity/commit/54cd2c9f3f383e59d434cb152cc9f1c9d51aac60))
* **pack:** gracefully rust plugin if codelldb is not available ([#216](https://github.com/AstroNvim/astrocommunity/issues/216)) ([ae48403](https://github.com/AstroNvim/astrocommunity/commit/ae48403d88fe5b34bd5413744386bcd658abd107))

## [1.10.0](https://github.com/AstroNvim/astrocommunity/compare/v1.9.0...v1.10.0) (2023-05-14)


### Features

* added terraform pack ([54a05ae](https://github.com/AstroNvim/astrocommunity/commit/54a05aefd082a078c8ddd95b5fd138c81140b89b))
* **pack:** added terraform pack ([#200](https://github.com/AstroNvim/astrocommunity/issues/200)) ([54a05ae](https://github.com/AstroNvim/astrocommunity/commit/54a05aefd082a078c8ddd95b5fd138c81140b89b))
* **pack:** show custom tailwindcss colors in cmp menu ([#197](https://github.com/AstroNvim/astrocommunity/issues/197)) ([9b6dfb5](https://github.com/AstroNvim/astrocommunity/commit/9b6dfb508027c3e87cf4f01c35aa30012c3c9359))


### Bug Fixes

* fixed docker pack ([06fcc36](https://github.com/AstroNvim/astrocommunity/commit/06fcc36d8ed0fda03691f86edf7b898557dca64b))
* **pack:** fixed docker pack ([#195](https://github.com/AstroNvim/astrocommunity/issues/195)) ([06fcc36](https://github.com/AstroNvim/astrocommunity/commit/06fcc36d8ed0fda03691f86edf7b898557dca64b))

## [1.9.0](https://github.com/AstroNvim/astrocommunity/compare/v1.8.1...v1.9.0) (2023-05-09)


### Features

* **pack:** added docker pack ([#193](https://github.com/AstroNvim/astrocommunity/issues/193)) ([f074d56](https://github.com/AstroNvim/astrocommunity/commit/f074d564db7310d2c309086eb3cfc3e15e2d637e))

## [1.8.1](https://github.com/AstroNvim/astrocommunity/compare/v1.8.0...v1.8.1) (2023-05-07)


### Bug Fixes

* **colorscheme:** updates to nord readme ([#191](https://github.com/AstroNvim/astrocommunity/issues/191)) ([77506df](https://github.com/AstroNvim/astrocommunity/commit/77506dfe952a611bdef690c4f3e8fd5afb186e98))

## [1.8.0](https://github.com/AstroNvim/astrocommunity/compare/v1.7.0...v1.8.0) (2023-05-07)


### Features

* add transparent plugin ([#180](https://github.com/AstroNvim/astrocommunity/issues/180)) ([49e9a39](https://github.com/AstroNvim/astrocommunity/commit/49e9a3961bba079d7f413b8d5567382dd6f55392))
* **colorscheme:** add gruvbox-baby ([#181](https://github.com/AstroNvim/astrocommunity/issues/181)) ([9e8943c](https://github.com/AstroNvim/astrocommunity/commit/9e8943c7185218e1619556eab0de90e01e264046))
* **colorscheme:** add iceberg ([#185](https://github.com/AstroNvim/astrocommunity/issues/185)) ([d4e7d39](https://github.com/AstroNvim/astrocommunity/commit/d4e7d39e0e59ad81479d2b0e9410bd32c38f4d06))
* **colorscheme:** add nord ([#186](https://github.com/AstroNvim/astrocommunity/issues/186)) ([e54077b](https://github.com/AstroNvim/astrocommunity/commit/e54077be62ae3e9e69078df0bfdc28374b195d7f))
* **editing-support:** add cutlass-nvim ([#174](https://github.com/AstroNvim/astrocommunity/issues/174)) ([c39ae53](https://github.com/AstroNvim/astrocommunity/commit/c39ae5337e6da09cf9035ac610f709f8a1249573))
* **git:** add openingh ([#178](https://github.com/AstroNvim/astrocommunity/issues/178)) ([0577100](https://github.com/AstroNvim/astrocommunity/commit/057710006518383f0d58f0b5d4c139cee07a9612))
* **pack:** enable automatic install of haskell dap ([#177](https://github.com/AstroNvim/astrocommunity/issues/177)) ([af30b33](https://github.com/AstroNvim/astrocommunity/commit/af30b331e0e7f64475f32d6fd195c5db2c6c3256))
* **test:** add nvim-coverage ([#187](https://github.com/AstroNvim/astrocommunity/issues/187)) ([43099dd](https://github.com/AstroNvim/astrocommunity/commit/43099dd513fc73bde25ce6a16064d2bd6d02bf9e))

## [1.7.0](https://github.com/AstroNvim/astrocommunity/compare/v1.6.0...v1.7.0) (2023-04-30)

### Features

* add codeium ([ab06044](https://github.com/AstroNvim/astrocommunity/commit/ab06044e3b375e53927ccb9a433c32e656a6c6bf))
* Add Pylint and make it work in a virtualenv ([#142](https://github.com/AstroNvim/astrocommunity/issues/142)) ([6d92e41](https://github.com/AstroNvim/astrocommunity/commit/6d92e414ffb08ce718b48beb551f1976600fe684))
* **colorscheme:** add dracula ([#168](https://github.com/AstroNvim/astrocommunity/issues/168)) ([b7d24a7](https://github.com/AstroNvim/astrocommunity/commit/b7d24a7a5388919a605e3eeef8f1ba49811753e6))
* **colorscheme:** add monokai-pro ([#161](https://github.com/AstroNvim/astrocommunity/issues/161)) ([1f4d5b1](https://github.com/AstroNvim/astrocommunity/commit/1f4d5b1d29b307684c0436a569dbab9116bc653d))
* **colorscheme:** add poimandres ([#158](https://github.com/AstroNvim/astrocommunity/issues/158)) ([295bc14](https://github.com/AstroNvim/astrocommunity/commit/295bc1405c8867e896d23cc773bb192181ec0864))
* **completion:** add codeium ([#172](https://github.com/AstroNvim/astrocommunity/issues/172)) ([ab06044](https://github.com/AstroNvim/astrocommunity/commit/ab06044e3b375e53927ccb9a433c32e656a6c6bf))
* **completion:** added more mappings for copilot-lua-cmp ([#150](https://github.com/AstroNvim/astrocommunity/issues/150)) ([872b1e5](https://github.com/AstroNvim/astrocommunity/commit/872b1e54cd0d192469611a8eb8205b8c83995e89))
* **git:** Add octo ([#138](https://github.com/AstroNvim/astrocommunity/issues/138)) ([f60b33f](https://github.com/AstroNvim/astrocommunity/commit/f60b33f23390f4758c97fcaec10f970ec013c2e4))
* **lsp:** add inc-rename ([#154](https://github.com/AstroNvim/astrocommunity/issues/154)) ([b60bf05](https://github.com/AstroNvim/astrocommunity/commit/b60bf05deebfc3cc9299a9da6cea063149c611eb))
* **pack:** add haskell language pack ([#165](https://github.com/AstroNvim/astrocommunity/issues/165)) ([bceb4c4](https://github.com/AstroNvim/astrocommunity/commit/bceb4c498aaf7c26771b37bc75fe5f27f35fdc7d))
* **pack:** Add multiple typescript packs ([9c3fd17](https://github.com/AstroNvim/astrocommunity/commit/9c3fd179e1985e199423f1786ad7c8acb7d1f62b))
* **pack:** add vue ([#164](https://github.com/AstroNvim/astrocommunity/issues/164)) ([b983cd0](https://github.com/AstroNvim/astrocommunity/commit/b983cd0c9c26819ae50bbb576777949e1f86d6ec))
* **pack:** create multiple typescript packs ([#121](https://github.com/AstroNvim/astrocommunity/issues/121)) ([9c3fd17](https://github.com/AstroNvim/astrocommunity/commit/9c3fd179e1985e199423f1786ad7c8acb7d1f62b))


### Bug Fixes

* Don't pull in prettierd ([#159](https://github.com/AstroNvim/astrocommunity/issues/159)) ([5c534f4](https://github.com/AstroNvim/astrocommunity/commit/5c534f4e10e1c170ad7e9feab50c2061071752c1))
* **note-taking:** use new neorg v3 config options ([#156](https://github.com/AstroNvim/astrocommunity/issues/156)) ([4264d9c](https://github.com/AstroNvim/astrocommunity/commit/4264d9c6b4bb2441a1d0ca041edb14bb58ae4080))
* **nvim-ts-rainbow2:** remove hack ([#162](https://github.com/AstroNvim/astrocommunity/issues/162)) ([9fda1ed](https://github.com/AstroNvim/astrocommunity/commit/9fda1ed21a2d642344b5902fdbceb920042b28e0))
* **pack:** make codelldb point to the right path in windows ([#169](https://github.com/AstroNvim/astrocommunity/issues/169)) ([00edc05](https://github.com/AstroNvim/astrocommunity/commit/00edc0572de776fc2d6fbe871644b960131ffcb0))
* readd &lt;leader&gt;O as a prefix for octo ([#166](https://github.com/AstroNvim/astrocommunity/issues/166)) ([4151730](https://github.com/AstroNvim/astrocommunity/commit/4151730cc5ac60a2dbc0020deebc2d851110960d))

## [1.6.0](https://github.com/AstroNvim/astrocommunity/compare/v1.5.0...v1.6.0) (2023-04-18)


### Features

* add harpoon ([#140](https://github.com/AstroNvim/astrocommunity/issues/140)) ([debeefe](https://github.com/AstroNvim/astrocommunity/commit/debeefec8fd735a6f975c4270aa5b9970706894a))
* **markdown-and-latex:** Add markdown-preview ([#151](https://github.com/AstroNvim/astrocommunity/issues/151)) ([f0335fc](https://github.com/AstroNvim/astrocommunity/commit/f0335fcbf4656310bc29e4582587ddb3238d165f))
* **syntax:** add vim-cool ([#146](https://github.com/AstroNvim/astrocommunity/issues/146)) ([4d23683](https://github.com/AstroNvim/astrocommunity/commit/4d236830da515756fe6d6324ac2ad682773f78bf))
* **terminal-integration:** add vim-tmux-yank & vim-tpipeline ([#147](https://github.com/AstroNvim/astrocommunity/issues/147)) ([449598a](https://github.com/AstroNvim/astrocommunity/commit/449598ae2f81c8f33015a31b7c6aacff4256646c))


### Bug Fixes

* harpoon keys ([#152](https://github.com/AstroNvim/astrocommunity/issues/152)) ([8b2d491](https://github.com/AstroNvim/astrocommunity/commit/8b2d4915997b882ff133054063aa14d908054684))

## [1.5.0](https://github.com/AstroNvim/astrocommunity/compare/v1.4.1...v1.5.0) (2023-04-16)


### Features

* **code-runner:** Add sniprun ([#132](https://github.com/AstroNvim/astrocommunity/issues/132)) ([5d909fa](https://github.com/AstroNvim/astrocommunity/commit/5d909faf53dc1d2c144f8b443af471f77b545161))
* **editing-support:** adding more mappings for dial.nvim ([#143](https://github.com/AstroNvim/astrocommunity/issues/143)) ([8fc38d7](https://github.com/AstroNvim/astrocommunity/commit/8fc38d7a68a35eaf30717010fc2b4106c37c9af2))
* **motion:** add grapple ([#139](https://github.com/AstroNvim/astrocommunity/issues/139)) ([305058a](https://github.com/AstroNvim/astrocommunity/commit/305058a16cd360f16591a8ab66bd45c3bac17b2d))
* **pack:** add dart ([#136](https://github.com/AstroNvim/astrocommunity/issues/136)) ([45f6a45](https://github.com/AstroNvim/astrocommunity/commit/45f6a45722fbe23978c5360a231e1a777b75a011))
* **scrolling:** adding nvim-scrollbar ([#144](https://github.com/AstroNvim/astrocommunity/issues/144)) ([81d2df5](https://github.com/AstroNvim/astrocommunity/commit/81d2df5284ed247477f629f3e0a883cec12a94d5))

## [1.4.1](https://github.com/AstroNvim/astrocommunity/compare/v1.4.0...v1.4.1) (2023-04-09)


### Bug Fixes

* **ci:** stable tag name is fixed and will always exist so force push to it on releases ([#130](https://github.com/AstroNvim/astrocommunity/issues/130)) ([a6f836f](https://github.com/AstroNvim/astrocommunity/commit/a6f836f3e14c05b3ad6fdfea8bfe125de7ba465f))

## [1.4.0](https://github.com/AstroNvim/astrocommunity/compare/v1.3.0...v1.4.0) (2023-04-08)


### Features

* **completion:** improve copilot-cmp defaults  ([#129](https://github.com/AstroNvim/astrocommunity/issues/129)) ([62599e1](https://github.com/AstroNvim/astrocommunity/commit/62599e1e1cc9f508ac92e718b68b5e96099d552b))
* **editing-support:** Add text-case.nvim ([#122](https://github.com/AstroNvim/astrocommunity/issues/122)) ([78a0f36](https://github.com/AstroNvim/astrocommunity/commit/78a0f3635cb066366326d95a738b51d1cb576b1e))
* improve copilot-cmp defaults by re-enabling C-e to turn off cmp window to see hidden copilot suggestion and add C-x and C-z mappings to go to next and previous copilot suggestions ([62599e1](https://github.com/AstroNvim/astrocommunity/commit/62599e1e1cc9f508ac92e718b68b5e96099d552b))

## [1.3.0](https://github.com/AstroNvim/astrocommunity/compare/v1.2.0...v1.3.0) (2023-04-07)


### Features

* **bars-and-lines:** add bufferline plugin ([724301f](https://github.com/AstroNvim/astrocommunity/commit/724301f196cb77c70d98ba1eec75562dee22fe36))
* **bars-and-lines:** add feline plugin ([d95a2ee](https://github.com/AstroNvim/astrocommunity/commit/d95a2ee8e016bbca796aba8b4bb35d6d64c5e022))
* **bars-and-lines:** add lualine plugin ([f6e9f5d](https://github.com/AstroNvim/astrocommunity/commit/f6e9f5d7c6228c8c36f3aeed955080b0f957f259))
* **bars-and-lines:** add statuscol plugin ([c0b272d](https://github.com/AstroNvim/astrocommunity/commit/c0b272d53354ec700b431e71c225573195296c43))
* **bars-and-lines:** add statusline with mode text ([3836d18](https://github.com/AstroNvim/astrocommunity/commit/3836d188f5922e2704a61519a6a739ea6c7e0c47))
* **bars-and-lines:** add vs code style winbar recipe ([cdc12ce](https://github.com/AstroNvim/astrocommunity/commit/cdc12ce6a15e3bc4a19dfb849c559331110df24e))
* **color:** add headlines plugin ([68aebcb](https://github.com/AstroNvim/astrocommunity/commit/68aebcb0801faac07812a923b937397aea649f8b))
* **color:** add modes.nvim plugin ([92a78e4](https://github.com/AstroNvim/astrocommunity/commit/92a78e4832b0f1de0595eee82c9444c56ca04b83))
* **color:** add twilight.nvim ([#124](https://github.com/AstroNvim/astrocommunity/issues/124)) ([c118c7c](https://github.com/AstroNvim/astrocommunity/commit/c118c7cc3686e3d7d922f68d072c171dad1af34c))
* **editing-support:** add auto-save.nvim plugin ([2f40865](https://github.com/AstroNvim/astrocommunity/commit/2f40865f2bc6e2bc42fd6e0c476d20dc1f6d5f58))
* **editing-support:** add mini.splitjoin ([ed5c19a](https://github.com/AstroNvim/astrocommunity/commit/ed5c19a791547711799ba451ccbc0169c1cbce42))
* **editing-support:** add nvim-ts-rainbow ([a06a3bf](https://github.com/AstroNvim/astrocommunity/commit/a06a3bfe908165680b72b6160fbcd72b41a6d5f0))
* **editing-support:** add nvim-ts-rainbow2 ([cd37ef6](https://github.com/AstroNvim/astrocommunity/commit/cd37ef6aa2061d2c26d35daeecbc316084689a31))
* **editing-support:** add todo-comments.nvim ([93f89ce](https://github.com/AstroNvim/astrocommunity/commit/93f89ce71efead5a248dcbed215e2ad383eba5a5))
* **git:** Add git-blame ([#108](https://github.com/AstroNvim/astrocommunity/issues/108)) ([c6771c0](https://github.com/AstroNvim/astrocommunity/commit/c6771c060ae5cfe5467885db87c4fc108c7f59b9))
* **git:** add neogit ([#123](https://github.com/AstroNvim/astrocommunity/issues/123)) ([512dc00](https://github.com/AstroNvim/astrocommunity/commit/512dc00454fa900057487c6974484d34c7dc0c42))
* **indent:** add indent-tools.nvim ([23882e9](https://github.com/AstroNvim/astrocommunity/commit/23882e986ad1915f79659bbbae481e8a564d0652))
* **markdown-and-latex:** add vimtex ([#113](https://github.com/AstroNvim/astrocommunity/issues/113)) ([c968f91](https://github.com/AstroNvim/astrocommunity/commit/c968f919fa4e37e195ba29abe83b9ec272f54f2e))
* **motion:** add leap/flit.nvim plugins ([cdc2107](https://github.com/AstroNvim/astrocommunity/commit/cdc21073f5b7df7a2748ef8df327c2934e445aa5))
* **motion:** add nvim-surround ([#110](https://github.com/AstroNvim/astrocommunity/issues/110)) ([cfcf2a9](https://github.com/AstroNvim/astrocommunity/commit/cfcf2a93508794c6c6b13aebdffc416f589936b5))
* **motion:** add vim-matchup plugin ([48d0bef](https://github.com/AstroNvim/astrocommunity/commit/48d0bef225c3d2ee87662d1d0ec4236e95e7d9fd))
* **note-taking:** add obsidian-nvim ([2a04234](https://github.com/AstroNvim/astrocommunity/commit/2a0423431f5554ef920e085320da0f9713e656de))
* **pack/edgedb:** Add EdgeDB syntax plugin ([#93](https://github.com/AstroNvim/astrocommunity/issues/93)) ([f424f1b](https://github.com/AstroNvim/astrocommunity/commit/f424f1b63ffc3c127ea2498390263377fde5567d))
* **pack/java:** add Java Language Pack ([#86](https://github.com/AstroNvim/astrocommunity/issues/86)) ([f91eb2f](https://github.com/AstroNvim/astrocommunity/commit/f91eb2f3a2a9b78b1bcc8961c235e665ef06dce2))
* **pack/typescript:** handle neotree rename imports ([cd18f64](https://github.com/AstroNvim/astrocommunity/commit/cd18f64211e816ce9d0427419f08ea6b33f523f9))
* **pack:** add astro pack ([8f1abef](https://github.com/AstroNvim/astrocommunity/commit/8f1abefd3af53cf5ea823d6609843f7e05fad95e))
* **pack:** add cmake language pack ([6b9d9c0](https://github.com/AstroNvim/astrocommunity/commit/6b9d9c07556902d78360569447b8058ee90f19ce))
* **pack:** add haxe language pack ([6ff9989](https://github.com/AstroNvim/astrocommunity/commit/6ff998948a8555f10f6c2322bfabb74cb2ebcf69))
* **pack:** add php language pack ([03db218](https://github.com/AstroNvim/astrocommunity/commit/03db2181355bfea0f6956f8bfa0dcef789d559ab))
* **pack:** add prisma language pack ([#111](https://github.com/AstroNvim/astrocommunity/issues/111)) ([3c6e863](https://github.com/AstroNvim/astrocommunity/commit/3c6e86337f29bf3e604a78d4c7c87ede84bd9b96))
* **pack:** add svelte language pack ([9748fd5](https://github.com/AstroNvim/astrocommunity/commit/9748fd5cb61e1f8933047ca43a42128c8a326e14))
* **pack:** add tailwindcss pack ([659d949](https://github.com/AstroNvim/astrocommunity/commit/659d949c0d3bc9f953dbaf4ca69bd1af8fc165ad))
* **pack:** add yaml language pack ([74473d8](https://github.com/AstroNvim/astrocommunity/commit/74473d883f2070a7856cbaa382eb545090aa1d7c))
* **pack:** switch to codelldb for rust debugging ([#106](https://github.com/AstroNvim/astrocommunity/issues/106)) ([2005cf2](https://github.com/AstroNvim/astrocommunity/commit/2005cf25dd0281c4ee50f31ffc7e016c16670c48))
* **pack:** use prettierd instead of prettier ([a599091](https://github.com/AstroNvim/astrocommunity/commit/a5990917707c30afebd9ab9e52e4096177076961))
* **project:** add project.nvim ([76fc3f3](https://github.com/AstroNvim/astrocommunity/commit/76fc3f37ee94f84195a40a3a747316f862a46780))
* **scrolling:** add cinnamon.nvim plugin ([3013c7d](https://github.com/AstroNvim/astrocommunity/commit/3013c7dee862de47d24297b3ae907bc83b88e773))
* **syntax:** add hlargs.nvim ([e3a7815](https://github.com/AstroNvim/astrocommunity/commit/e3a781520c7705a759468474944dffe1730b4ee4))
* **syntax:** add vim-easy-align ([a5dde7a](https://github.com/AstroNvim/astrocommunity/commit/a5dde7a3ae716094e21ed0eee083131d0314713f))
* **syntax:** add vim-sandwich ([2e9d85f](https://github.com/AstroNvim/astrocommunity/commit/2e9d85f4ac19ced81a954b418822aa0a02706928))
* **terminal-integration:** add flatten.nvim ([e9cff3e](https://github.com/AstroNvim/astrocommunity/commit/e9cff3e77ce4f1e365ae6a9bace86244bfd1e86f))


### Bug Fixes

* **code-runner:** add missing loading commands to overseer ([#77](https://github.com/AstroNvim/astrocommunity/issues/77)) ([7443d36](https://github.com/AstroNvim/astrocommunity/commit/7443d36411a6d9e6913b9b52d4c38373d323fb88))
* **git:** gitblame ([#112](https://github.com/AstroNvim/astrocommunity/issues/112)) ([d41f4ae](https://github.com/AstroNvim/astrocommunity/commit/d41f4aefb3a8b8543df90a313bd68320ccb4640a))
* **indent:** sentence structure ([c67b24e](https://github.com/AstroNvim/astrocommunity/commit/c67b24e198f2843f2fb194a0065b1b988266c750))
* **leap:** add vim-repeat to support dot-repeat ([cf46b1f](https://github.com/AstroNvim/astrocommunity/commit/cf46b1fab79070d2a6a6ba9fdb96105d2273ee0e))
* **media:** add missing pets lazy load command ([194dfbd](https://github.com/AstroNvim/astrocommunity/commit/194dfbd5966ec30871f3198099673ae416c560fb))
* **mini-ai:** explicitly call setup() ([4795909](https://github.com/AstroNvim/astrocommunity/commit/47959094e8e085ab349698562bd305c4a90d2d5a))
* **nvim-ts-rainbow:** add autocmd to refresh on save/focus ([a303ebb](https://github.com/AstroNvim/astrocommunity/commit/a303ebbbe369911558b49c92d8038e58220467fa))
* **pack/tailwindcss:** colorize for nvim-colorizer ([0a400f8](https://github.com/AstroNvim/astrocommunity/commit/0a400f852b17bd42422b946f1e2fe1d041b9d675))
* **pack:** add auto installation to haxe pack ([8db899f](https://github.com/AstroNvim/astrocommunity/commit/8db899f238f5bb60965eee551c587e57622dce44))
* **pack:** enable tailwindcss color highlighting ([#99](https://github.com/AstroNvim/astrocommunity/issues/99)) ([8f20d09](https://github.com/AstroNvim/astrocommunity/commit/8f20d09d4eed9245b53d29f7c25f2a0f9246fddd))
* **pack:** fix go pack ([245182e](https://github.com/AstroNvim/astrocommunity/commit/245182eb60cf24531a2d5dab10dd1b0361785585))
* **pack:** improve compatibility of table.unpack function ([#107](https://github.com/AstroNvim/astrocommunity/issues/107)) ([52b1da3](https://github.com/AstroNvim/astrocommunity/commit/52b1da39fe0142ef99ff9fd6ffa0938d0c9105cf))
* **pack:** Switching python venv selector to a more robust plugin ([b1c6154](https://github.com/AstroNvim/astrocommunity/commit/b1c61548d2ff1702097b56a8cd60b01e5318b316))
* **project:** fix telescope lazy loading with project.nvim ([d971045](https://github.com/AstroNvim/astrocommunity/commit/d971045b0db6294c5890a4f38a52817b42ed0aed))
* **terminal-integration:** fix priority of loading flatten.nvim ([c1fb750](https://github.com/AstroNvim/astrocommunity/commit/c1fb7501552c69069d58bcd7e0e710b227a95357))
* **terminal-integration:** load flatten at startup ([bb600f2](https://github.com/AstroNvim/astrocommunity/commit/bb600f2cfe500cd6e541f823eda7f8206e401ef3))
* **toml:** disable taplo in null-ls ([#102](https://github.com/AstroNvim/astrocommunity/issues/102)) ([e6bfb50](https://github.com/AstroNvim/astrocommunity/commit/e6bfb5073add5113f97bbb1ca5aaf27855a5e346))
