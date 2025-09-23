local menu = "<Leader>D"
return {
  {
    "AstroNvim/astrocore",
    ---@type AstroCoreOpts
    opts = {
      mappings = {
        n = {
          [menu] = { desc = "  Diff" },
          [menu .. "v"] = { "<cmd>vert diffsplit<cr>", desc = "  Vertical split diff" },
          [menu .. "h"] = { "<cmd>diffsplit<cr>", desc = "  Horizontal split diff" },
          [menu .. "t"] = { "<cmd>diffthis<cr>", desc = "  Diff this" },
          [menu .. "p"] = { "<cmd>diffpatch<cr>", desc = "  Patch diff" },
          [menu .. "u"] = { "<cmd>diffupdate<cr>", desc = "󰚰  Update diff" },
          [menu .. "g"] = { "<cmd>diffget<cr>", desc = "  Get diff" },
          [menu .. "P"] = { "<cmd>diffput<cr>", desc = "  Put diff" },
          [menu .. "q"] = { "<cmd>diffoff<cr>", desc = "󰘪  Stop diff" },
          [menu .. "?"] = { "<cmd>h diff<cr>", desc = "󰋗  Help" },
        },
      },
    },
  },
}
