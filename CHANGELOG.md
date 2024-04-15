# Changelog

## [8.0.0](https://github.com/AstroNvim/astrocommunity/compare/v7.0.0...v8.0.0) (2024-04-15)


### ⚠ BREAKING CHANGES

* **rest-nvim:** update to rest.nvim v2 ([#877](https://github.com/AstroNvim/astrocommunity/issues/877))
* **colorscheme:** Fix issue in package having the wrong name ([#848](https://github.com/AstroNvim/astrocommunity/issues/848))
* **yanky-nvim:** change conflicting mapping `<Leader>p` → `<Leader>fy` ([#831](https://github.com/AstroNvim/astrocommunity/issues/831))

### Features

* **blame-nvim:** add binding to toggle git blame ([#866](https://github.com/AstroNvim/astrocommunity/issues/866)) ([a69a79e](https://github.com/AstroNvim/astrocommunity/commit/a69a79ef423bacd0b4ef9ee8e2bd36ee2c112353))
* **color:** add `nvim-highlight-colors` ([f2d802f](https://github.com/AstroNvim/astrocommunity/commit/f2d802f9514e1b37f24289029451aa604075f931))
* **diagnostics:** Add error-lens.nvim ([#852](https://github.com/AstroNvim/astrocommunity/issues/852)) ([9543573](https://github.com/AstroNvim/astrocommunity/commit/95435736bb1e162545af54886b024071f844bc08))
* **editing-support:** add `mini-operators` plugin ([#857](https://github.com/AstroNvim/astrocommunity/issues/857)) ([37d6048](https://github.com/AstroNvim/astrocommunity/commit/37d6048d131d5174544d9a2daebe613fef0869a2))
* **editing-support:** add `nvim-context-vt` ([#858](https://github.com/AstroNvim/astrocommunity/issues/858)) ([bfd2058](https://github.com/AstroNvim/astrocommunity/commit/bfd2058fb6c27707b67174521b60d22c3e6d3ca6))
* **editing-support:** add `nvim-treesitter-context` ([#859](https://github.com/AstroNvim/astrocommunity/issues/859)) ([deeb4e9](https://github.com/AstroNvim/astrocommunity/commit/deeb4e9cc49d7fc895d9a4f6fe7ac4a5540d21b2))
* **editing-support:** add `undotree` ([53b9ed7](https://github.com/AstroNvim/astrocommunity/commit/53b9ed72e517c9ee7fde4c0fbcc7edc224a2dcf9))
* **editing-support:** add `undotree` plugin ([#863](https://github.com/AstroNvim/astrocommunity/issues/863)) ([53b9ed7](https://github.com/AstroNvim/astrocommunity/commit/53b9ed72e517c9ee7fde4c0fbcc7edc224a2dcf9))
* **image-nvim:** use luarocks.nvim for "magick" rock ([#835](https://github.com/AstroNvim/astrocommunity/issues/835)) ([6a58f1d](https://github.com/AstroNvim/astrocommunity/commit/6a58f1d12d6edff795c40d924058d9fa908c61f7))
* **keybinding:** add `nvcheatsheet.nvim` ([#861](https://github.com/AstroNvim/astrocommunity/issues/861)) ([4da8d06](https://github.com/AstroNvim/astrocommunity/commit/4da8d06f480190feda6e2ca531adbf6fb222954c))
* **lsp:** add `actions-preview.nvim` plugin ([#855](https://github.com/AstroNvim/astrocommunity/issues/855)) ([3f64ba3](https://github.com/AstroNvim/astrocommunity/commit/3f64ba35980eecfa65062cb67bca5bacfdc8bb97))
* **media:** add codesnap.nvim ([#828](https://github.com/AstroNvim/astrocommunity/issues/828)) ([875ebcb](https://github.com/AstroNvim/astrocommunity/commit/875ebcbaa62a3427006fa869ecc7874bef8f53e2))
* **nvim-devdocs:** bundled `js/node` docs for typescript files ([#834](https://github.com/AstroNvim/astrocommunity/issues/834)) ([ade3c18](https://github.com/AstroNvim/astrocommunity/commit/ade3c180c999ff06ea57c6a5fee9c5a90cb265cd))
* **pack:** add elixir/phoenix pack ([#821](https://github.com/AstroNvim/astrocommunity/issues/821)) ([4a80be4](https://github.com/AstroNvim/astrocommunity/commit/4a80be49b48a4d5053d744b38104c2f911543977))
* **recipes:** add `neo-tree` dark theme recipe ([#860](https://github.com/AstroNvim/astrocommunity/issues/860)) ([2c908d2](https://github.com/AstroNvim/astrocommunity/commit/2c908d2cb135fdc386c16d0a3d1b5ef6d9bc6216))
* **refactoring-nvim:** add heading binding ([#865](https://github.com/AstroNvim/astrocommunity/issues/865)) ([d87f6a1](https://github.com/AstroNvim/astrocommunity/commit/d87f6a1f17378d9e83ecfde437f5a7b22aa1c538))
* **remote-development:** add `nvim-sftp-sync` ([86a86a6](https://github.com/AstroNvim/astrocommunity/commit/86a86a6529de607b3ed2b854fb19d806fedced64))
* **startup:** add mini-starter plugin ([#836](https://github.com/AstroNvim/astrocommunity/issues/836)) ([5da6e0a](https://github.com/AstroNvim/astrocommunity/commit/5da6e0a36aa78bab0cf09e9b0b781e38c3192da1))
* **trouble-nvim:** add mappings for `todo-comments.nvim` ([#879](https://github.com/AstroNvim/astrocommunity/issues/879)) ([69cfa52](https://github.com/AstroNvim/astrocommunity/commit/69cfa525eb20c06f57c6f5b125721c495da1eda2))
* **ts-error-translator-nvim:** `astro` and `svelte` support added ([b1e5f08](https://github.com/AstroNvim/astrocommunity/commit/b1e5f08257d0f34990dc88625df888d06e230782))
* **ts-error-translator-nvim:** `svelte` and `astro` support added ([#827](https://github.com/AstroNvim/astrocommunity/issues/827)) ([b1e5f08](https://github.com/AstroNvim/astrocommunity/commit/b1e5f08257d0f34990dc88625df888d06e230782))
* **vscode-icons:** add more and update lspkind icons ([#851](https://github.com/AstroNvim/astrocommunity/issues/851)) ([dedf12e](https://github.com/AstroNvim/astrocommunity/commit/dedf12ee043076a04fd475ebdb84b4f50b5bb66c))


### Bug Fixes

* Align the blame window properly when using heirline ([eee1a14](https://github.com/AstroNvim/astrocommunity/commit/eee1a148ad1906058bb3482d7156c8b4d1049122))
* **blame-nvim:** Align the git blame window properly when using heirline ([#864](https://github.com/AstroNvim/astrocommunity/issues/864)) ([eee1a14](https://github.com/AstroNvim/astrocommunity/commit/eee1a148ad1906058bb3482d7156c8b4d1049122))
* **blame-nvim:** make sure buffer is valid before checking filetype ([c6c5991](https://github.com/AstroNvim/astrocommunity/commit/c6c5991a03d7f81a0bf24845a9e53690beaac831))
* **cloak-nvim:** Fix event ([#885](https://github.com/AstroNvim/astrocommunity/issues/885)) ([6e4d2e2](https://github.com/AstroNvim/astrocommunity/commit/6e4d2e29336cf527706d038ab6920809baec2b3e))
* **colorscheme:** Fix issue in package having the wrong name ([#848](https://github.com/AstroNvim/astrocommunity/issues/848)) ([1622ae5](https://github.com/AstroNvim/astrocommunity/commit/1622ae552c54461af4dd86e791a5310f955311ef))
* **coq_nvim:** Disable all cmp plugins ([#843](https://github.com/AstroNvim/astrocommunity/issues/843)) ([9572bea](https://github.com/AstroNvim/astrocommunity/commit/9572beac818cfe1c6d2b1395faf55b0d2206e224))
* **coq-nvim:** Disable all cmp plugins ([9572bea](https://github.com/AstroNvim/astrocommunity/commit/9572beac818cfe1c6d2b1395faf55b0d2206e224))
* **debugpy:** incorrect path for windows debugpy ([1d41ad0](https://github.com/AstroNvim/astrocommunity/commit/1d41ad0a7fc2a206e07bce1d7b25ea0b383dbd5b))
* deprecated function ([5c7db4a](https://github.com/AstroNvim/astrocommunity/commit/5c7db4a65e4fa45f91ba71b4e85286a4643803e7))
* **dial-nvim:** lazify dial-nvim, add month / weekday crementing ([#881](https://github.com/AstroNvim/astrocommunity/issues/881)) ([da97c99](https://github.com/AstroNvim/astrocommunity/commit/da97c99a6cc44b8d3e79a59f449e0951ea79364d))
* **editing-support:** make sure cloak is loaded if nvim loads a file directly ([6e4d2e2](https://github.com/AstroNvim/astrocommunity/commit/6e4d2e29336cf527706d038ab6920809baec2b3e))
* **harpoon:** deprecated function in configuration ([#870](https://github.com/AstroNvim/astrocommunity/issues/870)) ([5c7db4a](https://github.com/AstroNvim/astrocommunity/commit/5c7db4a65e4fa45f91ba71b4e85286a4643803e7))
* **lsp_lines-nvim:** change virtual_text option to astrocore ([#826](https://github.com/AstroNvim/astrocommunity/issues/826)) ([7f95c2e](https://github.com/AstroNvim/astrocommunity/commit/7f95c2e6bc03c611935c3c8c04ec21edab5e0d48))
* **markmap-nvim:** Fix issue with pack due to wrongly named null-ls package, and load on `md` file ([#886](https://github.com/AstroNvim/astrocommunity/issues/886)) ([1f6c37d](https://github.com/AstroNvim/astrocommunity/commit/1f6c37dd59f45b9d663d0a33f270cf7b8fa29663))
* **mason-tool-installer-nvim:** Update mappings function for mason-null-ls ([a692178](https://github.com/AstroNvim/astrocommunity/commit/a692178449b0441d102af44c636aaf32e301326d))
* **mason-tool-installer-nvim:** Use mappings function for null-ls names ([#841](https://github.com/AstroNvim/astrocommunity/issues/841)) ([a692178](https://github.com/AstroNvim/astrocommunity/commit/a692178449b0441d102af44c636aaf32e301326d))
* **mini-completion:** Disable all cmp plugins ([#842](https://github.com/AstroNvim/astrocommunity/issues/842)) ([4116515](https://github.com/AstroNvim/astrocommunity/commit/4116515d857405a55933dd22bb467a0428438273))
* **mini-move:** properly load `opts` when building `keys` lazy loading ([bb88a06](https://github.com/AstroNvim/astrocommunity/commit/bb88a06ed0614bdeb8cf4edb191baf190503b7d1))
* **mini-surround:** properly load `opts` when building `keys` lazy loading ([4d2ee01](https://github.com/AstroNvim/astrocommunity/commit/4d2ee01c92504507c51441cc4f5f3fdc20893789))
* **nix:** Fix wrong lsp in nix pack. ([#882](https://github.com/AstroNvim/astrocommunity/issues/882)) ([c009f66](https://github.com/AstroNvim/astrocommunity/commit/c009f665d57031fc299eff5f3138b59887f7edfa))
* **nordic-nvim:** spec accidentally used `load` rather than `setup` ([14647de](https://github.com/AstroNvim/astrocommunity/commit/14647de59010546fb116bd52f179f4956c4d9a80))
* **nvim-sftp-sync:** remove lazy loading to play nicer with `:UpdateRemotePlugins` ([53a2ce5](https://github.com/AstroNvim/astrocommunity/commit/53a2ce575edadb34e7dc993a07fd9b3e02d7bff4))
* **nvim-toggler:** fix default binding ([f2ddc4d](https://github.com/AstroNvim/astrocommunity/commit/f2ddc4d3709d11ce862ba24a5390c9e6d7d2a6c8))
* **obsidian-nvim:** Make follow_url_func a function and pass url as a param ([#871](https://github.com/AstroNvim/astrocommunity/issues/871)) ([546e9dc](https://github.com/AstroNvim/astrocommunity/commit/546e9dc88450095f2dafb2f003203d97b0e74a7a))
* **python:** incorrect path for windows debugpy ([#862](https://github.com/AstroNvim/astrocommunity/issues/862)) ([1d41ad0](https://github.com/AstroNvim/astrocommunity/commit/1d41ad0a7fc2a206e07bce1d7b25ea0b383dbd5b))
* **rest-nvim:** update to rest.nvim v2 ([#877](https://github.com/AstroNvim/astrocommunity/issues/877)) ([f1456b7](https://github.com/AstroNvim/astrocommunity/commit/f1456b70a82b3a71a7f7992564138357c81c6b3a))
* **vim-highlighter:** fix incorrect mapping format ([425fe07](https://github.com/AstroNvim/astrocommunity/commit/425fe071e796ce9872846713cbcb2ba7d05e96e8))
* **yanky-nvim:** change conflicting mapping `&lt;Leader&gt;p` → `<Leader>fy` ([8eda9d9](https://github.com/AstroNvim/astrocommunity/commit/8eda9d98e71454906f29fec65c5175f98ebfad18))
* **yanky-nvim:** change conflicting mapping `&lt;Leader&gt;p` → `<Leader>fy` ([#831](https://github.com/AstroNvim/astrocommunity/issues/831)) ([8eda9d9](https://github.com/AstroNvim/astrocommunity/commit/8eda9d98e71454906f29fec65c5175f98ebfad18))


### Performance Improvements

* **json:** lazy load SchemaStore ([d85b6e8](https://github.com/AstroNvim/astrocommunity/commit/d85b6e8cc450ff86763afe75eb2bc511f76fa058))
* **peek-nvim:** load lazy ([#867](https://github.com/AstroNvim/astrocommunity/issues/867)) ([5ebab68](https://github.com/AstroNvim/astrocommunity/commit/5ebab682af96e45d5d946524ad9c1113ed2518e1))
* set appropiate/missing lazy loading events ([#856](https://github.com/AstroNvim/astrocommunity/issues/856)) ([21d5729](https://github.com/AstroNvim/astrocommunity/commit/21d5729f730903c050cf1b2df26dc38ab04ba560))
* **yaml:** lazy load SchemaStore ([82b44a0](https://github.com/AstroNvim/astrocommunity/commit/82b44a046c3fd2eafd266f27ad2e983b1c8a4720))

## [7.0.0](https://github.com/AstroNvim/astrocommunity/compare/v6.0.1...v7.0.0) (2024-04-01)


### ⚠ BREAKING CHANGES

* **neorg:** fix breaking change in v8.0.0 ([#813](https://github.com/AstroNvim/astrocommunity/issues/813))

### Features

* **file-explorer:** Add telescope-file-browser.nvim ([#818](https://github.com/AstroNvim/astrocommunity/issues/818)) ([5de68a2](https://github.com/AstroNvim/astrocommunity/commit/5de68a202b4a44ff2c5665a5a5f80b18e21bc4d1))
* **pack:** add fish pack ([#817](https://github.com/AstroNvim/astrocommunity/issues/817)) ([b1584b9](https://github.com/AstroNvim/astrocommunity/commit/b1584b9ea0731f39950af1473c10043be0aa3fec))


### Bug Fixes

* **java:** `clang_format` renamed to `clang-format` in conform ([f87424b](https://github.com/AstroNvim/astrocommunity/commit/f87424b508a06200d667156e7cac4dffbd5c1fae))
* **neorg:** fix breaking change in v8.0.0 ([#813](https://github.com/AstroNvim/astrocommunity/issues/813)) ([34a09c9](https://github.com/AstroNvim/astrocommunity/commit/34a09c9c042c860107659ac1c322860050f8ef62))

## [6.0.1](https://github.com/AstroNvim/astrocommunity/compare/v6.0.0...v6.0.1) (2024-03-25)


### Bug Fixes

* **neorg:** restrict to version 7 ([f219659](https://github.com/AstroNvim/astrocommunity/commit/f219659b67b246584c421074d73db0a941af5cbd))

## [6.0.0](https://github.com/AstroNvim/astrocommunity/compare/v5.5.0...v6.0.0) (2024-03-19)


### ⚠ BREAKING CHANGES

* **grapple-nvim:** update to Grapple v0.10.0 ([#779](https://github.com/AstroNvim/astrocommunity/issues/779))
* **harpoon:** Update to v2 ([#741](https://github.com/AstroNvim/astrocommunity/issues/741))

### Features

* **editing-support:** Add cloak.nvim ([#761](https://github.com/AstroNvim/astrocommunity/issues/761)) ([3b88193](https://github.com/AstroNvim/astrocommunity/commit/3b881932c27a41d4623c2d71d9774a33f5fa6f91))
* **grapple-nvim:** better keymaps + add nvim-web-devicons dependency ([#781](https://github.com/AstroNvim/astrocommunity/issues/781)) ([c730a7e](https://github.com/AstroNvim/astrocommunity/commit/c730a7ee7c6fafc75d0356230b0b378ab4327733))
* **harpoon:** Update to v2 ([#741](https://github.com/AstroNvim/astrocommunity/issues/741)) ([0151343](https://github.com/AstroNvim/astrocommunity/commit/0151343be2066f14eef15a971e83b09671217d00))
* **pack:** add Templ language pack ([#780](https://github.com/AstroNvim/astrocommunity/issues/780)) ([bbd7f7f](https://github.com/AstroNvim/astrocommunity/commit/bbd7f7f1291ee6b9f91ca2cf2b22a92a30f18ad9))


### Bug Fixes

* **bash:** fix duplicate diagnostics in bash pack ([#804](https://github.com/AstroNvim/astrocommunity/issues/804)) ([570a524](https://github.com/AstroNvim/astrocommunity/commit/570a52451880a336a1aff366a8cc970b2dd2dcdc))
* **grapple-nvim:** better keymaps + add nvim-web-devicons as a lazy dependency ([c730a7e](https://github.com/AstroNvim/astrocommunity/commit/c730a7ee7c6fafc75d0356230b0b378ab4327733))
* **grapple-nvim:** update to Grapple v0.10.0 ([#779](https://github.com/AstroNvim/astrocommunity/issues/779)) ([30e8aae](https://github.com/AstroNvim/astrocommunity/commit/30e8aae3a71213179c6330df6a6300f00915b79c))
* **grapple:** update after rewrite ([30e8aae](https://github.com/AstroNvim/astrocommunity/commit/30e8aae3a71213179c6330df6a6300f00915b79c))
* **markdown-preview-nvim:** yarn istead of npm ([#770](https://github.com/AstroNvim/astrocommunity/issues/770)) ([f6a07ff](https://github.com/AstroNvim/astrocommunity/commit/f6a07ff850a8ddc5fb327132c07d43106a850e1f))
* **pack:** fix duplicate diagnostics in bash pack ([570a524](https://github.com/AstroNvim/astrocommunity/commit/570a52451880a336a1aff366a8cc970b2dd2dcdc))

## [5.5.0](https://github.com/AstroNvim/astrocommunity/compare/v5.4.0...v5.5.0) (2024-02-07)


### Features

* **angular:** Migrate to built-in treesitter ([#743](https://github.com/AstroNvim/astrocommunity/issues/743)) ([8157924](https://github.com/AstroNvim/astrocommunity/commit/8157924d02308c24754fb4f71e165700f989043f))
* **debugging:** Add nvim-chainsaw ([#739](https://github.com/AstroNvim/astrocommunity/issues/739)) ([c393c18](https://github.com/AstroNvim/astrocommunity/commit/c393c18899d8070866b610010971668014152e7b))
* **lsp:** Add lsp-lens.nvim ([#750](https://github.com/AstroNvim/astrocommunity/issues/750)) ([340fdd3](https://github.com/AstroNvim/astrocommunity/commit/340fdd3645d946d50b5a301e4edad8b99a18b6ba))
* **media:** add image.nvim ([#742](https://github.com/AstroNvim/astrocommunity/issues/742)) ([6398af8](https://github.com/AstroNvim/astrocommunity/commit/6398af89a30e7542be73dd22368859307bad1a80))
* **pack:** add Pkl language support ([#749](https://github.com/AstroNvim/astrocommunity/issues/749)) ([402ded4](https://github.com/AstroNvim/astrocommunity/commit/402ded4f183bd99b89c9ae6a12c7bbf81c7cb72a))


### Bug Fixes

* **angular:** use built-in treesitter ([8157924](https://github.com/AstroNvim/astrocommunity/commit/8157924d02308c24754fb4f71e165700f989043f))
* **diffview-nvim:** use diffview winbar and disable view activation ([#752](https://github.com/AstroNvim/astrocommunity/issues/752)) ([a953b0d](https://github.com/AstroNvim/astrocommunity/commit/a953b0d1749b0bd0079003bcfb20129047924e58))

## [5.4.0](https://github.com/AstroNvim/astrocommunity/compare/v5.3.0...v5.4.0) (2024-01-28)


### Features

* **motion:** add tabout.nvim ([#722](https://github.com/AstroNvim/astrocommunity/issues/722)) ([51d1c0c](https://github.com/AstroNvim/astrocommunity/commit/51d1c0cd0ef66fdf86dc8a1728879ba3ad94ce03))
* **nix:** replace rnix with nil_ls ([#737](https://github.com/AstroNvim/astrocommunity/issues/737)) ([ab14eab](https://github.com/AstroNvim/astrocommunity/commit/ab14eab0f0b163e2aba7e13b2349acd929683d27))
* **openingh-nvim:** added mappings to copy url ([#733](https://github.com/AstroNvim/astrocommunity/issues/733)) ([149ab9c](https://github.com/AstroNvim/astrocommunity/commit/149ab9c83764f41bbd9642fcfdb4dd9a95edda9d))


### Bug Fixes

* **harpoon:** change word terminal to term ([#725](https://github.com/AstroNvim/astrocommunity/issues/725)) ([7351bf0](https://github.com/AstroNvim/astrocommunity/commit/7351bf05c8cd68029ceb61988c8c17ccfa724dcc))
* **nvim-coverage:** Call nvim-coverage's setup ([#726](https://github.com/AstroNvim/astrocommunity/issues/726)) ([2a9f741](https://github.com/AstroNvim/astrocommunity/commit/2a9f7410513c94120dad8c63c4311419481dbc39))
* **nvim-coverage:** updated old keyword ([#723](https://github.com/AstroNvim/astrocommunity/issues/723)) ([3304429](https://github.com/AstroNvim/astrocommunity/commit/330442988044e87c6d540eb2be6ebd5cd0f46af6))

## [5.3.0](https://github.com/AstroNvim/astrocommunity/compare/v5.2.0...v5.3.0) (2024-01-12)


### Features

* **docker:** Add filetype handling to pack to make lsp attach ([8e964d3](https://github.com/AstroNvim/astrocommunity/commit/8e964d3936a5a4225c0cf8b6d0b207dffab8f160))
* **docker:** Handle docker-compose.yaml filetype to make lsp attach ([#715](https://github.com/AstroNvim/astrocommunity/issues/715)) ([8e964d3](https://github.com/AstroNvim/astrocommunity/commit/8e964d3936a5a4225c0cf8b6d0b207dffab8f160))
* **main:** Add type hints to all opts usage for catppuccin/nvim. Catch bug in opts usage for catppuccin ([#695](https://github.com/AstroNvim/astrocommunity/issues/695)) ([3c0d274](https://github.com/AstroNvim/astrocommunity/commit/3c0d2748552a8e711cb5153ab479341a84ff10aa))


### Bug Fixes

* **dial-nvim:** remove expr = true from mappings and return from functions ([#710](https://github.com/AstroNvim/astrocommunity/issues/710)) ([58c28a7](https://github.com/AstroNvim/astrocommunity/commit/58c28a716cf4f1725f29504bba6b91f8748f8710))
* **rainbow-delimiters-nvim:** event loading ([#707](https://github.com/AstroNvim/astrocommunity/issues/707)) ([074c182](https://github.com/AstroNvim/astrocommunity/commit/074c182181a1197ba183907869d26cb838f90593))
* **typescript:** don't overwrite neo-tree events ([#717](https://github.com/AstroNvim/astrocommunity/issues/717)) ([02d2f98](https://github.com/AstroNvim/astrocommunity/commit/02d2f98fc25d4229f21e3e87b157b6895f65f0e4))

## [5.2.0](https://github.com/AstroNvim/astrocommunity/compare/v5.1.0...v5.2.0) (2024-01-03)


### Features

* **dial-nvim:** Migrate to new mapping api, and add g&lt;C-x&gt; g<C-a> mappings ([#700](https://github.com/AstroNvim/astrocommunity/issues/700)) ([5ae9eed](https://github.com/AstroNvim/astrocommunity/commit/5ae9eed83715c9501f1763c81e1091bc5473b12e))
* **lsp:** add `nvim-lsp-file-operations` plugin ([#691](https://github.com/AstroNvim/astrocommunity/issues/691)) ([0b5b857](https://github.com/AstroNvim/astrocommunity/commit/0b5b857ba75b11e37afc0ffb219e3d396d2f9310))
* **pack:** Add crystal pack ([#690](https://github.com/AstroNvim/astrocommunity/issues/690)) ([5812210](https://github.com/AstroNvim/astrocommunity/commit/5812210216c1d534e731bac99dc76ea4158d722d))
* **pack:** Add nim pack ([#699](https://github.com/AstroNvim/astrocommunity/issues/699)) ([6b8aef2](https://github.com/AstroNvim/astrocommunity/commit/6b8aef261a4821987b764ad5a866e1b80dddaf1d))
* **pack:** crystal pack ([5812210](https://github.com/AstroNvim/astrocommunity/commit/5812210216c1d534e731bac99dc76ea4158d722d))
* **pack:** gleam pack ([#689](https://github.com/AstroNvim/astrocommunity/issues/689)) ([85781f4](https://github.com/AstroNvim/astrocommunity/commit/85781f40a5c796292fd75acec83f4ed520177264))


### Bug Fixes

* **helm:** Swap to correct branch ([#704](https://github.com/AstroNvim/astrocommunity/issues/704)) ([d2c7ee3](https://github.com/AstroNvim/astrocommunity/commit/d2c7ee3340b93805423221858037909692d2bd66))
* **just:** Fix buggy just pack ([#696](https://github.com/AstroNvim/astrocommunity/issues/696)) ([008194e](https://github.com/AstroNvim/astrocommunity/commit/008194e0876ca67d084195024695730585bc170f))
* **pack:** fix incorrect import ([bb32d33](https://github.com/AstroNvim/astrocommunity/commit/bb32d336984e42e96152a44f6b1aa6f36faee71d))
* **todo-comments-nvim:** Lazy load todo-comments on command ([#694](https://github.com/AstroNvim/astrocommunity/issues/694)) ([2744133](https://github.com/AstroNvim/astrocommunity/commit/27441337cda35a68f3fc89e6da47bc121c08b5a6))


### Performance Improvements

* **python:** Lazy load venv-selector on command ([#686](https://github.com/AstroNvim/astrocommunity/issues/686)) ([31c22b5](https://github.com/AstroNvim/astrocommunity/commit/31c22b5a34cbb02cd0dd7420b233c759214f0ea0))

## [5.1.0](https://github.com/AstroNvim/astrocommunity/compare/v5.0.0...v5.1.0) (2023-12-15)


### Features

* add thrift ([2ffcf86](https://github.com/AstroNvim/astrocommunity/commit/2ffcf86eb0577e2e2874deac9f90f4742b7dd7c1))
* **cpp:** Remove clang-format due to clang-format also providing formatting ([aeff33f](https://github.com/AstroNvim/astrocommunity/commit/aeff33fabe92e65389801ce4d9cc72d8736eeaf2))
* **cpp:** Remove clang-format due to clangd also providing formatting ([#619](https://github.com/AstroNvim/astrocommunity/issues/619)) ([aeff33f](https://github.com/AstroNvim/astrocommunity/commit/aeff33fabe92e65389801ce4d9cc72d8736eeaf2))
* **editing-support:** add stickybuf.nvim ([#616](https://github.com/AstroNvim/astrocommunity/issues/616)) ([bfd28ec](https://github.com/AstroNvim/astrocommunity/commit/bfd28ec6359614ff453c1a1ad322e8466d024bb5))
* **editing-support:** add wildfire.nvim ([#640](https://github.com/AstroNvim/astrocommunity/issues/640)) ([ea765aa](https://github.com/AstroNvim/astrocommunity/commit/ea765aa5393daaff499fffe86ef886db81bc4866))
* **git:** Add gist-nvim ([#668](https://github.com/AstroNvim/astrocommunity/issues/668)) ([6633200](https://github.com/AstroNvim/astrocommunity/commit/66332001ee3cbbf28338eaefab4eef606eba7921))
* **git:** Add gitlinker-nvim ([#667](https://github.com/AstroNvim/astrocommunity/issues/667)) ([def419e](https://github.com/AstroNvim/astrocommunity/commit/def419ed594ed5e3fdcde6ab171640d374d30d57))
* **haskell:** add neotest-haskell, haskell-snippets, and optional telescope-hoogle to pack ([1df076d](https://github.com/AstroNvim/astrocommunity/commit/1df076d11d1c610caf901e780035953ee17864df))
* **haskell:** add neotest-haskell, haskell-snippets, telescope-hoogle to pack ([#658](https://github.com/AstroNvim/astrocommunity/issues/658)) ([1df076d](https://github.com/AstroNvim/astrocommunity/commit/1df076d11d1c610caf901e780035953ee17864df))
* **lsp:** Add garbage-day.nvim ([#632](https://github.com/AstroNvim/astrocommunity/issues/632)) ([86cd4fc](https://github.com/AstroNvim/astrocommunity/commit/86cd4fcaa02f438026661ef2760811db6f1848ed))
* **note-taking:** add support for zettelkasten with zk-nvim ([#654](https://github.com/AstroNvim/astrocommunity/issues/654)) ([22b24e7](https://github.com/AstroNvim/astrocommunity/commit/22b24e79d18559fa84392c56115cd078553264b8))
* **pack:** add elm language pack ([#653](https://github.com/AstroNvim/astrocommunity/issues/653)) ([2f04d6e](https://github.com/AstroNvim/astrocommunity/commit/2f04d6e472f78718ba1cbcf5e1c24b4d95c6fcd3))
* **pack:** Add pack for justfiles ([#680](https://github.com/AstroNvim/astrocommunity/issues/680)) ([bdd2f6d](https://github.com/AstroNvim/astrocommunity/commit/bdd2f6d6b70822f55218c0d8eae887e8e55b776b))
* **pack:** Add swift pack ([#606](https://github.com/AstroNvim/astrocommunity/issues/606)) ([0ac1d37](https://github.com/AstroNvim/astrocommunity/commit/0ac1d3770506b9b7f7c5d420eed5f69cd1c8b5a5))
* **pack:** add thrift pack ([#620](https://github.com/AstroNvim/astrocommunity/issues/620)) ([2ffcf86](https://github.com/AstroNvim/astrocommunity/commit/2ffcf86eb0577e2e2874deac9f90f4742b7dd7c1))
* **pack:** Add typst pack ([#684](https://github.com/AstroNvim/astrocommunity/issues/684)) ([43f5a02](https://github.com/AstroNvim/astrocommunity/commit/43f5a02ae1bafb4ce02edd326a4f5430f61f66aa))
* **programming-language-support:** Add xbase ([#671](https://github.com/AstroNvim/astrocommunity/issues/671)) ([e5ddf96](https://github.com/AstroNvim/astrocommunity/commit/e5ddf96d829bf5d9e35c86b02262b632ef725cd3))
* **split-and-window:** Add mini-map ([454a613](https://github.com/AstroNvim/astrocommunity/commit/454a613108c73b4a3dbf3ab663921aa707d1c18e))
* **split-and-window:** Add mini-map ([#665](https://github.com/AstroNvim/astrocommunity/issues/665)) ([454a613](https://github.com/AstroNvim/astrocommunity/commit/454a613108c73b4a3dbf3ab663921aa707d1c18e))
* **swift:** mv to swift only support (no xcode tooling here) ([#670](https://github.com/AstroNvim/astrocommunity/issues/670)) ([cfe5e3f](https://github.com/AstroNvim/astrocommunity/commit/cfe5e3fd55e17b76e79a8538183f9b26083edc0c))
* **typescript:** Add .mjs files to Prettier detection helper func ([#618](https://github.com/AstroNvim/astrocommunity/issues/618)) ([64b3c17](https://github.com/AstroNvim/astrocommunity/commit/64b3c1739ecba18d871635ef7901fe4ed5e4edc8))
* **typescript:** Add jsdoc syntax highlighting to pack ([#646](https://github.com/AstroNvim/astrocommunity/issues/646)) ([3990190](https://github.com/AstroNvim/astrocommunity/commit/3990190b9f0e27f0bc029397627bd3a592e14dc0))
* **typescript:** Add jsdoc treesitter ensured_installed table ([3990190](https://github.com/AstroNvim/astrocommunity/commit/3990190b9f0e27f0bc029397627bd3a592e14dc0))
* **typescript:** Move eslint-lsp to the proper plugin, and add autocmd to format on save ([#683](https://github.com/AstroNvim/astrocommunity/issues/683)) ([dffd674](https://github.com/AstroNvim/astrocommunity/commit/dffd6748844c39c38364a106d759cffd6b0908f3))


### Bug Fixes

* **cmp-cmdline:** Improve cmp-cmdline plugin spec ([#660](https://github.com/AstroNvim/astrocommunity/issues/660)) ([979a830](https://github.com/AstroNvim/astrocommunity/commit/979a830954a904f7f064bdcc49fba4ec4f50902b))
* **editing-support:** replace auto-save.nvim's url with its original repo ([#673](https://github.com/AstroNvim/astrocommunity/issues/673)) ([3c7cbc7](https://github.com/AstroNvim/astrocommunity/commit/3c7cbc790646cd5f83b75e3130f96b868a61bf1f))
* **helm:** Fix helm pack misconfiguration ([#624](https://github.com/AstroNvim/astrocommunity/issues/624)) ([2601abe](https://github.com/AstroNvim/astrocommunity/commit/2601abe8dcc05f23c92e31fbc6f2ec4063175843))
* **hop-nvim:** Change from `phaazon/hop.nvim` to `smoka7/hop.nvim` ([2dca32c](https://github.com/AstroNvim/astrocommunity/commit/2dca32c81f7ff3c262541425bfdaa05eb60a7d7e))
* **hop-nvim:** Change remote to maintained fork ([#644](https://github.com/AstroNvim/astrocommunity/issues/644)) ([2dca32c](https://github.com/AstroNvim/astrocommunity/commit/2dca32c81f7ff3c262541425bfdaa05eb60a7d7e))
* **noice-nvim:** Remove conditional, enabling noice on neovide ([#623](https://github.com/AstroNvim/astrocommunity/issues/623)) ([c7e809e](https://github.com/AstroNvim/astrocommunity/commit/c7e809ecdb0f6b24ae321795bd1e98942f22dbbf))
* **octo-nvim:** adjusted whichkey description mapping ([#645](https://github.com/AstroNvim/astrocommunity/issues/645)) ([164c035](https://github.com/AstroNvim/astrocommunity/commit/164c035810101339f9e6d3419c002d1fdf76a346))
* **oil-nvim:** ssh support ([#614](https://github.com/AstroNvim/astrocommunity/issues/614)) ([d4a5520](https://github.com/AstroNvim/astrocommunity/commit/d4a55203ea818ec8fb31cd3fad6030bd8c67c969))
* **pack-swift:** fix LSP handler error ([617bc28](https://github.com/AstroNvim/astrocommunity/commit/617bc280561af618e5bfa8e86ee85f0594b3e807))
* **peek-nvim:** Swap peek.nvim branch to point to origin instead of fork ([#637](https://github.com/AstroNvim/astrocommunity/issues/637)) ([6fb9aaf](https://github.com/AstroNvim/astrocommunity/commit/6fb9aafecfdcd0cffab62570367819228044a6eb))
* **swift:** fix LSP handler error ([#655](https://github.com/AstroNvim/astrocommunity/issues/655)) ([617bc28](https://github.com/AstroNvim/astrocommunity/commit/617bc280561af618e5bfa8e86ee85f0594b3e807))
* **transparent-nvim:** Made cursor line transparent ([#611](https://github.com/AstroNvim/astrocommunity/issues/611)) ([cae8e92](https://github.com/AstroNvim/astrocommunity/commit/cae8e92e7fd3b074bce8492a6f75a59534768d23))
* **ultimate-autopair-nvim:** Fix & update ultimate-auto-pair to v0.6 config ([8ea7c89](https://github.com/AstroNvim/astrocommunity/commit/8ea7c89918dee3236c99d9ee880d0144df245d82))
* **ultimate-autopair-nvim:** Fix breaking changes in config, and pin plugin version to 0.6 ([#638](https://github.com/AstroNvim/astrocommunity/issues/638)) ([8ea7c89](https://github.com/AstroNvim/astrocommunity/commit/8ea7c89918dee3236c99d9ee880d0144df245d82))
* **xbase:** Remove lsp logic from xbase, instead pointing to swift pack ([7508715](https://github.com/AstroNvim/astrocommunity/commit/750871529e4407424cd87d56657ff5d9699242a4))
* **xbase:** Remove lsp, and treesitter logic from xbase, instead pointing to swift pack ([#679](https://github.com/AstroNvim/astrocommunity/issues/679)) ([7508715](https://github.com/AstroNvim/astrocommunity/commit/750871529e4407424cd87d56657ff5d9699242a4))

## [5.0.0](https://github.com/AstroNvim/astrocommunity/compare/v4.1.0...v5.0.0) (2023-10-17)


### ⚠ BREAKING CHANGES

* **pack:** Split python pack into python and python-ruff ([#603](https://github.com/AstroNvim/astrocommunity/issues/603))
* **transparent-nvim:** Move transparent-nvim to right folder.
* **transparent-nvim:** moved to the `color` category ([#568](https://github.com/AstroNvim/astrocommunity/issues/568))

### Features

* **colorscheme:** add nordic ([23dc5e5](https://github.com/AstroNvim/astrocommunity/commit/23dc5e52af855782d7e02a595bba13ea41936a99))
* **colorscheme:** Add nordic.nvim ([#595](https://github.com/AstroNvim/astrocommunity/issues/595)) ([23dc5e5](https://github.com/AstroNvim/astrocommunity/commit/23dc5e52af855782d7e02a595bba13ea41936a99))
* **pack:** java. enable niceities with jdtls and downloading source … ([#524](https://github.com/AstroNvim/astrocommunity/issues/524)) ([8284d88](https://github.com/AstroNvim/astrocommunity/commit/8284d88f397a59a6412c91f001b3dea5b79cdf64))
* **pack:** java. enable niceities with jdtls and downloading source code from libraries ([8284d88](https://github.com/AstroNvim/astrocommunity/commit/8284d88f397a59a6412c91f001b3dea5b79cdf64))
* **pack:** Split python pack into python and python-ruff ([#603](https://github.com/AstroNvim/astrocommunity/issues/603)) ([e0615a4](https://github.com/AstroNvim/astrocommunity/commit/e0615a43b05237deb13cad1029b6be66a1611272))
* **pack:** update Zig url ([#564](https://github.com/AstroNvim/astrocommunity/issues/564)) ([877c949](https://github.com/AstroNvim/astrocommunity/commit/877c9490a6ba0d433ec7b5f28601a6a1ead27bcf))
* **typescript:** Swap out eslint_d with eslint-lsp ([#600](https://github.com/AstroNvim/astrocommunity/issues/600)) ([54a0988](https://github.com/AstroNvim/astrocommunity/commit/54a0988e619e41099c5243fd4e9df672db575522))


### Bug Fixes

* fix [#596](https://github.com/AstroNvim/astrocommunity/issues/596); Fix indent-blankline configuration to match the new plugin requirements ([7bd974c](https://github.com/AstroNvim/astrocommunity/commit/7bd974c38ba7197201ba9bafdaafc4c318ad7a06))
* **hardtime-nvim:** call enable() explicitly, remove redundant keys ([#589](https://github.com/AstroNvim/astrocommunity/issues/589)) ([d79add3](https://github.com/AstroNvim/astrocommunity/commit/d79add350bddcae4fea04a5c0ace8d619037cf98))
* **haskell:** make haskell-tools respect the `options` table ([#571](https://github.com/AstroNvim/astrocommunity/issues/571)) ([c53ccf1](https://github.com/AstroNvim/astrocommunity/commit/c53ccf10db5af699bab44269e0f6b5be41be60b2))
* **haskell:** remove now redundant `discover_configurations` call ([#570](https://github.com/AstroNvim/astrocommunity/issues/570)) ([59df499](https://github.com/AstroNvim/astrocommunity/commit/59df499a5730504d1cad22073d9cd4a06ca03e0f))
* **indent-blankline-nvim:** Fix indent-blankline-nvim configuration to match the new plugin requirements ([#597](https://github.com/AstroNvim/astrocommunity/issues/597)) ([7bd974c](https://github.com/AstroNvim/astrocommunity/commit/7bd974c38ba7197201ba9bafdaafc4c318ad7a06))
* **mini-indentscope:** correctly disable indentscope in buftypes and terminals ([#566](https://github.com/AstroNvim/astrocommunity/issues/566)) ([c292208](https://github.com/AstroNvim/astrocommunity/commit/c292208c30b54b359f3c33dd2e80b292013e975d))
* **neosolarized-nvim:** Add missing dependencies ([#580](https://github.com/AstroNvim/astrocommunity/issues/580)) ([fdab800](https://github.com/AstroNvim/astrocommunity/commit/fdab8006f2343b717b0b22b2094740e8b1d89409))
* **peek-nvim:** Swap remote of peek-nvim to fork ([#602](https://github.com/AstroNvim/astrocommunity/issues/602)) ([a63d983](https://github.com/AstroNvim/astrocommunity/commit/a63d98367a1d057c8632572350f977cd6f05d7fc))
* **project:** initialize projectmgr-nvim ([fc631bf](https://github.com/AstroNvim/astrocommunity/commit/fc631bfa8b26ab0b33200dde54c570d766949a1f))
* **projectmgr-nvim:** disable lazy loading ([#605](https://github.com/AstroNvim/astrocommunity/issues/605)) ([fc631bf](https://github.com/AstroNvim/astrocommunity/commit/fc631bfa8b26ab0b33200dde54c570d766949a1f))
* **rainbow-delimiters-nvim:** fix setup function due to breaking change  ([#610](https://github.com/AstroNvim/astrocommunity/issues/610)) ([5c3ce63](https://github.com/AstroNvim/astrocommunity/commit/5c3ce63f9bc2c286c0e12922972ea1e1ef06f294))
* **smartcolumn-nvim:** Add sensible default opts for when not to show colorcolumn ([#607](https://github.com/AstroNvim/astrocommunity/issues/607)) ([c624e8a](https://github.com/AstroNvim/astrocommunity/commit/c624e8aaee288d80a073bc3c50744551300bde2a))
* **transparent-nvim:** Move transparent-nvim to right folder. ([6f1a4b5](https://github.com/AstroNvim/astrocommunity/commit/6f1a4b5dc2eea3c831d738154b24f7f52902432f))
* **transparent-nvim:** moved to the `color` category ([#568](https://github.com/AstroNvim/astrocommunity/issues/568)) ([6f1a4b5](https://github.com/AstroNvim/astrocommunity/commit/6f1a4b5dc2eea3c831d738154b24f7f52902432f))
* **typescript:** Check for deprecated .eslintrc file ([#599](https://github.com/AstroNvim/astrocommunity/issues/599)) ([db19103](https://github.com/AstroNvim/astrocommunity/commit/db1910360893b00f70ec9af26def6796f8c033cd))
* **vim-matchup:** remove matchup_match_paren_deferred option ([#561](https://github.com/AstroNvim/astrocommunity/issues/561)) ([751812a](https://github.com/AstroNvim/astrocommunity/commit/751812af94ccc9e6279a6d73da7a7a32b785f79e))

## [4.1.0](https://github.com/AstroNvim/astrocommunity/compare/v4.0.0...v4.1.0) (2023-09-06)


### Features

* **pack:** Add zig pack ([#557](https://github.com/AstroNvim/astrocommunity/issues/557)) ([086f3c7](https://github.com/AstroNvim/astrocommunity/commit/086f3c78be03b58416fbd1248dcdc70f3d4c67d1))


### Bug Fixes

* **hardtime-nvim:** disable hardtime-nvim on dressing-nvim fts ([#549](https://github.com/AstroNvim/astrocommunity/issues/549)) ([177f8f4](https://github.com/AstroNvim/astrocommunity/commit/177f8f4dd0cf8e0e00c52f651e88dc5b7dcde63c))
* **haskell:** Update `haskell-tools.nvim` to v2.0.0 ([#553](https://github.com/AstroNvim/astrocommunity/issues/553)) ([ffca0d7](https://github.com/AstroNvim/astrocommunity/commit/ffca0d776490966321193cd8796aa15c715a9a71))
* **python:** Adds Imports Sorting with isort to the Python Pack ([#551](https://github.com/AstroNvim/astrocommunity/issues/551)) ([2fe93b3](https://github.com/AstroNvim/astrocommunity/commit/2fe93b36b552a391f49fb283eafa7bf415e73a49))
* **yanky-nvim:** Fix yanky.nvim loading when restoring session ([#555](https://github.com/AstroNvim/astrocommunity/issues/555)) ([e35186e](https://github.com/AstroNvim/astrocommunity/commit/e35186e965770c614f38582c55bb70fe3e7070d4))
* **zen-mode-nvim:** disable global winbar upon entering zen mode ([#554](https://github.com/AstroNvim/astrocommunity/issues/554)) ([bb52899](https://github.com/AstroNvim/astrocommunity/commit/bb528993675119e4392acd1aea2b1691d5791005))

## [4.0.0](https://github.com/AstroNvim/astrocommunity/compare/v3.6.0...v4.0.0) (2023-08-30)


### ⚠ BREAKING CHANGES

* **colorscheme:** removed onigiri-nvim colorscheme due to deletion ([#536](https://github.com/AstroNvim/astrocommunity/issues/536))

### Features

* **colorscheme:** removed onigiri-nvim colorscheme due to deletion ([#536](https://github.com/AstroNvim/astrocommunity/issues/536)) ([6ad36ac](https://github.com/AstroNvim/astrocommunity/commit/6ad36ac322052135f167a6041e26f5afb6ab8feb))
* **editing-support:** added nvim-devdocs plugin ([#547](https://github.com/AstroNvim/astrocommunity/issues/547)) ([f9ef240](https://github.com/AstroNvim/astrocommunity/commit/f9ef240cbb6228004bcbff6d0d5e6813ed9ee7ac))
* **pack:** Add cue language pack ([#531](https://github.com/AstroNvim/astrocommunity/issues/531)) ([17feb7e](https://github.com/AstroNvim/astrocommunity/commit/17feb7e105b2167eca9cc8b2c5657aa4b1ee021c))


### Bug Fixes

* **dropbar-nvim:** all lines move down during startup ([d7c7868](https://github.com/AstroNvim/astrocommunity/commit/d7c786858e8bd4a1dd9f372ea752c7b75c5ad675))
* **dropbar-nvim:** Fix visual flicking bug caused by loading event trigger ([#539](https://github.com/AstroNvim/astrocommunity/issues/539)) ([d7c7868](https://github.com/AstroNvim/astrocommunity/commit/d7c786858e8bd4a1dd9f372ea752c7b75c5ad675))
* **hardtime-nvim:** disable hardtime-nvim on neo-tree-popup ([#533](https://github.com/AstroNvim/astrocommunity/issues/533)) ([a1206a4](https://github.com/AstroNvim/astrocommunity/commit/a1206a443631de4b1fea6542d7e64f72a7e57742))
* **mini-indentscope:** exclude special buftypes ([#546](https://github.com/AstroNvim/astrocommunity/issues/546)) ([f4e981a](https://github.com/AstroNvim/astrocommunity/commit/f4e981a1987e54072ad440bb36ce5807251d57ad))
* **mini-indentscope:** ignore more filetypes ([#538](https://github.com/AstroNvim/astrocommunity/issues/538)) ([10c95c8](https://github.com/AstroNvim/astrocommunity/commit/10c95c8c85596d4a5289a51f68f9f077eb26d586))
* **obsidian-nvim:** remove annoying notification about "gf" mapping ([#541](https://github.com/AstroNvim/astrocommunity/issues/541)) ([e50eef7](https://github.com/AstroNvim/astrocommunity/commit/e50eef77b07980478183a5a853c947ddd0c30a43))


### Performance Improvements

* **cmp-cmdline:** lazy load ([#535](https://github.com/AstroNvim/astrocommunity/issues/535)) ([f073e0f](https://github.com/AstroNvim/astrocommunity/commit/f073e0f7cc102446164abf86b8318fffea5247a5))

## [3.6.0](https://github.com/AstroNvim/astrocommunity/compare/v3.5.0...v3.6.0) (2023-08-22)


### Features

* **git:** add blame.nvim ([#528](https://github.com/AstroNvim/astrocommunity/issues/528)) ([9b0e09c](https://github.com/AstroNvim/astrocommunity/commit/9b0e09c9ca5d1f86e5f3b15b59477e68a1e18445))


### Bug Fixes

* **bufferline-nvim:** fix neo-tree offset ([#526](https://github.com/AstroNvim/astrocommunity/issues/526)) ([0a1a77c](https://github.com/AstroNvim/astrocommunity/commit/0a1a77c45129c14de79d75fa81e8a1bcb955790d))
* **noice-nvim:** detect inc_rename and enable ([#519](https://github.com/AstroNvim/astrocommunity/issues/519)) ([4b951a3](https://github.com/AstroNvim/astrocommunity/commit/4b951a3a67c29d23193697ce84d9cc0b5f4f0649))
* **openingh-nvim:** more precise lazy loading with "cmd" and "keys" ([#527](https://github.com/AstroNvim/astrocommunity/issues/527)) ([4225f20](https://github.com/AstroNvim/astrocommunity/commit/4225f2049bdc561da7dc4dda3fded694e9afea5c))
* **refactoring-nvim:** lazy load on `Refactor` cmd ([#525](https://github.com/AstroNvim/astrocommunity/issues/525)) ([89fe0d7](https://github.com/AstroNvim/astrocommunity/commit/89fe0d7919098cbecd1878edadc9baa80cbd7797))
* **typescript:** Requires should be dependencies ([#523](https://github.com/AstroNvim/astrocommunity/issues/523)) ([e7c99c6](https://github.com/AstroNvim/astrocommunity/commit/e7c99c656526f91263d86fa6028c71c59be85b22))

## [3.5.0](https://github.com/AstroNvim/astrocommunity/compare/v3.4.0...v3.5.0) (2023-08-10)


### Features

* **cpp:** only load `clangd_extensions` when `clangd` attaches ([#516](https://github.com/AstroNvim/astrocommunity/issues/516)) ([ba3ea51](https://github.com/AstroNvim/astrocommunity/commit/ba3ea511fbc3fa8113485859681ce5fe3c2d6d4e))


### Bug Fixes

* **ansible:** use public API for getting buffer lines ([#514](https://github.com/AstroNvim/astrocommunity/issues/514)) ([3cda952](https://github.com/AstroNvim/astrocommunity/commit/3cda9522caae9f321c472e23d39a23e95b19f723))
* **auto-save-nvim:** disable format on save when auto saving ([#511](https://github.com/AstroNvim/astrocommunity/issues/511)) ([ee65d95](https://github.com/AstroNvim/astrocommunity/commit/ee65d951937c34b636947b31905e7f98f675e472))
* **cpp:** update clangd_extensions plugin to new setup process ([#513](https://github.com/AstroNvim/astrocommunity/issues/513)) ([3712618](https://github.com/AstroNvim/astrocommunity/commit/37126181ce621e4257478881ae21a1b54d2c048b))
* **rust:** Lazy load crates.nvim on BufRead Cargo.toml event ([#515](https://github.com/AstroNvim/astrocommunity/issues/515)) ([cdd62c6](https://github.com/AstroNvim/astrocommunity/commit/cdd62c67e982f5857778b936456305afeb22795a))

## [3.4.0](https://github.com/AstroNvim/astrocommunity/compare/v3.3.0...v3.4.0) (2023-08-06)


### Features

* **editing-support:** add yanky.nvim ([#486](https://github.com/AstroNvim/astrocommunity/issues/486)) ([299fe33](https://github.com/AstroNvim/astrocommunity/commit/299fe33ca31e81d61716af4602f631434990fb3d))
* **pack:** Add Scala language pack ([#501](https://github.com/AstroNvim/astrocommunity/issues/501)) ([b98fde2](https://github.com/AstroNvim/astrocommunity/commit/b98fde28477a38f18708c9222a0cffa6999f5b2d))
* **pack:** Adding helm pack ([#496](https://github.com/AstroNvim/astrocommunity/issues/496)) ([f8fbe84](https://github.com/AstroNvim/astrocommunity/commit/f8fbe8404559e8314b4096cffa20e20c1f08fbfe))
* **pack:** enable hot reloading in java and show java lsp progress ([#504](https://github.com/AstroNvim/astrocommunity/issues/504)) ([fbf40f4](https://github.com/AstroNvim/astrocommunity/commit/fbf40f402e4958e681d65d90276156ef11b2eda9))
* **programming-language-support:** Add dooku.nvim ([#503](https://github.com/AstroNvim/astrocommunity/issues/503)) ([6deb350](https://github.com/AstroNvim/astrocommunity/commit/6deb3507274eb0410641d2050af5c1f8a8e929ad))
* **zen-mode-nvim:** add integration with vim-matchup if enabled ([#485](https://github.com/AstroNvim/astrocommunity/issues/485)) ([4671c39](https://github.com/AstroNvim/astrocommunity/commit/4671c3978e132030f49c454a168a1f84e233ea06))


### Bug Fixes

* **go:** Add extra treesitter languages for Go ([#495](https://github.com/AstroNvim/astrocommunity/issues/495)) ([7d7f82a](https://github.com/AstroNvim/astrocommunity/commit/7d7f82aab2b41af9e17b14a05488ac78991e11df))
* **multicursors-nvim:** support MCstart in visual mode ([#492](https://github.com/AstroNvim/astrocommunity/issues/492)) ([d5822bb](https://github.com/AstroNvim/astrocommunity/commit/d5822bb2fe3bed39b731e827f3c1c6e9bed0418c))
* **neogit:** move check into code rather than docs ([#494](https://github.com/AstroNvim/astrocommunity/issues/494)) ([e365cdf](https://github.com/AstroNvim/astrocommunity/commit/e365cdf50e7edfce953b071d624283e326e710e4))
* **refactoring-nvim:** add select mode to mappings. remove conflicting ([#499](https://github.com/AstroNvim/astrocommunity/issues/499)) ([c59b7a7](https://github.com/AstroNvim/astrocommunity/commit/c59b7a7c87aa451799b3949e71b8537ad152d33d))


### Reverts

* use `&lt;C-j&gt;` for copilot acceptance ([#507](https://github.com/AstroNvim/astrocommunity/issues/507)) ([213ddc3](https://github.com/AstroNvim/astrocommunity/commit/213ddc3a8fe586f665cbb4c5f9db3a23fae8ad59))

## [3.3.0](https://github.com/AstroNvim/astrocommunity/compare/v3.2.0...v3.3.0) (2023-07-23)


### Features

* **catppuccin:** enable catppuccin integrations automatically ([#457](https://github.com/AstroNvim/astrocommunity/issues/457)) ([5ffae06](https://github.com/AstroNvim/astrocommunity/commit/5ffae06c6952047c254893c01a8fddb7dea7bb03))
* **color:** add mini-hipatterns ([#453](https://github.com/AstroNvim/astrocommunity/issues/453)) ([881847d](https://github.com/AstroNvim/astrocommunity/commit/881847dc95cc691ecf92581762e73db9c223c6c7))
* **debugging:** add nvim-dap-repl-highlights ([#454](https://github.com/AstroNvim/astrocommunity/issues/454)) ([2c8ecc9](https://github.com/AstroNvim/astrocommunity/commit/2c8ecc911eb9dcd508d854c37b97584bf4b5415d))
* **editing-support:** add nvim-neoclip plugin ([#450](https://github.com/AstroNvim/astrocommunity/issues/450)) ([4ebda64](https://github.com/AstroNvim/astrocommunity/commit/4ebda647617c4fac82250f6412d4fbec173b12e2))
* **editing-support:** add treesitter endwise ([#466](https://github.com/AstroNvim/astrocommunity/issues/466)) ([95a580d](https://github.com/AstroNvim/astrocommunity/commit/95a580d2058823f446154b22824668398a55c58d))
* **fuzzy-finder:** add telescope-zoxide ([#452](https://github.com/AstroNvim/astrocommunity/issues/452)) ([5975749](https://github.com/AstroNvim/astrocommunity/commit/5975749ed50bfd10cdd81cd69a8552214df1877a))
* **lsp:** add ray-x/lsp_signature.nvim ([#470](https://github.com/AstroNvim/astrocommunity/issues/470)) ([e1ccbdc](https://github.com/AstroNvim/astrocommunity/commit/e1ccbdc26c3d1e2f4773d728f05ee4fb557508ba))
* **neogit:** enable neogit integrations if they are available ([#456](https://github.com/AstroNvim/astrocommunity/issues/456)) ([3102b7c](https://github.com/AstroNvim/astrocommunity/commit/3102b7c637f7c60edadeecf81fcb34f78be75c76))
* **php:** Add `php-cs-fixer` as formatter for php ([#476](https://github.com/AstroNvim/astrocommunity/issues/476)) ([81d63af](https://github.com/AstroNvim/astrocommunity/commit/81d63af9399967f3ecc58251e4d3910ad46aaf6f))
* **typescript:** Add support for dap for JS ([#475](https://github.com/AstroNvim/astrocommunity/issues/475)) ([9bd1e3e](https://github.com/AstroNvim/astrocommunity/commit/9bd1e3ee6a622b3d671cb7217089a5ab0fc33365))
* **vim-matchup:** improve offscreen popup style ([#474](https://github.com/AstroNvim/astrocommunity/issues/474)) ([d571aa8](https://github.com/AstroNvim/astrocommunity/commit/d571aa8b8764bae2f0089fcef31d6e3fce75ccab))


### Bug Fixes

* **catppuccin:** add recommended telescope config ([#471](https://github.com/AstroNvim/astrocommunity/issues/471)) ([bcb8296](https://github.com/AstroNvim/astrocommunity/commit/bcb82962d283c526e6c92da5821a246d18074892))
* **catppuccin:** enable alpha.nvim by default ([#459](https://github.com/AstroNvim/astrocommunity/issues/459)) ([23dce80](https://github.com/AstroNvim/astrocommunity/commit/23dce805c6691540a69a4706c2df2816ba6daf2e))
* **chatgpt-nvim:** typo in `dependencies` key ([#461](https://github.com/AstroNvim/astrocommunity/issues/461)) ([ae0c6b6](https://github.com/AstroNvim/astrocommunity/commit/ae0c6b6cfdba1f0c7400742ce71e50a9fac0d438))
* **mini-indentscope:** ignore more filetypes ([#458](https://github.com/AstroNvim/astrocommunity/issues/458)) ([946c4e3](https://github.com/AstroNvim/astrocommunity/commit/946c4e37ec967cf7200a2361b5a4662582616912))
* **nvim-toggler:** add lazy load on keys ([#464](https://github.com/AstroNvim/astrocommunity/issues/464)) ([c343448](https://github.com/AstroNvim/astrocommunity/commit/c343448334d8dfacae79f33eb0eff856b9880703))
* **portal-nvim:** lazy load on cmd ([#469](https://github.com/AstroNvim/astrocommunity/issues/469)) ([ca6991a](https://github.com/AstroNvim/astrocommunity/commit/ca6991aa62457202a65ee78b0d88b73524506148))
* **scope-nvim:** Register extension with Telescope ([#467](https://github.com/AstroNvim/astrocommunity/issues/467)) ([79ad146](https://github.com/AstroNvim/astrocommunity/commit/79ad1468bcef48372d6e1df3e5b331405892e4be))

## [3.2.0](https://github.com/AstroNvim/astrocommunity/compare/v3.1.1...v3.2.0) (2023-07-16)


### Features

* **bars-and-lines:** Add vim-illuminate ([#436](https://github.com/AstroNvim/astrocommunity/issues/436)) ([#443](https://github.com/AstroNvim/astrocommunity/issues/443)) ([0ba344b](https://github.com/AstroNvim/astrocommunity/commit/0ba344b5c41c154e741ff41c70faa8151245cdec))
* **code-runner:** Add executor.nvim ([#388](https://github.com/AstroNvim/astrocommunity/issues/388)) ([a67d356](https://github.com/AstroNvim/astrocommunity/commit/a67d35674b0e25e033b9abb80b15219a6b62f9cb))
* **colorscheme:** Add fluormachine.nvim ([#390](https://github.com/AstroNvim/astrocommunity/issues/390)) ([696c913](https://github.com/AstroNvim/astrocommunity/commit/696c913c6c638d09b2b101f832130f2aded2e314))
* **colorscheme:** add helix-nvim ([#373](https://github.com/AstroNvim/astrocommunity/issues/373)) ([11a043b](https://github.com/AstroNvim/astrocommunity/commit/11a043bdccda7a1959a26593a1cba2eecf1dd794))
* **colorscheme:** add melange colorscheme plugin ([952529a](https://github.com/AstroNvim/astrocommunity/commit/952529a00fcc4d6564fad123419242619c3fc4e9))
* **colorscheme:** add melange plugin ([#371](https://github.com/AstroNvim/astrocommunity/issues/371)) ([952529a](https://github.com/AstroNvim/astrocommunity/commit/952529a00fcc4d6564fad123419242619c3fc4e9))
* **completion:** Add cmp-cmdline ([#383](https://github.com/AstroNvim/astrocommunity/issues/383)) ([80a781b](https://github.com/AstroNvim/astrocommunity/commit/80a781beea32e7f65a555d58f047517cd9e56f94))
* **debugging:** add nvim-dap-virtual-text ([#387](https://github.com/AstroNvim/astrocommunity/issues/387)) ([1635373](https://github.com/AstroNvim/astrocommunity/commit/1635373ea8a9376e954ee044c8b8095784546358))
* **debugging:** add telescope dap extension ([#377](https://github.com/AstroNvim/astrocommunity/issues/377)) ([ccf4487](https://github.com/AstroNvim/astrocommunity/commit/ccf4487e060d3a3d746c4a3658d2887a0d988cef))
* **editing-support:** Add comment-box.nvim ([#392](https://github.com/AstroNvim/astrocommunity/issues/392)) ([57e7022](https://github.com/AstroNvim/astrocommunity/commit/57e7022bc45b9ff830d6bf4d7a175c7c01f6f86f))
* **editing-support:** add hypersonic.nvim ([#389](https://github.com/AstroNvim/astrocommunity/issues/389)) ([04aa7e0](https://github.com/AstroNvim/astrocommunity/commit/04aa7e050356b91ce61b88ce9ae96b45be9d2153))
* **editing-support:** add multicursors.nvim plugin ([#379](https://github.com/AstroNvim/astrocommunity/issues/379)) ([19e0bb4](https://github.com/AstroNvim/astrocommunity/commit/19e0bb491495a1b0db8b598829bd233d555aedb1))
* **editing-support:** add rainbow-delimiters.nvim ([#365](https://github.com/AstroNvim/astrocommunity/issues/365)) ([b7805a7](https://github.com/AstroNvim/astrocommunity/commit/b7805a7ee8d6a1d7f13a0fb2454218b4b0cffe27))
* **editing-support:** Add telescope-undo.nvim ([#400](https://github.com/AstroNvim/astrocommunity/issues/400)) ([bc8c98e](https://github.com/AstroNvim/astrocommunity/commit/bc8c98e6e35372d8bd774b62fb513e2d64a09931))
* **git:** Add diffview.nvim ([#428](https://github.com/AstroNvim/astrocommunity/issues/428)) ([b44513b](https://github.com/AstroNvim/astrocommunity/commit/b44513ba6597f96b10410213663fbcb2f0086528))
* **godot:** add godot language pack ([#429](https://github.com/AstroNvim/astrocommunity/issues/429)) ([c8a6bdd](https://github.com/AstroNvim/astrocommunity/commit/c8a6bdde9cce34d428c621721453372f915784d1))
* **grapple-nvim:** change grapple icon from arrow to hook to distinguish from harpoon ([#418](https://github.com/AstroNvim/astrocommunity/issues/418)) ([b93f8a8](https://github.com/AstroNvim/astrocommunity/commit/b93f8a897ef1d37df132007fc29dfbf9c693ccef))
* **lsp_lines-nvim:** disable virtual text and add `&lt;leader&gt;uD` mapping ([#411](https://github.com/AstroNvim/astrocommunity/issues/411)) ([4de6948](https://github.com/AstroNvim/astrocommunity/commit/4de6948e4853dabd5cee89ed7707a90b362404eb))
* **minimap-vim:** add more disabled filetypes and add `&lt;leader&gt;um` mapping ([#444](https://github.com/AstroNvim/astrocommunity/issues/444)) ([c8a0eb3](https://github.com/AstroNvim/astrocommunity/commit/c8a0eb31f8c745c5299837e3c5eb77ad1b7248d4))
* **motion:** add marks.nvim improve nvim mark function ([#445](https://github.com/AstroNvim/astrocommunity/issues/445)) ([1fddb01](https://github.com/AstroNvim/astrocommunity/commit/1fddb015c33fd5ec915b577902fa5bd8dd3ccd6c))
* **pack:** add full-dadbod plugin pack ([#368](https://github.com/AstroNvim/astrocommunity/issues/368)) ([c603039](https://github.com/AstroNvim/astrocommunity/commit/c603039f23f41818ca42c3ac2ec3e3092b3feaa5))
* **pack:** add kotlin language pack ([#366](https://github.com/AstroNvim/astrocommunity/issues/366)) ([f43c76d](https://github.com/AstroNvim/astrocommunity/commit/f43c76dc1de37f6f8564bdeab7e05adb32913016))
* **pack:** add PowerShell language pack ([#360](https://github.com/AstroNvim/astrocommunity/issues/360)) ([4564f0d](https://github.com/AstroNvim/astrocommunity/commit/4564f0dfb69e7bd33d1767d0c1d42b3e2e21ba27))
* **pack:** Add quarto language pack ([#426](https://github.com/AstroNvim/astrocommunity/issues/426)) ([542dfe4](https://github.com/AstroNvim/astrocommunity/commit/542dfe41e9f7bc4489e4debea316d8ff48927c14))
* **pack:** add wgsl pack ([#415](https://github.com/AstroNvim/astrocommunity/issues/415)) ([febbbad](https://github.com/AstroNvim/astrocommunity/commit/febbbad7bdba5d0c62e6b1d89cb408c7991a609f))
* **programming-language-support:** Add csv-vim ([#385](https://github.com/AstroNvim/astrocommunity/issues/385)) ([1a08d9d](https://github.com/AstroNvim/astrocommunity/commit/1a08d9d7a77f72d11771802ee67b67bb0cddf865))
* **programming-language-support:** add nvim-jqx ([#386](https://github.com/AstroNvim/astrocommunity/issues/386)) ([c297a25](https://github.com/AstroNvim/astrocommunity/commit/c297a25a77ac981a14d3dddd0822479e5e5117e0))
* **programming-language-support:** Add support for rest-nvim ([#384](https://github.com/AstroNvim/astrocommunity/issues/384)) ([74393f5](https://github.com/AstroNvim/astrocommunity/commit/74393f5db7e477e6a5a86b12f06e8625b9a8805a))
* **programming-language-support:** Add web-tools.nvim ([#391](https://github.com/AstroNvim/astrocommunity/issues/391)) ([a88cb8f](https://github.com/AstroNvim/astrocommunity/commit/a88cb8f182a38dd94e515d273311ce9905f6adaa))
* **project:** add ProjectMgr plugin ([#372](https://github.com/AstroNvim/astrocommunity/issues/372)) ([dca1596](https://github.com/AstroNvim/astrocommunity/commit/dca1596d3b6240aa0ed92e4cde4447207f8db078))
* **remote-development:** Add distant.nvim ([#421](https://github.com/AstroNvim/astrocommunity/issues/421)) ([6565de5](https://github.com/AstroNvim/astrocommunity/commit/6565de520ce2534100be396ba5b25e66e63882db))
* **remote-development:** Add netman.nvim ([#420](https://github.com/AstroNvim/astrocommunity/issues/420)) ([b73f3a4](https://github.com/AstroNvim/astrocommunity/commit/b73f3a4eba4f0c29e4cf39b2b3605a4aad3f0cc3))
* **search:** Add nvim-hlslens ([#402](https://github.com/AstroNvim/astrocommunity/issues/402)) ([8440674](https://github.com/AstroNvim/astrocommunity/commit/8440674e8da59133590fd13d70ff306e1cfb8a5d))
* **search:** Add sad.nvim ([#427](https://github.com/AstroNvim/astrocommunity/issues/427)) ([f3ed869](https://github.com/AstroNvim/astrocommunity/commit/f3ed869c8ae30be02878faf87991ce21937997b9))
* **split-and-window:** Add minimap.vim ([#425](https://github.com/AstroNvim/astrocommunity/issues/425)) ([ef4563e](https://github.com/AstroNvim/astrocommunity/commit/ef4563e35b53eaae77237ed2c65fe1251399b76c))
* **split-and-window:** Add windows.nvim ([#393](https://github.com/AstroNvim/astrocommunity/issues/393)) ([7684864](https://github.com/AstroNvim/astrocommunity/commit/768486437459c97a4849b34f1a2ad6a82eb5774f))
* **telescope-undo-nvim:** add `&lt;leader&gt;fu` keybind ([#408](https://github.com/AstroNvim/astrocommunity/issues/408)) ([360d42b](https://github.com/AstroNvim/astrocommunity/commit/360d42bab1e4594d4c53dab34d1387899434dcc8))
* **utility:** Add nvim-toggler ([#375](https://github.com/AstroNvim/astrocommunity/issues/375)) ([82f1402](https://github.com/AstroNvim/astrocommunity/commit/82f1402b63d0acaae986818b8d8a8b48fc9fbc00))
* **utility:** Add telescope-fzy-native.nvim ([#398](https://github.com/AstroNvim/astrocommunity/issues/398)) ([529284e](https://github.com/AstroNvim/astrocommunity/commit/529284ef8d1f8f1e620f5823e74511ce26bbcb2b))
* **utility:** Add telescope-live-grep-args.nvim ([#397](https://github.com/AstroNvim/astrocommunity/issues/397)) ([903d318](https://github.com/AstroNvim/astrocommunity/commit/903d318b4a9708d4d7bc7b4ead1ea1cdba60caeb))
* **vimtex:** add which-key mapping descriptions ([#394](https://github.com/AstroNvim/astrocommunity/issues/394)) ([a49863d](https://github.com/AstroNvim/astrocommunity/commit/a49863d0c46497b363d3be95fd5178235cec974e))
* **workflow:** Add bad-practices.nvim ([#399](https://github.com/AstroNvim/astrocommunity/issues/399)) ([168a450](https://github.com/AstroNvim/astrocommunity/commit/168a450fa47299672b241f18135a88b20535a4c1))


### Bug Fixes

* add deprecation notices to relevant AstroCommunity entries ([052923f](https://github.com/AstroNvim/astrocommunity/commit/052923f253a0a00e391717b3fa6102dcdee40e92))
* **colorscheme:** formatting ([952529a](https://github.com/AstroNvim/astrocommunity/commit/952529a00fcc4d6564fad123419242619c3fc4e9))
* **comment-box-nvim:** Load on User AstroFile event ([#447](https://github.com/AstroNvim/astrocommunity/issues/447)) ([a6e0fca](https://github.com/AstroNvim/astrocommunity/commit/a6e0fca033af7ca02d3e002ac94355858edfa4cf))
* disable `lua_ls` formatting with Neoconf ([c655744](https://github.com/AstroNvim/astrocommunity/commit/c655744e70ceb128e82a9a6ee1da95785a3f3faa))
* **full-dadbod:** various dadbod spec fixes ([91f2910](https://github.com/AstroNvim/astrocommunity/commit/91f29106627ed61d9d24427ab51f094678ebb6ce))
* **grapple-nvim:** Make which-key entry color blue, as it should be ([#414](https://github.com/AstroNvim/astrocommunity/issues/414)) ([3dbdce3](https://github.com/AstroNvim/astrocommunity/commit/3dbdce33e56667c2ee1279f437c66553f31b32c3))
* **harpoon:** Make which-key entry color blue, as it should be ([#376](https://github.com/AstroNvim/astrocommunity/issues/376)) ([8f829a3](https://github.com/AstroNvim/astrocommunity/commit/8f829a3ef84c84bca4e30c1da5656b139187b444))
* **haxe:** fix treesitter detection for haxe ([#422](https://github.com/AstroNvim/astrocommunity/issues/422)) ([19218ff](https://github.com/AstroNvim/astrocommunity/commit/19218ffc2715ee7b210c25e7081ba41ae0f72d5b))
* **leap-nvim:** duplicate cursor when leaping ([#407](https://github.com/AstroNvim/astrocommunity/issues/407)) ([45ae8f9](https://github.com/AstroNvim/astrocommunity/commit/45ae8f9bc11eb6a655e584898b2decec30195f74))
* Make which-key entry color blue, as it should be ([#424](https://github.com/AstroNvim/astrocommunity/issues/424)) ([aea716a](https://github.com/AstroNvim/astrocommunity/commit/aea716ac95aca4c316cc7cb1beae1d2e19b69f2c))
* **mini-indentscope:** add undotree to list of ignored filetypes ([#433](https://github.com/AstroNvim/astrocommunity/issues/433)) ([c35517c](https://github.com/AstroNvim/astrocommunity/commit/c35517c0613cc67a4c2236965d0125b3038e27b3))
* **mini-indentscope:** ignore more filetypes ([#442](https://github.com/AstroNvim/astrocommunity/issues/442)) ([dc7ea3b](https://github.com/AstroNvim/astrocommunity/commit/dc7ea3b358eafd508261b8108a37dc3ca11b414e))
* **mini-surround:** load on User AstroFile event ([#448](https://github.com/AstroNvim/astrocommunity/issues/448)) ([e9244d8](https://github.com/AstroNvim/astrocommunity/commit/e9244d8d846230adc417a0e4fc89b11a5216ae02))
* **mini-surround:** use keys to lazy load instead ([#449](https://github.com/AstroNvim/astrocommunity/issues/449)) ([959d180](https://github.com/AstroNvim/astrocommunity/commit/959d18070d320cf6f91f7d950183b52bbae32d75))
* **multicursors-nvim:** add missing dependency ([30de2c7](https://github.com/AstroNvim/astrocommunity/commit/30de2c72c7f75a1d71e05bd4ea2d11299d65a3e0))
* **neoconf-nvim:** add deprecation notice to Neoconf as it was added upstream ([8bce2fb](https://github.com/AstroNvim/astrocommunity/commit/8bce2fb0d386a2251c493b8bdee9964aec603f52))
* **neogit:** Need to setup neogit before it runs ([#441](https://github.com/AstroNvim/astrocommunity/issues/441)) ([60b95d3](https://github.com/AstroNvim/astrocommunity/commit/60b95d35dfe6764f1ea1626129f537eca98e4bc9))
* **neotest:** add neodev integration ([#437](https://github.com/AstroNvim/astrocommunity/issues/437)) ([5e49293](https://github.com/AstroNvim/astrocommunity/commit/5e492931f0423574a3e79a64d537ba2adbfbd143))
* **neotest:** fix `opts` usage in plugin spec ([1e63a40](https://github.com/AstroNvim/astrocommunity/commit/1e63a40289f42098c21c7955b3403c3424cb07c6))
* **neotest:** Fix bug in neotest by checking for existing library key table ([#440](https://github.com/AstroNvim/astrocommunity/issues/440)) ([86640cc](https://github.com/AstroNvim/astrocommunity/commit/86640cc79d2bd4bb4d1e8be9f6c7143040448084))
* **nvim-hlslens:** add lazy event ([#409](https://github.com/AstroNvim/astrocommunity/issues/409)) ([3d8e13b](https://github.com/AstroNvim/astrocommunity/commit/3d8e13bc872c4c9362b75ed7bd95a86bd48eddee))
* **nvim-spectre:** Make which-key entry color blue ([#413](https://github.com/AstroNvim/astrocommunity/issues/413)) ([f72c5cc](https://github.com/AstroNvim/astrocommunity/commit/f72c5cc4b7b0c54bc1186154e1b00a6bf8cab6ce))
* **nvim-spectre:** Make which-key entry color blue and add icon ([f72c5cc](https://github.com/AstroNvim/astrocommunity/commit/f72c5cc4b7b0c54bc1186154e1b00a6bf8cab6ce))
* **obsidian-nvim:** added obsidian.nvim config and changed the readme ([#378](https://github.com/AstroNvim/astrocommunity/issues/378)) ([3234929](https://github.com/AstroNvim/astrocommunity/commit/323492936d85a03d8a7c0488a2ecaf101c222fbb))
* **octo-nvim:** which-key description and color for nested entries ([#419](https://github.com/AstroNvim/astrocommunity/issues/419)) ([556e253](https://github.com/AstroNvim/astrocommunity/commit/556e2537e856aa97775ddf36ae4d461075736989))
* **python:** added debugpy path auto-resolution using mason-registry ([#367](https://github.com/AstroNvim/astrocommunity/issues/367)) ([7133cbd](https://github.com/AstroNvim/astrocommunity/commit/7133cbd6593f9442f7291caa9ce3ae4c1d76b5fe))
* **quarto:** Fix bugs in quarto pack ([#438](https://github.com/AstroNvim/astrocommunity/issues/438)) ([5a54e6c](https://github.com/AstroNvim/astrocommunity/commit/5a54e6c241101b1692e231bac80775cb71e8b313))
* **rainbow-delimiters:** add support for configuration through `opts` table ([f65c95b](https://github.com/AstroNvim/astrocommunity/commit/f65c95b3c6a05579afe8634b0bcdb56308d6ae5f))
* **refactoring-nvim:** improve lazy loading ([#382](https://github.com/AstroNvim/astrocommunity/issues/382)) ([e26c734](https://github.com/AstroNvim/astrocommunity/commit/e26c7348e271590a04d818a9170ecb66b7be7026))
* **telescope-dap-nvim:** rewrite plugin spec ([#401](https://github.com/AstroNvim/astrocommunity/issues/401)) ([cf22cfd](https://github.com/AstroNvim/astrocommunity/commit/cf22cfd0405267d7c13fab1ddd2706e5a77f3700))
* **telescope-undo-nvim:** fix repo url ([1558c59](https://github.com/AstroNvim/astrocommunity/commit/1558c5960434afc2bb9e6adbac9aee2333245f72))
* **trouble-nvim:** Make which-key entry color blue, as it should be ([#416](https://github.com/AstroNvim/astrocommunity/issues/416)) ([6ae1fde](https://github.com/AstroNvim/astrocommunity/commit/6ae1fde87fd8247a33742b0a6bd175c3434af31d))
* **typescript:** lazy load tsc on cmd ([#381](https://github.com/AstroNvim/astrocommunity/issues/381)) ([9ae7e67](https://github.com/AstroNvim/astrocommunity/commit/9ae7e67c501f741b73a67e64cb655f0ba7606c02))
* **zen-mode-nvim:** disable mini.indentscope if enabled ([#434](https://github.com/AstroNvim/astrocommunity/issues/434)) ([b3561a0](https://github.com/AstroNvim/astrocommunity/commit/b3561a0c406a0f4533c3d76313c459e7215434d6))
* **zen-mode-nvim:** disable/enable winbar when entering/exiting zen mode ([#363](https://github.com/AstroNvim/astrocommunity/issues/363)) ([899060d](https://github.com/AstroNvim/astrocommunity/commit/899060dedb86a86fbb9e0de7f6906316ec43a9be))
* **zen-mode-nvim:** ensure winbar stays disabled and restore old mini.indentscope options ([#439](https://github.com/AstroNvim/astrocommunity/issues/439)) ([6bc9421](https://github.com/AstroNvim/astrocommunity/commit/6bc9421b786409f34b573c3f4eb32387ff70b293))


### Performance Improvements

* **python:** make sure mason-nvim-dap doesn't set up python debuggers ([#369](https://github.com/AstroNvim/astrocommunity/issues/369)) ([eff0d7f](https://github.com/AstroNvim/astrocommunity/commit/eff0d7fe2aa0fc27256ba4de54b0ea1b0bc5a36f))

## [3.1.1](https://github.com/AstroNvim/astrocommunity/compare/v3.1.0...v3.1.1) (2023-07-03)


### Bug Fixes

* **ccc-nvim:** fix auto starting of highlighter ([#356](https://github.com/AstroNvim/astrocommunity/issues/356)) ([726df9e](https://github.com/AstroNvim/astrocommunity/commit/726df9ee20bc3766e8ff22604376ed166674c0e9))
* **ccc-nvim:** incorrect mapping ([#359](https://github.com/AstroNvim/astrocommunity/issues/359)) ([c5a0d0b](https://github.com/AstroNvim/astrocommunity/commit/c5a0d0bf3eea734f8fc7ff122966286faf166876))
* **chatgpt-nvim:** fix entire ChatGPT spec ([#361](https://github.com/AstroNvim/astrocommunity/issues/361)) ([94a146f](https://github.com/AstroNvim/astrocommunity/commit/94a146f74e33a9d7a99b5bc106327196f8e22ba6))
* **neogit:** Use the new repository for neogit ([#355](https://github.com/AstroNvim/astrocommunity/issues/355)) ([8b2a8fe](https://github.com/AstroNvim/astrocommunity/commit/8b2a8fed2945430326f8bb586024bec53ff798a1))

## [3.1.0](https://github.com/AstroNvim/astrocommunity/compare/v3.0.0...v3.1.0) (2023-07-02)


### Features

* add astro filetype to eslint_d handler in typescript pack ([#319](https://github.com/AstroNvim/astrocommunity/issues/319)) ([fa131c2](https://github.com/AstroNvim/astrocommunity/commit/fa131c2cb1e066d36974f097633b3e14e99c7d39))
* add python debug with arguments ([#315](https://github.com/AstroNvim/astrocommunity/issues/315)) ([35f028a](https://github.com/AstroNvim/astrocommunity/commit/35f028aa9860dcd5b7fa5465bfff7d5a6f5d72f3))
* add vim-move plugin ([1bd4ad0](https://github.com/AstroNvim/astrocommunity/commit/1bd4ad03d9ac1284c1d489d600403c9aa8a87ace))
* add vim-smoothie plugin ([#324](https://github.com/AstroNvim/astrocommunity/issues/324)) ([2a46002](https://github.com/AstroNvim/astrocommunity/commit/2a46002e9cace0646b68689965ad4a5a47d23621))
* change olexsmir/gopher.nvim to ray-x/go.nvim ([#325](https://github.com/AstroNvim/astrocommunity/issues/325)) ([435acc3](https://github.com/AstroNvim/astrocommunity/commit/435acc3e0e28e2561819c69f8e8530906313196e))
* **color:** add default nvim command of ccc-nvim. ([#339](https://github.com/AstroNvim/astrocommunity/issues/339)) ([724a0fd](https://github.com/AstroNvim/astrocommunity/commit/724a0fd659d1c1d5fe7fb95b797db93ef7e2a7ae))
* **editing-support:** Add chatGPT.nvim ([#352](https://github.com/AstroNvim/astrocommunity/issues/352)) ([023e840](https://github.com/AstroNvim/astrocommunity/commit/023e840969c08a30287c83161a883639d40bec02))
* **editing-support:** add ultimate-autopair.nvim ([#314](https://github.com/AstroNvim/astrocommunity/issues/314)) ([73a537c](https://github.com/AstroNvim/astrocommunity/commit/73a537c0465ac8b69abe0112ffe42c81ae2e913f))
* **editing-support:** add vim-move plugin ([#328](https://github.com/AstroNvim/astrocommunity/issues/328)) ([1bd4ad0](https://github.com/AstroNvim/astrocommunity/commit/1bd4ad03d9ac1284c1d489d600403c9aa8a87ace))
* **file-explorer:** Add initial support for mini.files ([#348](https://github.com/AstroNvim/astrocommunity/issues/348)) ([0b678ea](https://github.com/AstroNvim/astrocommunity/commit/0b678ea2c00e7a74d2127215c8326238761a6b3d))
* **html-css:** add emmet_ls to html-css supprt syntax like `li * 5` ([#347](https://github.com/AstroNvim/astrocommunity/issues/347)) ([247d1f2](https://github.com/AstroNvim/astrocommunity/commit/247d1f2c93894ab2c4fe848e972731b697ab0fdf))
* **motion:** add move plugin flash nvim ([#340](https://github.com/AstroNvim/astrocommunity/issues/340)) ([86815e1](https://github.com/AstroNvim/astrocommunity/commit/86815e184d3554968f231b24977b09aee34fbcdc))
* **pack:** add c-sharp base pack ([#312](https://github.com/AstroNvim/astrocommunity/issues/312)) ([91f4c57](https://github.com/AstroNvim/astrocommunity/commit/91f4c57101d12cfdd9133f5aafe6c36e1eee4026))
* **pack:** add ProtoBuf pack ([#330](https://github.com/AstroNvim/astrocommunity/issues/330)) ([bafa6dc](https://github.com/AstroNvim/astrocommunity/commit/bafa6dc0ed24493b3db3ddc2d68400a580514099))
* **pack:** Add ruby language pack ([#323](https://github.com/AstroNvim/astrocommunity/issues/323)) ([64a1b4c](https://github.com/AstroNvim/astrocommunity/commit/64a1b4cc40192fef5efad52b542b5acd3ee2f07b))
* **pack:** Adding ansible pack ([#346](https://github.com/AstroNvim/astrocommunity/issues/346)) ([fb549e4](https://github.com/AstroNvim/astrocommunity/commit/fb549e4f2a6907d2bb197d3fefa5e8cd19b45121))
* **project-nvim:** use a slightly more maintained version of `project.nvim` ([#332](https://github.com/AstroNvim/astrocommunity/issues/332)) ([d0a3fd0](https://github.com/AstroNvim/astrocommunity/commit/d0a3fd08a91c67f5ccdb8181167d5abee84dbc76))
* use a slightly more maintained version of `project.nvim` ([d0a3fd0](https://github.com/AstroNvim/astrocommunity/commit/d0a3fd08a91c67f5ccdb8181167d5abee84dbc76))


### Bug Fixes

* add space after clojure comment character ([1092abc](https://github.com/AstroNvim/astrocommunity/commit/1092abc932d64a068d66b2bf92e79689b55941dc))
* **clojure:** add space after clojure comment character ([#335](https://github.com/AstroNvim/astrocommunity/issues/335)) ([1092abc](https://github.com/AstroNvim/astrocommunity/commit/1092abc932d64a068d66b2bf92e79689b55941dc))
* **debugging:** Load nvim-bqf on ft=qf ([#326](https://github.com/AstroNvim/astrocommunity/issues/326)) ([6520e57](https://github.com/AstroNvim/astrocommunity/commit/6520e57f1a493a98c63d725983e63c8c80dcc488))
* **hardtime-nvim:** config uses legacy table ([#342](https://github.com/AstroNvim/astrocommunity/issues/342)) ([450b812](https://github.com/AstroNvim/astrocommunity/commit/450b81243ffb12cfb7a31e6be38b1df463e33950))
* **motion:** vim-matchup - matchup_matchparen_offscreen method='popup… ([#331](https://github.com/AstroNvim/astrocommunity/issues/331)) ([840e049](https://github.com/AstroNvim/astrocommunity/commit/840e0497d6dccfa4cfaac988948e98b85c000091))
* **nvim-scrollbar:** Fix issue with is_available calls ([#350](https://github.com/AstroNvim/astrocommunity/issues/350)) ([a5bb535](https://github.com/AstroNvim/astrocommunity/commit/a5bb5354cd0a73e9f698dc2f6c71958960ee7741))
* **nvim-scrollbar:** Fix issue with is_available calls ([#351](https://github.com/AstroNvim/astrocommunity/issues/351)) ([d776458](https://github.com/AstroNvim/astrocommunity/commit/d77645817bb2cd1ad8291be44cd02e1fd4e52893))
* persistent-breakpoints.nvim lazy loading ([#313](https://github.com/AstroNvim/astrocommunity/issues/313)) ([cff4b2e](https://github.com/AstroNvim/astrocommunity/commit/cff4b2e4806c45bb0f1a6179307224d85377ada0))
* **ultimate-autopair-nvim:** update ultimate-autopair.nvim ([#333](https://github.com/AstroNvim/astrocommunity/issues/333)) ([8b30fd6](https://github.com/AstroNvim/astrocommunity/commit/8b30fd6dc658f75f4e5e5a9678aad648adf2c614))


### Reverts

* "feat: add astro filetype to eslint_d handler in typescript pack" ([#321](https://github.com/AstroNvim/astrocommunity/issues/321)) ([53b36f9](https://github.com/AstroNvim/astrocommunity/commit/53b36f9666a0b2e96448b6e990d12eb9c8a7297e))

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
