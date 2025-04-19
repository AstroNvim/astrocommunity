return {
  "echasnovski/mini.starter",
  version = "*", -- stable version
  config = function() require("mini.starter").setup() end,
  specs = {
    { "goolord/alpha-nvim", optional = true, enabled = false },
    { "folke/snacks.nvim", optional = true, opts = {
      dashboard = { enabled = false },
    } },
    {
      "AstroNvim/astrocore",
      optional = true,
      ---@type AstroCoreOpts
      opts = {
        mappings = {
          n = {
            ["<Leader>c"] = {
              function()
                local bufs = vim.fn.getbufinfo { buflisted = true }
                require("astrocore.buffer").close(0)
                if require("astrocore").is_available "mini.starter" and not bufs[2] then
                  require("mini.starter").open()
                  require("astrocore.buffer").close_all(true) -- remove empty buffer
                end
              end,
              desc = "Close buffer",
            },
          },
        },
      },
    },
  },
}
