local ignore_filetypes = {
  "aerial",
  "alpha",
  "dashboard",
  "help",
  "lazy",
  "mason",
  "neo-tree",
  "NvimTree",
  "neogitstatus",
  "notify",
  "startify",
  "toggleterm",
  "Trouble",
}
local ignore_buftypes = {
  "nofile",
  "prompt",
  "quickfix",
  "terminal",
}
local char = "▏"

return {
  "echasnovski/mini.indentscope",
  event = "User AstroFile",
  opts = function()
    return {
      options = { try_as_border = true },
      symbol = require("astrocore").plugin_opts("indent-blankline.nvim").context_char or char,
    }
  end,
  dependencies = {
    { "lukas-reineke/indent-blankline.nvim", optional = true, opts = { scope = { enabled = false } } },
    {
      "AstroNvim/astrocore",
      opts = {
        autocmds = {
          mini_indentscope = {
            {
              event = "FileType",
              desc = "Disable indentscope for certain filetypes",
              callback = function(event)
                if vim.b[event.buf].miniindentscope_disable == nil then
                  local filetype = vim.bo[event.buf].filetype
                  local blankline_opts = require("astrocore").plugin_opts "indent-blankline.nvim"
                  if vim.tbl_contains(blankline_opts.filetype_exclude or ignore_filetypes, filetype) then
                    vim.b[event.buf].miniindentscope_disable = true
                  end
                end
              end,
            },
            {
              event = "BufWinEnter",
              desc = "Disable indentscope for certain buftypes",
              callback = function(event)
                if vim.b[event.buf].miniindentscope_disable == nil then
                  local buftype = vim.bo[event.buf].buftype
                  local blankline_opts = require("astrocore").plugin_opts "indent-blankline.nvim"
                  if vim.tbl_contains(blankline_opts.buftype_exclude or ignore_buftypes, buftype) then
                    vim.b[event.buf].miniindentscope_disable = true
                  end
                end
              end,
            },
            {
              event = "TermOpen",
              desc = "Disable indentscope for terminals",
              callback = function(event)
                if vim.b[event.buf].miniindentscope_disable == nil then
                  vim.b[event.buf].miniindentscope_disable = true
                end
              end,
            },
          },
        },
      },
    },
  },
  specs = {
    {
      "catppuccin",
      optional = true,
      ---@type CatppuccinOptions
      opts = { integrations = { mini = true } },
    },
  },
}
