---@type LazySpec
return {
  "andersevenrud/nvim_context_vt",
  event = "User AstroFile",
  cmd = { "NvimContextVtToggle" },
  dependencies = {
    "AstroNvim/astrocore",
    ---@type AstroCoreOpts
    opts = {
      mappings = {
        n = {
          ["<Leader>uv"] = {
            function() require("nvim_context_vt").toggle_context() end,
            desc = "Toggle virtual text context",
          },
        },
      },
    },
  },
}
