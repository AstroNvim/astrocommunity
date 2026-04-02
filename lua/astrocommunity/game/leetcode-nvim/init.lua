---@type LazySpec
return {
  "kawre/leetcode.nvim",
  cmd = "Leet",
  dependencies = {
    { "nvim-telescope/telescope.nvim" },
    { "nvim-lua/plenary.nvim" }, -- required by telescope
    { "MunifTanjim/nui.nvim" },

    -- optional
    { "rcarriga/nvim-notify", optional = true },
    {
      "AstroNvim/astrocore",
      ---@type AstroCoreOpts
      opts = {
        treesitter = { ensure_installed = { "html" } },
        autocmds = {
          leetcode_autostart = {
            {
              event = "VimEnter",
              desc = "Start leetcode.nvim on startup",
              nested = true,
              callback = function()
                if vim.fn.argc() ~= 1 then return end -- return if more than one argument given
                local arg = vim.tbl_get(require("astrocore").plugin_opts "leetcode.nvim", "arg") or "leetcode.nvim"
                if vim.fn.argv()[1] ~= arg then return end -- return if argument doesn't match trigger
                local lines = vim.api.nvim_buf_get_lines(0, 0, -1, true)
                if #lines > 1 or (#lines == 1 and lines[1]:len() > 0) then return end -- return if buffer is non-empty
                require("leetcode").start(true)
              end,
            },
          },
        },
      },
    },
  },
  opts = {},
}
