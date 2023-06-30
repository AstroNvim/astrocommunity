return {
  {
    "windwp/nvim-autopairs",
    enabled = false,
  },
  {
    "altermo/ultimate-autopair.nvim",
    event = "InsertEnter",
    opts = {
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
        -- get fly mode working on strings: https://github.com/altermo/ultimate-autopair.nvim/issues/17
        fly = {
          nofilter = true,
        },
      },
      { '"', '"', fly = true, p = 11 },
      { "'", "'", fly = true, p = 11 },
    },
    keys = {
      {
        "<leader>ua",
        function() require("ultimate-autopair").toggle() end,
        desc = "Toggle ultimate-autopair",
      },
    },
  },
}
