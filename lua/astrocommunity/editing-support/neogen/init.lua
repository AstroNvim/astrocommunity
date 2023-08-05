local prefix = "<leader>a"
local maps = { n = {} }
local icon = vim.g.icons_enabled and "󰷉 " or ""
maps.n[prefix] = { desc = icon .. "Annotation" }
require("astronvim.utils").set_mappings(maps)
return {
  "danymat/neogen",
  cmd = "Neogen",
  opts = {
    snippet_engine = "luasnip",
    languages = {
      lua = { template = { annotation_convention = "ldoc" } },
      typescript = { template = { annotation_convention = "tsdoc" } },
      typescriptreact = { template = { annotation_convention = "tsdoc" } },
    },
  },
  keys = {
    { prefix .. "<cr>", function() require("neogen").generate { type = "current" } end, desc = "Current" },
    { prefix .. "c", function() require("neogen").generate { type = "class" } end, desc = "Class" },
    { prefix .. "f", function() require("neogen").generate { type = "func" } end, desc = "Function" },
    { prefix .. "t", function() require("neogen").generate { type = "type" } end, desc = "Type" },
    { prefix .. "F", function() require("neogen").generate { type = "file" } end, desc = "File" },
  },
}
