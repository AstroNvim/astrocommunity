return {
  { "nvzone/volt", lazy = true },
  {
    "nvzone/minty",
    cmd = { "Shades", "Huefy" },
  },
  {
    "nvzone/menu",
    lazy = true,
    keys = {
      {
        "<RightMouse>",
        function()
          vim.cmd.exec '"normal! \\<RightMouse>"'

          local function get_neotree_menu()
            local ok_manager, manager = pcall(require, "neo-tree.sources.manager")
            local ok_cc, cc = pcall(require, "neo-tree.sources.common.commands")
            if not ok_manager or not ok_cc then return nil end

            local state = manager.get_state_for_window()
            if not state then return nil end
            state.config = state.config or {}

            local function call(what)
              return vim.schedule_wrap(function()
                local s = manager.get_state_for_window()
                if not s then return end
                s.config = s.config or {}
                local cb = require("neo-tree.sources." .. s.name .. ".commands")[what] or cc[what]
                if cb then cb(s) end
              end)
            end

            local function copy_path(how)
              return function()
                local node = state.tree:get_node()
                if not node or node.type == "message" then return end
                vim.fn.setreg('"', vim.fn.fnamemodify(node.path, how))
                vim.fn.setreg("+", vim.fn.fnamemodify(node.path, how))
              end
            end

            return {
              { name = "  Open", cmd = call "open", rtxt = "o" },
              { name = "  Vertical split", cmd = call "open_vsplit", rtxt = "v" },
              { name = "  Horizontal split", cmd = call "open_split", rtxt = "s" },
              { name = "󰓪  New tab", cmd = call "open_tabnew", rtxt = "O" },
              { name = "separator" },
              { name = "  New file", cmd = call "add", rtxt = "a" },
              { name = "  New folder", cmd = call "add_directory", rtxt = "A" },
              { name = "  Delete", hl = "ExRed", cmd = call "delete", rtxt = "d" },
              { name = "   Details", cmd = call "show_file_details", rtxt = "i" },
              { name = "  Rename", cmd = call "rename", rtxt = "r" },
              { name = "  Copy", cmd = call "copy_to_clipboard", rtxt = "y" },
              { name = "  Cut", cmd = call "cut_to_clipboard", rtxt = "x" },
              { name = "  Paste", cmd = call "paste_from_clipboard", rtxt = "p" },
              { name = "separator" },
              { name = "Toggle hidden", cmd = call "toggle_hidden", rtxt = "H" },
              { name = "Refresh", cmd = call "refresh", rtxt = "R" },
              { name = "Fuzzy finder", cmd = call "fuzzy_finder", rtxt = "/" },
              { name = "separator" },
              { name = "󰴠  Copy absolute path", cmd = copy_path ":p", rtxt = "gy" },
              { name = "  Copy relative path", cmd = copy_path ":~:.", rtxt = "Y" },
              { name = "separator" },
              { name = "󰋗  Help", cmd = call "show_help", rtxt = "?" },
            }
          end

          local function get_main_menu()
            return {
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
                rtxt = "<Leader>lf",
              },
              { name = "Code Actions", cmd = vim.lsp.buf.code_action, rtxt = "<Leader>la" },
              { name = "separator" },
              { name = "  Lsp Actions", hl = "Exblue", items = "lsp" },
              { name = "separator" },
              { name = "  Color Picker", cmd = function() require("minty.huefy").open() end },
            }
          end

          if vim.bo.ft == "neo-tree" then
            local menu = get_neotree_menu()
            if menu then
              require("menu").open(menu, { mouse = true, border = true })
              return
            end
          end
          require("menu").open(get_main_menu(), { mouse = true, border = true })
        end,
        desc = "Open context menu",
      },
    },
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    optional = true,
  },
}
