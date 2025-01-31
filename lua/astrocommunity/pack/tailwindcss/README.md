# tailwindcss Language Pack

This plugin pack does the following:

- Adds `css` Treesitter parser
- Adds `tailwindcss` and `cssls` language servers
  - tailwindcss server activates when it detects any of these files:
    - `tailwind.config.{mjs,cjs,js,ts}`
    - `postcss.config.js`
    - `config/tailwind.config.js`
    - `assets/tailwind.config.js`
    - `tailwind.css`
- Adds `prettierd` formatter
- Adds [`tailwindcss-colorizer-cmp.nvim`](https://github.com/js-everts/cmp-tailwind-colors) to cmp completion sources
