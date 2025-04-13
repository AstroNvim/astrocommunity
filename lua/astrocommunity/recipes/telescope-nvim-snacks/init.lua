return {
  "nvim-telescope/telescope.nvim",
  specs = {
    { "nvim-lua/plenary.nvim", lazy = true },
  },
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      lazy = true,
      enabled = vim.fn.executable "make" == 1 or vim.fn.executable "cmake" == 1,
      build = vim.fn.executable "make" == 1 and "make"
        or "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
      config = function(plugin)
        local astrocore = require "astrocore"
        astrocore.on_load("telescope.nvim", function()
          local ok, err = pcall(require("telescope").load_extension, "fzf")
          if not ok then
            local lib = plugin.dir .. "/build/libfzf." .. (vim.fn.has "win32" == 1 and "dll" or "so")
            if not (vim.uv or vim.loop).fs_stat(lib) then
              astrocore.notify("`telescope-fzf-native.nvim` not built. Rebuilding...", vim.log.levels.WARN)
              require("lazy").build({ plugins = { plugin }, show = false }):wait(
                function() astrocore.notify "Rebuilding `telescope-fzf-native.nvim` done.\nPlease restart Neovim." end
              )
            else
              astrocore.notify("Failed to load `telescope-fzf-native.nvim`:\n" .. err, vim.log.levels.ERROR)
            end
          end
        end)
      end,
    },
  },
  cmd = "Telescope",
  opts = function(_, opts)
    local actions, get_icon = require "telescope.actions", require("astroui").get_icon
    local function open_selected(prompt_bufnr)
      local picker = require("telescope.actions.state").get_current_picker(prompt_bufnr)
      local selected = picker:get_multi_selection()
      if vim.tbl_isempty(selected) then
        actions.select_default(prompt_bufnr)
      else
        actions.close(prompt_bufnr)
        for _, file in pairs(selected) do
          if file.path then vim.cmd("edit" .. (file.lnum and " +" .. file.lnum or "") .. " " .. file.path) end
        end
      end
    end
    local function open_all(prompt_bufnr)
      actions.select_all(prompt_bufnr)
      open_selected(prompt_bufnr)
    end

    local is_available = require("astrocore").is_available
    local telescope = require "telescope"
    if is_available "nvim-notify" then telescope.load_extension "notify" end
    if is_available "aerial.nvim" then telescope.load_extension "aerial" end
    return require("astrocore").extend_tbl(opts, {
      defaults = {
        file_ignore_patterns = { "^%.git[/\\]", "[/\\]%.git[/\\]" },
        git_worktrees = require("astrocore").config.git_worktrees,
        prompt_prefix = get_icon("Selected", 1),
        selection_caret = get_icon("Selected", 1),
        multi_icon = get_icon("Selected", 1),
        path_display = { "truncate" },
        sorting_strategy = "ascending",
        layout_config = {
          horizontal = { prompt_position = "top", preview_width = 0.55 },
          vertical = { mirror = false },
          width = 0.87,
          height = 0.80,
          preview_cutoff = 120,
        },
        mappings = {
          i = {
            ["<C-J>"] = actions.move_selection_next,
            ["<C-K>"] = actions.move_selection_previous,
            ["<CR>"] = open_selected,
            ["<M-CR>"] = open_all,
          },
          n = {
            q = actions.close,
            ["<CR>"] = open_selected,
            ["<M-CR>"] = open_all,
          },
        },
      },
    })
  end,
}
