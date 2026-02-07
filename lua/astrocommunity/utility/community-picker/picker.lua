local M = {}
local Popup = require("nui.popup")
local Layout = require("nui.layout")
local Input = require("nui.input")
local Tree = require("nui.tree")
local NuiLine = require("nui.line")
local NuiText = require("nui.text")
local scandir = require("plenary.scandir")
local get_icon = require("astroui").get_icon

-- Utility Functions -----------------------------------------------------------

local function get_config_path()
  return vim.fn.stdpath("config") .. "/lua/community.lua"
end

local function is_installed(plugin_name)
  local config_path = get_config_path()
  local lines = vim.fn.readfile(config_path)
  for _, line in ipairs(lines) do
    if line:find('import = "' .. plugin_name .. '"', 1, true) and not line:match("^%s*%-%-") then
      return true
    end
  end
  return false
end

local function add_plugin(plugin_name)
  local config_path = get_config_path()
  local lines = vim.fn.readfile(config_path)
  local new_lines = {}
  local inserted = false

  for i, line in ipairs(lines) do
    if not inserted and line:match("^}$") then
      table.insert(new_lines, string.format('  { import = "%s" },', plugin_name))
      inserted = true
    end
    table.insert(new_lines, line)
  end

  if not inserted then
    table.insert(new_lines, string.format('  { import = "%s" },', plugin_name))
    table.insert(new_lines, "}")
  end

  vim.fn.writefile(new_lines, config_path)
  vim.notify("Added " .. plugin_name, vim.log.levels.INFO)
end

local function remove_plugin(plugin_name)
  local config_path = get_config_path()
  local lines = vim.fn.readfile(config_path)
  local new_lines = {}
  local removed = false

  for _, line in ipairs(lines) do
    if line:find('import = "' .. plugin_name .. '"', 1, true) and not line:match("^%s*%-%-") then
      removed = true
    else
      table.insert(new_lines, line)
    end
  end

  if removed then
    vim.fn.writefile(new_lines, config_path)
    vim.notify("Removed " .. plugin_name, vim.log.levels.INFO)
  else
    vim.notify("Plugin not found", vim.log.levels.WARN)
  end
end

-- Data Logic ------------------------------------------------------------------

local function get_available_plugins()
  local root
  -- Try to find astrocommunity in runtime path
  local paths = vim.api.nvim_get_runtime_file("lua/astrocommunity/init.lua", false)
  if #paths > 0 then
    root = vim.fn.fnamemodify(paths[1], ":h")
  else
    -- Fallback to standard lazy path
    root = vim.fn.stdpath("data") .. "/lazy/astrocommunity/lua/astrocommunity"
  end

  local categories = {}
  
  if vim.fn.isdirectory(root) == 0 then
    vim.notify("Could not find astrocommunity installation at " .. root, vim.log.levels.ERROR)
    return {}, {}
  end

  scandir.scan_dir(root, {
    search_pattern = "%.lua$",
    depth = 5,
    on_insert = function(entry)
      local rel = entry:sub(#root + 2)
      rel = rel:gsub("\\", "/")
      local parts = {}
      for part in rel:gmatch("[^/]+") do table.insert(parts, part) end
      
      local name = ""
      if parts[#parts] == "init.lua" then
        if #parts > 1 then name = table.concat(parts, ".", 1, #parts - 1) end
      else
        local file = parts[#parts]:gsub("%.lua$", "")
        if #parts > 1 then
          name = table.concat(parts, ".", 1, #parts - 1) .. "." .. file
        else
          name = file
        end
      end
      
      if name ~= "" and name ~= "init" and not name:match("^test") then
        local category = parts[1]
        if not categories[category] then categories[category] = {} end
        
        table.insert(categories[category], {
          name = name:sub(#category + 2), -- Strip category from name
          full_path = "astrocommunity." .. name
        })
      end
    end
  })
  
  -- Sort
  local sorted_cats = {}
  for cat, _ in pairs(categories) do table.insert(sorted_cats, cat) end
  table.sort(sorted_cats)
  
  return categories, sorted_cats
end

-- Help Logic ------------------------------------------------------------------

local function show_help_popup()
  local popup = Popup({
    enter = true,
    focusable = true,
    border = {
      style = "rounded",
      text = {
        top = NuiText(" Help ", "Title"),
        top_align = "center",
      },
    },
    position = "50%",
    size = { width = 50, height = 15 },
  })

  popup:mount()

  local lines = {
    " Navigation:",
    "   <C-j> / <Down>   Focus Categories",
    "   <Tab>            Cycle Windows",
    "   h / l            Switch Panes",
    "   j / k            Navigate Lists",
    "   / or i           Search (Input)",
    "",
    " Actions:",
    "   <Space> / <CR>   Toggle Plugin",
    "   a                Add Plugin",
    "   x                Remove Plugin",
    "",
    " General:",
    "   ?                Toggle Help",
    "   q / <Esc>        Close",
  }

  vim.api.nvim_buf_set_lines(popup.bufnr, 0, -1, false, lines)

  popup:map("n", "q", function() popup:unmount() end, { noremap = true })
  popup:map("n", "<Esc>", function() popup:unmount() end, { noremap = true })
  popup:map("n", "?", function() popup:unmount() end, { noremap = true })
end

-- UI Logic --------------------------------------------------------------------

function M.open()
  local all_categories, cat_names = get_available_plugins()
  local current_filter = ""
  
  -- Store initial state of installed plugins to track changes
  local initial_installed_state = {}
  for _, cat in pairs(all_categories) do
    for _, p in ipairs(cat) do
      if is_installed(p.full_path) then
        initial_installed_state[p.full_path] = true
      end
    end
  end
  
  -- 1. Create Layout Components
  local popup = Popup({
    enter = true,
    focusable = true,
    border = { 
      style = "rounded", 
      text = { top = NuiText(" Community Plugins ", "Title") } 
    },
    position = "50%",
    size = { width = "80%", height = "70%" },
  })
  
  local input = Input({
    enter = true,
    border = { 
      style = "rounded", 
      text = { 
        top = NuiText(" Community Plugins ", "Title"), 
        top_align = "center", 
        bottom = NuiText(" ? for Help ", "FloatFooter"), 
        bottom_align = "right" 
      } 
    },
  }, {
    prompt = NuiText(" " .. get_icon("Search", 1, true), "SpecialChar"),
    on_change = function(value)
      current_filter = string.lower(value)
      -- Trigger refresh safely
      if M.refresh_ui then 
        vim.schedule(function() 
          M.refresh_ui() 
        end)
      end
    end,
  })
  
  local left_popup = Popup({
    enter = false,
    focusable = true,
    border = { 
      style = "rounded", 
      text = { top = NuiText(" Categories ", "Title") } 
    },
    win_options = { cursorline = true, winhighlight = "CursorLine:Visual" },
  })
  
  local right_popup = Popup({
    enter = false,
    focusable = true,
    border = { 
      style = "rounded", 
      text = { top = NuiText(" Plugins ", "Title") } 
    },
    win_options = { cursorline = true, winhighlight = "CursorLine:Visual" },
  })

  local layout = Layout(
    {
      position = "50%",
      size = { width = "80%", height = "70%" },
    },
    Layout.Box({
      Layout.Box(input, { size = 3 }),
      Layout.Box({
        Layout.Box(left_popup, { size = "30%" }),
        Layout.Box(right_popup, { size = "70%" }),
      }, { dir = "row", size = "100%" }),
    }, { dir = "col" })
  )
  
  -- 2. Mount Layout
  layout:mount()
  
  -- 3. Create Trees
  local categories_view = Tree({
    winid = left_popup.winid,
    nodes = {},
    prepare_node = function(node)
      return node.text
    end,
  })
  
  local plugins_view = Tree({
    winid = right_popup.winid,
    nodes = {},
    prepare_node = function(node)
      return node.text
    end,
  })
  
  -- Render logic
  M.refresh_ui = function()
    local filtered_cats = {}
    
    -- Filter Categories
    for _, cat in ipairs(cat_names) do
      local lower_cat = string.lower(cat)
      local matches = false
      if current_filter == "" then
        matches = true
      elseif lower_cat:find(current_filter, 1, true) then
        matches = true
      else
        -- Check if any plugin inside matches
        if all_categories[cat] then
          for _, p in ipairs(all_categories[cat]) do
            local lower_plugin = string.lower(p.name)
            if lower_plugin:find(current_filter, 1, true) then
              matches = true
              break
            end
          end
        end
      end
      
      if matches then table.insert(filtered_cats, cat) end
    end
    
    -- Update Categories Tree
    local cat_nodes = {}
    for _, cat in ipairs(filtered_cats) do
      local line = NuiLine()
      line:append("  ") -- Horizontal Padding
      line:append(get_icon("FolderClosed", 1, true), "Directory")
      line:append(cat, "Special") -- Use Special color for Categories
      table.insert(cat_nodes, Tree.Node({ 
        text = line, 
        id = cat 
      }))
    end
    categories_view:set_nodes(cat_nodes)
    categories_view:render()
    
    -- Determine current category from selection
    local node = categories_view:get_node()
    -- If node is nil (list changed significantly), fallback to first item
    local current_cat = node and node.id
    if not current_cat and #filtered_cats > 0 then
      current_cat = filtered_cats[1]
    end
    
    -- Update Plugins Tree
    local plugin_nodes = {}
    if current_cat and all_categories[current_cat] then
      for _, p in ipairs(all_categories[current_cat]) do
        local lower_plugin = string.lower(p.name)
        local lower_cat = string.lower(current_cat)
        
        if current_filter == "" or 
           lower_plugin:find(current_filter, 1, true) or 
           lower_cat:find(current_filter, 1, true) then
          local installed = is_installed(p.full_path)
          local was_installed = initial_installed_state[p.full_path]
          
          -- Determine status for display
          -- Installed: Green (DiagnosticOk)
          -- Removed (Was installed, now not): Red (DiagnosticError)
          -- Available (Not installed, wasn't installed): Neutral (Normal / Comment)
          
          local icon, icon_hl, text_hl
          
          if installed then
            icon = get_icon("GitStaged", 1, true)
            icon_hl = "DiagnosticOk"
            text_hl = "DiagnosticOk"
          elseif was_installed and not installed then
            -- This plugin was just removed
            icon = get_icon("GitUnstaged", 1, true) -- Or "GitDelete" / "X"
            icon_hl = "DiagnosticError"
            text_hl = "DiagnosticError"
          else
            -- Neutral / Available
            icon = get_icon("Package", 1, true)
            icon_hl = "Comment"
            text_hl = "Normal"
          end
          
          local line = NuiLine()
          line:append(icon, icon_hl)
          line:append(p.name, text_hl)
          
          table.insert(plugin_nodes, Tree.Node({
            text = line,
            full_path = p.full_path
          }))
        end
      end
    end
    plugins_view:set_nodes(plugin_nodes)
    plugins_view:render()
  end
  
  M.refresh_ui()
  
  -- Auto-update plugins on category move
  left_popup:on(require("nui.utils.autocmd").event.CursorMoved, function()
    -- Ensure we fetch the node safely after cursor moves
    vim.schedule(function()
       M.refresh_ui()
    end)
  end)

  -- Navigation Helpers
  local function focus_input()
    if input.winid and vim.api.nvim_win_is_valid(input.winid) then
      vim.api.nvim_set_current_win(input.winid)
      vim.cmd("startinsert")
    end
  end
  
  local function focus_cats()
    vim.cmd("stopinsert")
    if left_popup.winid and vim.api.nvim_win_is_valid(left_popup.winid) then
      vim.api.nvim_set_current_win(left_popup.winid)
    end
  end
  
  local function focus_plugins()
    vim.cmd("stopinsert")
    if right_popup.winid and vim.api.nvim_win_is_valid(right_popup.winid) then
      vim.api.nvim_set_current_win(right_popup.winid)
    end
  end

  local function close() 
    layout:unmount() 
  end

  -- Plugin Actions
  local function toggle()
    local node = plugins_view:get_node()
    if node then
      if is_installed(node.full_path) then
        remove_plugin(node.full_path)
      else
        add_plugin(node.full_path)
      end
      vim.schedule(function() M.refresh_ui() end)
    end
  end

  local function safe_toggle()
    local node = plugins_view:get_node()
    if node then toggle() end
  end

  -- KEYMAPS -------------------------------------------------------------------
  
  -- Global (for all buffers in layout)
  local function set_common_keymaps(bufnr)
    local opts = { noremap = true, silent = true, buffer = bufnr }
    vim.keymap.set("n", "<Esc>", close, opts)
    vim.keymap.set("n", "q", close, opts)
    vim.keymap.set("n", "?", show_help_popup, opts)
  end
  
  set_common_keymaps(left_popup.bufnr)
  set_common_keymaps(right_popup.bufnr)
  
  -- Input Specific
  input:map("n", "<Esc>", close, { noremap = true })
  input:map("i", "<C-c>", close, { noremap = true })
  input:map("n", "?", show_help_popup, { noremap = true })
  
  -- Input Navigation
  input:map("i", "<C-j>", focus_cats, { noremap = true })
  input:map("i", "<Down>", focus_cats, { noremap = true })
  input:map("i", "<Tab>", focus_cats, { noremap = true })
  input:map("n", "<Tab>", focus_cats, { noremap = true })

  -- Categories (Left) Navigation
  left_popup:map("n", "l", focus_plugins, { noremap = true })
  left_popup:map("n", "<Right>", focus_plugins, { noremap = true })
  left_popup:map("n", "<Tab>", focus_plugins, { noremap = true })
  
  left_popup:map("n", "i", focus_input, { noremap = true })
  left_popup:map("n", "/", focus_input, { noremap = true })
  
  -- Plugins (Right) Navigation
  right_popup:map("n", "h", focus_cats, { noremap = true })
  right_popup:map("n", "<Left>", focus_cats, { noremap = true })
  right_popup:map("n", "<Tab>", focus_input, { noremap = true })
  right_popup:map("n", "<S-Tab>", focus_cats, { noremap = true })
  
  right_popup:map("n", "i", focus_input, { noremap = true })
  right_popup:map("n", "/", focus_input, { noremap = true })

  -- Plugin Actions
  right_popup:map("n", "<CR>", safe_toggle, { noremap = true })
  right_popup:map("n", "<Space>", safe_toggle, { noremap = true })
  right_popup:map("n", "a", safe_toggle, { noremap = true })
  right_popup:map("n", "x", safe_toggle, { noremap = true })
  
  focus_input()
end

return M
