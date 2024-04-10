---@type LazySpec
return {
  "mbbill/undotree",
  cmd = "UndotreeToggle",
  dependencies = {
    "AstroNvim/astrocore",
    ---@type AstroCoreOpts
    opts = {
      mappings = {
        n = {
          ["<Leader>fu"] = {
            "<cmd>UndotreeToggle<CR>",
            desc = "Find undotree",
          },
        },
      },
    },
  },
}
