local function gd_move_handler(source, destination)
  if not vim.fs.root(source, "project.godot") then return end -- only run in godot projects
  local suffix = source:match "%.gd$" and "uid" or "import"
  local tmp_file = ("%s.%s"):format(source, suffix)
  local tmp_stat = vim.uv.fs_stat(tmp_file)

  if tmp_stat then
    -- Rename the temporary file
    local new_tmp_file = ("%s.%s"):format(destination, suffix)
    local success, err = vim.uv.fs_rename(tmp_file, new_tmp_file)
    if not success then
      vim.notify(("Failed to rename Godot file: `%s`\n```\n%s\n```"):format(tmp_file, err or "unknown error"))
    end
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
    opts = {
      event_handlers = {
        {
          event = "file_renamed",
          handler = function(args) gd_move_handler(args.source, args.destination) end,
          id = "godot_renamed_handler",
        },
        {
          event = "file_moved",
          handler = function(args) gd_move_handler(args.source, args.destination) end,
          id = "godot_moved_handler",
        },
      },
      nesting_rules = {
        godot_import = {
          pattern = "^(.*)$",
          files = { -- pretty loose, but is probably a specific enough pattern to be alright
            "%1.import",
          },
        },
        godot_uid = {
          pattern = "^(.*%.gd)$",
          files = {
            "%1.uid",
          },
        },
      },
    },
  },
  {
    "Cretezy/godot-server.nvim",
  },
}
