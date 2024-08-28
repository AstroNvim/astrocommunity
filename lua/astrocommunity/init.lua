-- Development utilities for AstroCommunity
local M = {}

--- Add a new string or function into a potentially existing filetype detection
---@param default string The default filetype to check for when checking to fallback
---@param old_ft vim.filetype.mapping.value? The old filetype detection
---@param new_ft vim.filetype.mapping.value THe new filetype detection prat
---@return vim.filetype.mapping.value
function M.merge_filetype(default, old_ft, new_ft)
  local priority -- store maximum priority of the two filetype mapping values
  if type(old_ft) == "table" then
    priority = old_ft[2].priority
    old_ft = old_ft[1]
  end
  if type(new_ft) == "table" then
    if not priority or priority < new_ft[2].priority then priority = new_ft[2].priority end
    new_ft = new_ft[1]
  end

  local out
  if old_ft == nil then
    -- if no old filetype, then just return the new filetype
    out = new_ft
  elseif type(old_ft) == "string" then
    if type(new_ft) == "string" then
      -- if old_ft and new_ft are both strings, only apply the new filetype
      out = new_ft
    else
      -- if the old filetype is a string and the new filetype is a function
      -- use the string as the new default
      out = function(...)
        local ft, pre_ft = new_ft(...)
        if not ft or ft == default then
          ft, pre_ft = old_ft, nil
        end
        return ft, pre_ft
      end
    end
  else
    if type(new_ft) == "function" then
      -- if old filetype and new filetype are both functions
      -- use the old function as the fallback
      out = function(...)
        local ft, pre_ft = new_ft(...)
        if not ft or ft == default then
          ft, pre_ft = old_ft(...)
        end
        return ft, pre_ft
      end
    else
      -- if the old filetype is a function and the new filetype is a string
      -- use the new filetype as the fallback to the old filetype
      out = function(...)
        local ft, pre_ft = old_ft(...)
        if not ft or ft == default then
          ft, pre_ft = new_ft, nil
        end
        return ft, pre_ft
      end
    end
  end
  -- add the priority if necessary
  return priority and { out, { priority = priority } } or out
end

return M
