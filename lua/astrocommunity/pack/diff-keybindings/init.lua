return {
  {
    "AstroNvim/astrocore",
    ---@param opts AstroCoreOpts
    opts = function(_, opts)
      local mappings = assert(opts.mappings)

      local prefix = "<Leader>D"
      mappings.n[prefix] = { desc = require("astroui").get_icon("Diff", 1, true) .. "Diff" }
      mappings.n[prefix .. "v"] = { "<cmd>vert diffsplit<cr>", desc = " Vertical split diff" }
      mappings.n[prefix .. "h"] = { "<cmd>diffsplit<cr>", desc = " Horizontal split diff" }
      mappings.n[prefix .. "t"] = { "<cmd>diffthis<cr>", desc = " Diff this" }
      mappings.n[prefix .. "p"] = { "<cmd>diffpatch<cr>", desc = " Patch diff" }
      mappings.n[prefix .. "u"] = { "<cmd>diffupdate<cr>", desc = "󰚰 Update diff" }
      mappings.n[prefix .. "g"] = { "<cmd>diffget<cr>", desc = " Get diff" }
      mappings.n[prefix .. "P"] = { "<cmd>diffput<cr>", desc = " Put diff" }
      mappings.n[prefix .. "q"] = { "<cmd>diffoff<cr>", desc = "󰘪 Stop diff" }
      mappings.n[prefix .. "?"] = { "<cmd>h diff<cr>", desc = "󰋗 Help" }
    end,
  },
  { "AstroNvim/astroui", opts = { icons = { Diff = "" } } },
}
