return {
  "heirline.nvim",
  specs = {
    {
      "AstroNvim/astroui",
      ---@type AstroUIOpts
      opts = {
        status = {
          attributes = {
            bufnr = { bold = true, underline = true },
          },
        },
      },
    },
  },
  opts = function(_, opts)
    -- overwrite https://github.com/AstroNvim/AstroNvim/blob/main/lua/astronvim/plugins/heirline.lua#L114
    local status = require "astroui.status"

    opts.tabline[2] = status.heirline.make_buflist(
      status.component.tabline_file_info { bufnr = { hl = status.hl.get_attributes "bufnr" } }
    )
  end,
}
