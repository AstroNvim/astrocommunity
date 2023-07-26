return {
  {
    "AstroNvim/astrocore",
    opts = {
      mappings = {
        n = {
          ["<leader>lr"] = {
            function()
              require "inc_rename"
              return ":IncRename " .. vim.fn.expand "<cword>"
            end,
            desc = "IncRename",
          },
        },
      },
    },
  },
  {
    "smjonas/inc-rename.nvim",
    opts = {},
  },
}
