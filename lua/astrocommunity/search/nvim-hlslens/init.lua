return {
  "kevinhwang91/nvim-hlslens",
  opts = {},
  init = function() vim.on_key(nil, vim.api.nvim_get_namespaces()["auto_hlsearch"]) end,
}
