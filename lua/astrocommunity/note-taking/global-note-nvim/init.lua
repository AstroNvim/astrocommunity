local get_project_name = function()
  local project_name

  local project_directory, err = vim.loop.cwd()
  if not project_directory then
    vim.notify(err, vim.log.levels.WARN)
  else
    project_name = vim.fs.basename(project_directory)
  end

  if not project_name then vim.notify("Unable to get the project name", vim.log.levels.WARN) end

  return project_name
end

return {
  "backdround/global-note.nvim",
  dependencies = {
    { "AstroNvim/astroui", opts = { icons = { Notes = " " } } },
    {
      "AstroNvim/astrocore",
      opts = function(_, opts)
        local maps = opts.mappings
        local prefix = "<Leader>m"

        maps.n[prefix] = { desc = require("astroui").get_icon("Notes", 1, true) .. "Notes" }
        maps.n[prefix .. "m"] = {
          function() require("global-note").toggle_note() end,
          desc = "Toggle global note",
        }
        maps.n[prefix .. "l"] = {
          function() require("global-note").toggle_note "project_local" end,
          desc = "Toggle local note",
        }
      end,
    },
  },
  opts = {
    title = " Global note ",
    additional_presets = {
      project_local = {
        command_name = "ProjectNote",
        filename = function() return get_project_name() .. ".md" end,
        title = function() return " Note for project " .. get_project_name() .. " " end,
      },
    },
  },
}
