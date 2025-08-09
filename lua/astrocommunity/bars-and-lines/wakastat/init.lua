return {
  {
    "fiqryq/wakastat.nvim",
    event = "VeryLazy",
    cmd = { "WakastatRefresh", "WakastatStatus" },
    opts = {
      args = { "--today" }, -- or "--week", "--month"
      format = "Today Coding Time: %s", -- %s replaced with time
      update_interval = 300, -- seconds between updates
      enable_timer = true,
    },
    config = function(_, opts) require("wakastat").setup(opts) end,

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
