return {
  {
    "fiqryq/wakastat.nvim",
    event = "VeryLazy",
    cmd = { "WakastatRefresh", "WakastatStatus" },
    opts = {},
    specs = {
      {
        "rebelot/heirline.nvim",
        optional = true,
        opts = function(_, opts)
          opts.statusline = opts.statusline or {}
          table.insert(opts.statusline, 5, { -- insert at position 5
            provider = function() return " " .. require("wakastat").status() .. " " end,
            hl = "Wakastat",
            update = { "User", pattern = "WakastatUpdated" },
          })
        end,
      },
    },
  },
}
