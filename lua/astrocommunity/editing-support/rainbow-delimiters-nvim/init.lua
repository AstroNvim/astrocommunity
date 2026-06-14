local enabled = true

return {
  {
    "HiPhish/rainbow-delimiters.nvim",
    submodules = false,
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      {
        "AstroNvim/astrocore",
        opts = {
          mappings = {
            n = {
              ["<Leader>u("] = {
                function()
                  local bufnr = vim.api.nvim_get_current_buf()
                  require("rainbow-delimiters").toggle(bufnr)
                  require("astrocore").notify(
                    string.format(
                      "Buffer rainbow delimeters %s",
                      require("rainbow-delimiters").is_enabled(bufnr) and "on" or "off"
                    )
                  )
                end,
                desc = "Toggle rainbow delimeters (buffer)",
              },
              ["<Leader>u)"] = {
                function()
                  local rainbow_delimiters = require "rainbow-delimiters"
                  enabled = not enabled
                  for _, bufnr in ipairs(vim.api.nvim_list_bufs()) do
                    if enabled then
                      rainbow_delimiters.enable(bufnr)
                    else
                      rainbow_delimiters.disable(bufnr)
                    end
                  end
                  require("astrocore").notify(string.format("Global rainbow delimeters %s", enabled and "on" or "off"))
                end,
                desc = "Toggle rainbow delimeters (global)",
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
        opts = { integrations = { rainbow_delimiters = true } },
      },
    },
    event = "User AstroFile",
    main = "rainbow-delimiters.setup",
    opts = {
      condition = function(bufnr)
        local buf_utils = require "astrocore.buffer"
        return enabled and buf_utils.is_valid(bufnr) and not buf_utils.is_large(bufnr)
      end,
    },
  },
}
