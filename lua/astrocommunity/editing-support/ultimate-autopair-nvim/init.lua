return {
  {
    "AstroNvim/astrocore",
    opts = {
      mappings = {
        ["<leader>ua"] = {
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
    keys = {
      {
        "<leader>ua",
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
        desc = "Toggle ultimate-autopair",
      },
    },
  },
}
