---@type LazySpec
return {
  "laytan/cloak.nvim",
  opts = {},
  event = { "BufReadPre", "BufNewFile" },
  cmd = { "CloakDisable", "CloakEnable", "CloakToggle" },
}
