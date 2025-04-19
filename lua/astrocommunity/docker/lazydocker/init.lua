---@type LazySpec
return {
  {
    "mgierada/lazydocker.nvim",
    lazy = true,
    dependencies = {
      "akinsho/toggleterm.nvim",
      {
        "AstroNvim/astrocore",
        opts = function(_, opts)
          local maps = opts.mappings

          -- INFO: Default prefix of toggleterm-related actions
          local prefix = "<Leader>t"

          maps.n[prefix .. "d"] = {
            function() require("lazydocker").open() end,
            desc = "ToggleTerm LazyDocker",
          }
        end,
      },
    },
  },
}
