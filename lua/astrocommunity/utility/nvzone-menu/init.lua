-- 1. Helper function to generate the Neo-tree menu on demand
local function get_neotree_menu()
  -- These requires load code from the installed neo-tree plugin

  local manager = require "neo-tree.sources.manager"
  local cc = require "neo-tree.sources.common.commands"

  -- Get neo-tree state.
  local function get_state()
    local state = manager.get_state_for_window()
    assert(state)
    state.config = state.config or {}
    return state
  end

  -- Call arbitrary neo-tree action.
  local function call(what)
    return vim.schedule_wrap(function()
      local state = get_state()
      local cb = require("neo-tree.sources." .. state.name .. ".commands")[what] or cc[what]
      cb(state)
    end)
  end

  -- Copy path to clipboard.
  local function copy_path(how)
    return function()
      local node = get_state().tree:get_node()
      if node.type == "message" then return end
      vim.fn.setreg('"', vim.fn.fnamemodify(node.path, how))
      vim.fn.setreg("+", vim.fn.fnamemodify(node.path, how))
    end
  end

  return {
    -- NAVIGATION
    { name = "  Open in window", cmd = call "open", rtxt = "o" },
    { name = "  Open in vertical split", cmd = call "open_vsplit", rtxt = "v" },
    { name = "  Open in horizontal split", cmd = call "open_split", rtxt = "s" },
    { name = "󰓪  Open in new tab", cmd = call "open_tabnew", rtxt = "O" },
    { name = "separator" },
    -- FILE ACTIONS
    { name = "  New file", cmd = call "add", rtxt = "a" },
    { name = "  New folder", cmd = call "add_directory", rtxt = "A" },
    { name = "  Delete", hl = "ExRed", cmd = call "delete", rtxt = "d" },
    { name = "   File details", cmd = call "show_file_details", rtxt = "i" },
    { name = "  Rename", cmd = call "rename", rtxt = "r" },
    { name = "  Rename basename", cmd = call "rename", rtxt = "b" },
    { name = "  Copy", cmd = call "copy_to_clipboard", rtxt = "y" },
    { name = "  Cut", cmd = call "cut_to_clipboard", rtxt = "x" },
    { name = "  Paste", cmd = call "paste_from_clipboard", rtxt = "p" },
    { name = "separator" },
    -- VIEW CHANGES
    { name = "Toggle hidden", cmd = call "toggle_hidden", rtxt = "H" },
    { name = "Refresh", cmd = call "refresh", rtxt = "R" },
    
    -- FILTER
    { name = "Fuzzy finder", cmd = call "fuzzy_finder", rtxt = "/" },
    { name = "Fuzzy finder directory", cmd = call "fuzzy_finder_directory", rtxt = "D" },
    { name = "Fuzzy sorter", cmd = call "fuzzy_sorter", rtxt = "#" },
    { name = "separator" },
    -- others
    { name = "󰴠  Copy absolute path", cmd = copy_path ":p", rtxt = "gy" },
    { name = "  Copy relative path", cmd = copy_path ":~:.", rtxt = "Y" },
    
    { name = "separator" },
    { name = "󰋗 More Commands", cmd = call "show_help", rtxt = "?" },
  }
end

-- 2. Define the Main Menu options (General usage)
local my_main_menu = {
  {
    name = "Format Buffer",
    cmd = function()
      local ok, conform = pcall(require, "conform")
      if ok then
        conform.format { lsp_fallback = true }
      else
        vim.lsp.buf.format()
      end
    end,
    rtxt = "<leader>lf",
  },
  {
    name = "Code Actions",
    cmd = vim.lsp.buf.code_action,
    rtxt = "<leader>la",
  },
  { name = "separator" },
  {
    name = "  Lsp Actions",
    hl = "Exblue",
    items = "lsp",
  },
  { name = "separator" },
  {
    name = "Edit Config",
    cmd = function()
      vim.cmd "tabnew"
      local conf = vim.fn.stdpath "config"
      vim.cmd("tcd " .. conf .. " | e lua/lazy_setup.lua")
    end,
    rtxt = "ed",
  },
  {
    name = "Copy Content",
    cmd = "%y+",
    rtxt = "<C-c>",
  },
  {
    name = "Delete Content",
    cmd = "%d",
    rtxt = "dc",
  },
  { name = "separator" },
  {
    name = "  Open in terminal",
    hl = "ExRed",
    cmd = function()
      local old_buf = require("menu.state").old_data.buf
      local old_bufname = vim.api.nvim_buf_get_name(old_buf)
      local old_buf_dir = vim.fn.fnamemodify(old_bufname, ":h")
      local cmd = "cd " .. old_buf_dir

     
      vim.cmd "enew"
      vim.fn.termopen { vim.o.shell, "-c", cmd .. " ; " .. vim.o.shell }
    end,
  },
  { name = "separator" },
  {
    name = "  Color Picker",
    cmd = function() require("minty.huefy").open() end,
  },
}

-- 3. Plugin Specification
return {
  -- Import dependencies via lazy
  { "nvzone/volt", lazy = true },

  {
    "nvzone/minty",
    cmd = { "Shades", "Huefy" },
  },

  { "nvim-neo-tree/neo-tree.nvim", lazy = true },

  -- Menu Configuration
  {
    "nvzone/menu",
    lazy = true,
    keys = {
      {
        "<C-t>",
        function() require("menu").open(my_main_menu) end,
        desc = "Open UI Menu",
      },
      {
        "<RightMouse>",
        function()
          vim.cmd.exec '"normal! \\<RightMouse>"'
          local ft = vim.bo.ft

          if ft == "neo-tree" then
            -- Generate the menu using the functions defined above
            local neo_tree_menu = get_neotree_menu()
            require("menu").open(neo_tree_menu, { mouse = true, border = true })
          else
            require("menu").open(my_main_menu, { mouse = true, border = true })
          end
        end,
        desc = "Open Context Menu",
      },
    },
  },
}
