if vim.g.astrocommunity_picker_enabled == false then return end

local function load_picker()
  -- Check for nui.nvim dependency
  if not pcall(require, "nui.popup") then
    vim.notify("astrocommunity.picker requires nui.nvim to be installed", vim.log.levels.ERROR)
    return
  end

  local status_ok, picker = pcall(require, "astrocommunity.picker")
  if not status_ok then
    vim.notify("Failed to load astrocommunity picker: " .. picker, vim.log.levels.ERROR)
    return
  end
  picker.open()
end

-- Register mapping via AstroCore if available, otherwise native fallback
local has_astrocore, astrocore = pcall(require, "astrocore")
if has_astrocore then
  astrocore.set_mappings({
    n = {
      ["<Leader>pc"] = { load_picker, desc = "Community Plugins" },
    },
  })
else
  vim.keymap.set("n", "<Leader>pc", load_picker, { desc = "Community Plugins" })
end

-- Create user command
vim.api.nvim_create_user_command("AstroCommunity", load_picker, { desc = "Open AstroCommunity Picker" })
