return {
  "FabijanZulj/blame.nvim",
  cmd = "BlameToggle",
  config = function(_, opts) require("blame").setup(opts) end,
  dependencies = {
    {
      "AstroNvim/astrocore",
      ---@type AstroCoreOpts
      opts = {
        mappings = {
          n = {
            ["<Leader>gB"] = {
              "<cmd>BlameToggle<cr>",
              desc = "Toggle git blame",
            },
          },
        },
      },
    },
    { -- configure heirline with custom hook to enable winbar for 'blame' filetype
      "rebelot/heirline.nvim",
      optional = true,
      opts = function(_, opts)
        local disable_winbar_cb = vim.tbl_get(opts, "opts", "disable_winbar_cb")
        return require("astrocore").extend_tbl(opts, {
          opts = {
            disable_winbar_cb = function(args)
              if vim.api.nvim_buf_is_valid(args.buf) and vim.bo[args.buf].filetype == "blame" then return false end
              if disable_winbar_cb then return disable_winbar_cb(args) end
            end,
          },
        })
      end,
    },
  },
}
