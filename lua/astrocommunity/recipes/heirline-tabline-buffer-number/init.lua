return {
  "heirline.nvim",
  opts = function(_, opts)
    -- overwrite https://github.com/AstroNvim/AstroNvim/blob/main/lua/astronvim/plugins/heirline.lua#L114
    local status = require "astroui.status"
    local function my_tabline_file_info()
      local tmp = status.component.tabline_file_info()
      table.insert(tmp, 2, {
        provider = function(self) return self and self.bufnr and self.bufnr or "" end,
        hl = { bold = true, underline = true },
      })
      return tmp
    end
    opts.tabline[2] = status.heirline.make_buflist(my_tabline_file_info())
  end,
}
