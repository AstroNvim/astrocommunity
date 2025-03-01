return {
  "yarospace/lua-console.nvim",
  lazy = true,
  specs = {
    {
      "AstroNvim/astrocore",
      ---@type AstroCoreOpts
      opts = {
        mappings = {
          n = {
            ["`"] = { function() require("lua-console").toggle_console() end, desc = "Lua-console - toggle" },
            ["<Leader>`"] = {
              function() require("lua-console.utils").attach_toggle() end,
              desc = "Lua-console - attach to buffer",
            },
          },
        },
      },
    },
  },
  keys = {
    { "`", desc = "Lua-console - toggle" },
    { "<Leader>`", desc = "Lua-console - attach to buffer" },
  },
  opts = {},
}
