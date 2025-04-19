return {
  {
    "AstroNvim/astrocore",
    ---@type AstroCoreOpts
    opts = {
      autocmds = {
        -- disable alpha autostart
        alpha_autostart = false,
        restore_session = {
          {
            event = "VimEnter",
            desc = "Restore previous directory session if neovim opened with no arguments",
            nested = true, -- trigger other autocommands as buffers open
            callback = function()
              -- Logic copied from https://github.com/AstroNvim/AstroNvim/blob/365aa6e083dcd25fa3d1c8a2515d7e71a03d51d3/lua/astronvim/plugins/alpha.lua#L49
              local should_skip
              local lines = vim.api.nvim_buf_get_lines(0, 0, 2, false)
              if
                vim.fn.argc() > 0 -- don't start when opening a file
                or #lines > 1 -- don't open if current buffer has more than 1 line
                or (#lines == 1 and lines[1]:len() > 0) -- don't open the current buffer if it has anything on the first line
                or #vim.tbl_filter(function(bufnr) return vim.bo[bufnr].buflisted end, vim.api.nvim_list_bufs()) > 1 -- don't open if any listed buffers
                or not vim.o.modifiable -- don't open if not modifiable
              then
                should_skip = true
              else
                for _, arg in pairs(vim.v.argv) do
                  if arg == "-b" or arg == "-c" or vim.startswith(arg, "+") or arg == "-S" then
                    should_skip = true
                    break
                  end
                end
              end
              if should_skip then return end
              -- if possible, load session
              if not pcall(function() require("resession").load(vim.fn.getcwd(), { dir = "dirsession" }) end) then
                local is_available = require("astrocore").is_available
                if is_available "alpha-nvim" then
                  -- if session was not loaded, if possible, load alpha
                  require("lazy").load { plugins = { "alpha-nvim" } }
                  if pcall(function() require("alpha").start(true) end) then
                    vim.schedule(function() vim.cmd.doautocmd "FileType" end)
                  end
                elseif is_available "snacks.nvim" then
                  -- if session was not loaded, if possible, load Snacks dashboard
                  if pcall(function() require("snacks").dashboard() end) then
                    vim.schedule(function() vim.cmd.doautocmd "FileType" end)
                  end
                end
              end
            end,
          },
        },
      },
    },
  },
}
