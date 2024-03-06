local g = vim.g
if g.neovide == nil then return {} end

---@param scale_factor number
---@return number
local function clamp_scale_factor(scale_factor)
  return math.max(math.min(scale_factor, g["neovide_max_scale_factor"]), g["neovide_min_scale_factor"])
end

---@param scale_factor number
---@param clamp? boolean
---@return nil
local function set_scale_factor(scale_factor, clamp)
  if clamp then scale_factor = clamp_scale_factor(scale_factor) end
  g["neovide_scale_factor"] = scale_factor
end

---@return nil
local function reset_scale_factor() g["neovide_scale_factor"] = g["neovide_initial_scale_factor"] end

---@param increment number
---@param clamp? boolean
---@return nil
local change_scale_factor = function(increment, clamp)
  local new_scale = g["neovide_scale_factor"] + increment
  set_scale_factor(new_scale, clamp)
end

---@type LazySpec
return {
  {
    "AstroNvim/astrocore",
    ---@param opts AstroCoreOpts
    opts = function(_, opts)
      local neovide_scale_factor = (opts.options.opt_global and opts.options.opt_global["neovide_scale_factor"])
        or (opts.options.g and opts.options.g["neovide_scale_factor"])
        or g["neovide_scale_factor"]
        or 1

      local options = {
        g = {
          neovide_change_scale_factor = g["neovide_change_scale_factor"] or 0.1,
          neovide_min_scale_factor = g["neovide_min_scale_factor"] or 0.7,
          neovide_max_scale_factor = g["neovide_max_scale_factor"] or 2.0,
          neovide_initial_scale_factor = neovide_scale_factor,
          neovide_scale_factor = neovide_scale_factor,
        },
      }

      local commands = {
        ["NeovideSetScaleFactor"] = {
          function(event)
            local scale_factor = tonumber(event.fargs[1])
            local option = event.fargs[2]

            if scale_factor == nil then
              vim.notify(
                "Error: scale factor argument is nil or not a valid number.",
                vim.log.levels.ERROR,
                { title = "Recipe: neovide" }
              )
              return
            end

            set_scale_factor(scale_factor, option ~= "force")
          end,
          nargs = "+",
        },
        ["NeovideResetScaleFactor"] = {
          reset_scale_factor,
        },
      }

      local mappings = {
        n = {
          ["<C-=>"] = {
            function() change_scale_factor(g["neovide_change_scale_factor"], true) end,
            desc = "Neovide increase scale",
          },
          ["<C-->"] = {
            function() change_scale_factor(-g["neovide_change_scale_factor"], true) end,
            desc = "Neovide decrease scale",
          },
          ["<C-0>"] = {
            reset_scale_factor,
            desc = "Neovide reset scale",
          },
        },
      }

      return vim.tbl_deep_extend("force", opts, {
        options = options,
        mappings = mappings,
        commands = commands,
      } --[[@as AstroCoreOpts]])
    end,
  },
}
