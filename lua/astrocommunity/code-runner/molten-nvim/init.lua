---@type LazySpec
return {
  "benlubas/molten-nvim",
  cmd = {
    "MoltenInfo",
    "MoltenInit",
    "MoltenDein",
    "MoltenGoto",
    "MoltenNext",
    "MoltenPrev",
    "MoltenEvaluateLine",
    "MoltenEvaluateVisual",
    "MoltenEvaluateOperator",
    "MoltenEvaluateArgument",
    "MoltenReevaluateCell",
    "MoltenDelete",
    "MoltenShowOutput",
    "MoltenHideOutput",
    "MoltenEnterOutput",
    "MoltenInterrupt",
    "MoltenOpenInBrowser",
    "MoltenImagePopup",
    "MoltenRestart",
    "MoltenSave",
    "MoltenLoad",
    "MoltenExportOutput",
    "MoltenImportOutput",
  },
  version = "^1.0.0", -- use version <2.0.0 to avoid breaking changes
  build = ":UpdateRemotePlugins",
  specs = {
    {
      "3rd/image.nvim",
      optional = true,
    },
  },
}
