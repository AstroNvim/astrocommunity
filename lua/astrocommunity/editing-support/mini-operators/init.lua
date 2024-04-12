---@type LazySpec
return {
  "echasnovski/mini.operators",
  keys = function(_, keys)
    local plugin = require("lazy.core.config").spec.plugins["mini.operators"]
    local opts = require("lazy.core.plugin").values(plugin, "opts", false)
    for operator, default in pairs {
      evaluate = "g=",
      exchange = "gx",
      multiply = "gm",
      replace = "gr",
      sort = "gs",
    } do
      local prefix = vim.tbl_get(opts, operator, "prefix") or default
      local line_lhs = prefix .. vim.fn.strcharpart(prefix, vim.fn.strchars(prefix) - 1, 1)
      local name = operator:sub(1, 1):upper() .. operator:sub(2)
      vim.list_extend(keys, {
        { line_lhs, desc = name .. " line" },
        { prefix, desc = name .. " operator" },
        { prefix, mode = "x", desc = name .. " selection" },
      })
    end
  end,
  opts = {},
}
