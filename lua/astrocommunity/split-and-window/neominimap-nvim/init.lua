return {
  "Isrothy/neominimap.nvim",
  version = "^3",
  lazy = false,
  specs = {
    { -- recommended options by the plugin
      "AstroNvim/astrocore",
      opts = {
        options = { opt = {
          wrap = false,
        } },
        mappings = {
          n = {
            ["<Leader>um"] = { "<Cmd>Neominimap toggle<CR>", desc = "Toggle minimap" },
          },
        },
      },
    },
  },
  opts = {
    buf_filter = function(bufnr) return require("astrocore.buffer").is_valid(bufnr) end,
  },
  config = function() end,
  init = function(plugin)
    local opts = plugin.opts

    if opts.layout == nil or opts.layout == "float" then
      local float_width = (vim.tbl_get(opts, "float", "minimap_width") or 20) + 2
      if vim.opt.sidescrolloff:get() < float_width then vim.opt.sidescrolloff = float_width end
    end
    vim.g.neominimap = require("astrocore").extend_tbl(opts, vim.g.neominimap)
  end,
}
