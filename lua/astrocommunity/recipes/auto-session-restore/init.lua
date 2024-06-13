local read_from_stdin = false
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
            event = "StdinReadPost",
            desc = "Check if we are reading from stdin",
            nested = true,
            callback = function() read_from_stdin = true end,
          },
          {
            event = "VimEnter",
            desc = "Restore previous directory session if neovim opened with no arguments",
            nested = true, -- trigger other autocommands as buffers open
            callback = function()
              -- Only load the session if nvim was started with no args
              if not read_from_stdin and vim.fn.argc(-1) == 0 then
                -- try to load a directory session using the current working directory
                require("resession").load(vim.fn.getcwd(), { dir = "dirsession", silence_errors = true })
              end
            end,
          },
        },
      },
    },
  },
}
