local M = {}

function M.list_insert_unique(tbl, vals)
  if type(vals) ~= "table" then vals = { vals } end
  for _, val in ipairs(vals) do
    if not vim.tbl_contains(tbl, val) then table.insert(tbl, val) end
  end
end

return M
