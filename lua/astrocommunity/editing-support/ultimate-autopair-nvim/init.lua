return {
  {
    "windwp/nvim-autopairs",
    enabled = false,
  },
  {
    "altermo/ultimate-autopair.nvim",
    event = "InsertEnter",
    branch = "v0.6", --recommended as each new version will have breaking changes
    opts = {
      -- disable autopair in the command line: https://github.com/altermo/ultimate-autopair.nvim/issues/8
      cmap = false,
      extensions = {
        cond = {
          -- disable in comments
          -- https://github.com/altermo/ultimate-autopair.nvim/blob/6fd0d6aa976a97dd6f1bed4d46be1b437613a52f/Q%26A.md?plain=1#L26
          cond = {
            function(fn) return not fn.in_node "comment" end,
          },
        },
        -- get fly mode working on strings:
        -- https://github.com/altermo/ultimate-autopair.nvim/issues/33
        fly = {
          nofilter = true,
        },
      },
      config_internal_pairs = {
        { '"', '"', fly = true },
        { "'", "'", fly = true },
      },
    },
  },
  dependencies = {
    {
      "AstroNvim/astrocore",
      opts = {
        mappings = {
          n = {
            ["<Leader>ua"] = {
              desc = "Toggle Ultimate Autopair",
              function()
                local notify = require("astrocore").notify
                local function bool2str(bool) return bool and "on" or "off" end
                local ok, ultimate_autopair = pcall(require, "ultimate-autopair")
                if ok then
                  ultimate_autopair.toggle()
                  vim.g.ultimate_autopair_enabled = require("ultimate-autopair.core").disable
                  notify(string.format("ultimate-autopair %s", bool2str(not vim.g.ultimate_autopair_enabled)))
                else
                  notify "ultimate-autopair not available"
                end
              end,
            },
          },
        },
      },
    },
  },
}
