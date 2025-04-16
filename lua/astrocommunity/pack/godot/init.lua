local paths_to_check = { "/", "/../", "/../../" }
local function is_godot_project()
  local cwd = vim.fn.getcwd()

  for _, value in ipairs(paths_to_check) do
    if vim.uv.fs_stat(cwd .. value .. "project.godot") then return true end
  end
end

local function move_handler(source, destination)
  -- Check if corresponding .uid file exists
  local uid_file = source .. ".uid"
  local uid_stat = vim.uv.fs_stat(uid_file)

  if uid_stat then
    -- Rename the uid file
    local new_uid_file = destination .. ".uid"
    local success, err = vim.uv.fs_rename(uid_file, new_uid_file)
    if not success then vim.notify("Failed to rename Godot UID file: " .. (err or "unknown error")) end
  end

  -- Check if corresponding .import file exists
  local import_file = source .. ".import"
  local import_stat = vim.uv.fs_stat(import_file)

  if import_stat then
    -- Rename the import file
    local new_import_file = destination .. ".import"
    local success, err = vim.uv.fs_rename(import_file, new_import_file)
    if not success then vim.notify("Failed to rename Godot import file: " .. (err or "unknown error")) end
  end
end

return {
  {
    "AstroNvim/astrocore",
    ---@type AstroCoreOpts
    opts = { filetypes = { extension = { gdshaderinc = "gdshaderinc" } } },
  },
  {
    "QuickGD/quickgd.nvim",
    ft = { "gdshader", "gdshaderinc" },
    cmd = { "GodotRun", "GodotRunLast", "GodotStart" },
    config = true,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    optional = true,
    opts = function(_, opts)
      if opts.ensure_installed ~= "all" then
        opts.ensure_installed =
          require("astrocore").list_insert_unique(opts.ensure_installed, { "gdscript", "glsl", "godot_resource" })
      end
    end,
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    optional = true,
    opts = function(_, opts)
      -- Only activate renaming and filtering within Godot projects
      if not is_godot_project() then return end

      -- Add renaming Godot UID/import files without require LSP to run
      opts.event_handlers = opts.event_handlers or {}
      table.insert(opts.event_handlers, {
        event = "file_renamed",
        handler = function(args) move_handler(args.source, args.destination) end,
      })
      table.insert(opts.event_handlers, {
        event = "file_moved",
        handler = function(args) move_handler(args.source, args.destination) end,
      })

      -- Add Godot UID/import files to the filter list
      opts.filesystem = opts.filesystem or {}
      opts.filesystem.filtered_items = opts.filesystem.filtered_items or {}
      opts.filesystem.filtered_items.hide_by_pattern = opts.filesystem.filtered_items.hide_by_pattern or {}
      table.insert(opts.filesystem.filtered_items.hide_by_pattern, "*.uid")
      table.insert(opts.filesystem.filtered_items.hide_by_pattern, "*.import")
    end,
  },
  {
    "Cretezy/godot-server.nvim",
  },
}
