return {
  "akinsho/bufferline.nvim",
  dependencies = {
    { import = "astrocommunity.recipes.disable-tabline" }, -- dependency before loading rest of the spec
    {
      "AstroNvim/astrocore",
      opts = {
        options = { opt = { showtabline = 2 } },
        mappings = {
          n = {
            ["]b"] = { function() require("bufferline.commands").cycle(vim.v.count1) end, desc = "Next buffer" },
            ["[b"] = { function() require("bufferline.commands").cycle(-vim.v.count1) end, desc = "Previous buffer" },
            [">b"] = {
              function() require("bufferline.commands").move(vim.v.count1) end,
              desc = "Move buffer tab right",
            },
            ["<b"] = {
              function() require("bufferline.commands").move(-vim.v.count1) end,
              desc = "Move buffer tab left",
            },
            ["<Leader>bb"] = {
              function() require("bufferline.commands").pick() end,
              desc = "Navigate to buffer tab with interactive picker",
            },
            ["<Leader>bc"] = {
              function() require("bufferline.commands").close_others() end,
              desc = "Close all buffers except the current",
            },
            ["<Leader>bd"] = {
              function() require("bufferline.commands").close_with_pick() end,
              desc = "Delete a buffer tab with interactive picker",
            },
            ["<Leader>bl"] = {
              function() require("bufferline.commands").close_in_direction "left" end,
              desc = "Close all buffers to the left of the current",
            },
            ["<Leader>br"] = {
              function() require("bufferline.commands").close_in_direction "right" end,
              desc = "Close all buffers to the right of the current",
            },
            ["<Leader>bp"] = { "<Cmd>BufferLineTogglePin<CR>", desc = "Toggle pin buffer" },
            ["<Leader>bse"] = {
              function() require("bufferline.commands").sort_by "extension" end,
              desc = "Sort buffers by extension",
            },
            ["<Leader>bsi"] = {
              function() require("bufferline.commands").sort_by "id" end,
              desc = "Sort buffers by buffer number",
            },
            ["<Leader>bsm"] = {
              function()
                require("bufferline.commands").sort_by(function(a, b) return a.modified and not b.modified end)
              end,
              desc = "Sort buffers by last modification",
            },
            ["<Leader>bsp"] = {
              function() require("bufferline.commands").sort_by "directory" end,
              desc = "Sort buffers by directory",
            },
            ["<Leader>bsr"] = {
              function() require("bufferline.commands").sort_by "relative_directory" end,
              desc = "Sort buffers by relative directory",
            },
            ["<Leader>b\\"] = {
              function()
                require("bufferline.pick").choose_then(function(id)
                  vim.cmd "split"
                  vim.cmd("buffer " .. id)
                end)
              end,
              desc = "Open a buffer tab in a new horizontal split with interactive picker",
            },
            ["<Leader>b|"] = {
              function()
                require("bufferline.pick").choose_then(function(id)
                  vim.cmd "vsplit"
                  vim.cmd("buffer " .. id)
                end)
              end,
              desc = "Open a buffer tab in a new vertical split with interactive picker",
            },
          },
        },
      },
    },
  },
  event = "VeryLazy",
  opts = {
    options = {
      offsets = {
        {
          filetype = "neo-tree",
          text = "Neo-tree",
          highlight = "Directory",
          text_align = "left",
        },
      },
    },
  },
}
