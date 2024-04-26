return {
  "anuvyklack/hydra.nvim",
  event = "VeryLazy",
  config = function(_, opts)
    local Hydra = require "hydra"
    for name, hydra in pairs(opts) do
      if hydra then
        if not hydra.name then hydra.name = name end
        hydra.hydra = Hydra(hydra)
      end
    end
  end,
}
