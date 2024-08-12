return {
  "iamcco/markdown-preview.nvim",
  build = function() vim.fn["mkdp#util#install"]() end,
  ft = { "markdown", "markdown.mdx" },
  init = function()
    local plugin = require("lazy.core.config").spec.plugins["markdown-preview.nvim"]
    vim.g.mkdp_filetypes = require("lazy.core.plugin").values(plugin, "ft", true)
  end,
}
