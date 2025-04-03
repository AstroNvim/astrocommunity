local og_virt_text
local og_virt_line
return {
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  opts = {
    features = {
      diagnostics = true,
    },
    diagnostics = {
      virtual_text = true,
      virtual_lines = { current_line = true },
      underline = true,
      update_in_insert = false,
    },
    autocmds = {
      diagnostic_only_virtlines = {
        {
          event = { "CursorMoved", "DiagnosticChanged" },
          callback = function()
            if not require("astrocore.buffer").is_valid() then return end
            if og_virt_line == nil then og_virt_line = vim.diagnostic.config().virtual_lines end

            -- ignore if virtual_lines.current_line is disabled
            if not (og_virt_line and og_virt_line.current_line) then
              if og_virt_text then
                vim.diagnostic.config { virtual_text = og_virt_text }
                og_virt_text = nil
              end
              return
            end

            if og_virt_text == nil then og_virt_text = vim.diagnostic.config().virtual_text end

            local lnum = vim.api.nvim_win_get_cursor(0)[1] - 1

            if vim.tbl_isempty(vim.diagnostic.get(0, { lnum = lnum })) then
              vim.diagnostic.config { virtual_text = og_virt_text }
            else
              vim.diagnostic.config { virtual_text = false }
            end
          end,
        },
        {
          event = "ModeChanged",
          callback = function()
            if require("astrocore.buffer").is_valid() then pcall(vim.diagnostic.show) end
          end,
        },
      },
    },
  },
}
