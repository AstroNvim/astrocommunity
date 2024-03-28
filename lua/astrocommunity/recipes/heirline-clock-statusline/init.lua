return {
  "rebelot/heirline.nvim",
  dependencies = {
    "AstroNvim/astroui",
    ---@type AstroUIOpts
    opts = {
      icons = {
        Clock = "", -- add icon for clock
      },
    },
  },
  opts = function(_, opts)
    local status = require "astroui.status"

    -- add time to last mode indicator
    opts.statusline[#opts.statusline] = status.component.builder {
      {
        provider = function()
          local time = os.date "%H:%M" -- show hour and minute in 24 hour format
          ---@cast time string
          return status.utils.stylize(time, {
            icon = { kind = "Clock", padding = { right = 1 } }, -- add icon
            padding = { right = 1 }, -- pad the right side
          })
        end,
      },
      update = { "ModeChanged", pattern = "*:*", callback = vim.schedule_wrap(function() vim.cmd.redrawstatus() end) },
      hl = status.hl.get_attributes "mode", -- highlight based on mode attributes
      surround = { separator = "right", color = status.hl.mode_bg }, -- background highlight based on mode
      init = status.init.update_events {
        { "User", pattern = "UpdateTime", callback = vim.schedule_wrap(function() vim.cmd.redrawstatus() end) },
      },
    }

    local uv = vim.uv or vim.loop
    uv.new_timer():start( -- timer for updating the time
      (60 - tonumber(os.date "%S")) * 1000, -- offset timer based on current seconds past the minute
      60000, -- update every 60 seconds
      vim.schedule_wrap(function() vim.api.nvim_exec_autocmds("User", { pattern = "UpdateTime", modeline = false }) end)
    )
  end,
}
