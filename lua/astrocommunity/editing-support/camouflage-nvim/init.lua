---@type LazySpec
return {
  "zeybek/camouflage.nvim",
  event = { "BufReadPre", "BufNewFile" },
  cmd = {
    "CamouflageToggle",
    "CamouflageReveal",
    "CamouflageYank",
    "CamouflageFollowCursor",
    "CamouflagePresent",
    "CamouflageShield",
    "CamouflageShieldPassword",
    "CamouflageAudit",
    "CamouflageStatus",
    "CamouflageInit",
    "CamouflageRegisters",
  },
  opts = {},
}
