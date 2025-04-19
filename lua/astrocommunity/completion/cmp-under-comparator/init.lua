local function list_index(t, value)
  for i, v in ipairs(t) do
    if v == value then return i end
  end
  return nil
end

---@type LazySpec
return {
  "hrsh7th/nvim-cmp",
  optional = true,
  dependencies = { "lukas-reineke/cmp-under-comparator", lazy = true },
  opts = function(_, opts)
    local cmp = require "cmp"
    opts.sorting = opts.sorting or {}
    -- If comparators is not set, use the default. get_config() has defaults now.
    opts.sorting.comparators = opts.sorting.comparators or cmp.get_config().sorting.comparators
    -- Find element in comparators we will position ourselves after.
    -- Position after recently_used, fallback to after score, fallback to 4th position.
    -- recently_used was not in nvim-cmp some time ago.
    local pos = vim.F.if_nil(
      list_index(opts.sorting.comparators, cmp.config.compare.recently_used),
      list_index(opts.sorting.comparators, cmp.config.compare.score),
      3
    )
    table.insert(opts.sorting.comparators, pos + 1, require("cmp-under-comparator").under)
  end,
}
