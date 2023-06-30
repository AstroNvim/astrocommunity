return {
  {
    "windwp/nvim-autopairs",
    enabled = false,
  },
  {
    "altermo/ultimate-autopair.nvim",
    event = "InsertEnter",
    opts = {
      -- disable autopair in the command line: https://github.com/altermo/ultimate-autopair.nvim/issues/8
      cmap = false,
      extensions = {
        rules = {
          rules = {
            {
              "call",
              function(o)
                -- disable in comments including markdown style
                local status, node = pcall(vim.treesitter.get_node, { pos = { o.linenr - 1, o.col - 2 } })
                return o.incmd
                  or o.col == 1
                  or not status
                  or not node
                  or node:type() ~= "comment" and node:type() ~= "html_block"
              end,
            },
          },
        },
        -- get fly mode working on strings: https://github.com/altermo/ultimate-autopair.nvim/issues/33
        fly = {
          nofilter = true,
        },
      },
      config_internal_pairs = {
        { '"', '"', fly = true },
        { "'", "'", fly = true },
      },
    },
    keys = {
      {
        "<leader>ua",
        function()
          local notify = require("astronvim.utils").notify
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
        desc = "Toggle ultimate-autopair",
      },
    },
  },
}
