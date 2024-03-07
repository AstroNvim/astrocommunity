return {
  "smjonas/inc-rename.nvim",
  event = "User AstroLspSetup",
  dependencies = {
    {
      "AstroNvim/astrolsp",
      optional = true,
      ---@type AstroLSPOpts
      opts = {
        mappings = {
          n = {
            ["<Leader>lr"] = {
              function() return ":IncRename " .. vim.fn.expand "<cword>" end,
              expr = true,
              desc = "Rename current symbol",
              cond = "textDocument/rename",
            },
          },
        },
      },
    },
    {
      "folke/noice.nvim",
      optional = true,
      opts = { presets = { inc_rename = true } },
    },
  },
  opts = function(_, opts)
    local is_available = require("astrocore").is_available
    if is_available "dressing.nvim" and not is_available "noice.nvim" then opts.input_buffer_type = "dressing" end
  end,
}
