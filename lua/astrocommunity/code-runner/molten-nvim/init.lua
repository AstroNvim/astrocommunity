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
  version = "^1", -- use version <2.0.0 to avoid breaking changes
  build = ":UpdateRemotePlugins",
  dependencies = {
    "AstroNvim/astrocore",
    opts = function(_, opts)
      if not opts.mappings then opts.mappings = {} end
      local prefix = "<leader>m"

      opts.mappings.n[prefix .. "mi"] = { "<Cmd>MoltenInit<CR>", desc = "Initialize the plugin" }
      opts.mappings.n[prefix .. "e"] = { "<Cmd>MoltenEvaluateOperator<CR>", desc = "Run operator selection" }
      opts.mappings.n[prefix .. "rl"] = { "<Cmd>MoltenEvaluateLine<CR>", desc = "Evaluate line" }
      opts.mappings.n[prefix .. "rr"] = { "<Cmd>MoltenReevaluateCell<CR>", desc = "Re-evaluate cell" }
      opts.mappings.v[prefix .. "r"] = { ":<C-u>MoltenEvaluateVisual<CR>gv", desc = "Evaluate visual selection" }
    end,
  },
}
