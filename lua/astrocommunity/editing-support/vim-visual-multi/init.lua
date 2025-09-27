---@type LazySpec
return {
  "mg979/vim-visual-multi",
  event = { "User AstroFile", "InsertEnter" },
  dependencies = {
    { "AstroNvim/astroui", opts = { icons = { VimVisualMulti = "󰗧" } } },
    {
      "AstroNvim/astrocore",
      ---@param opts AstroCoreOpts
      opts = function(_, opts)
        if not opts.options then opts.options = {} end
        if not opts.options.g then opts.options.g = {} end
        -- Prevent overlapping with astrocore horizontal split key
        opts.options.g.VM_leader = opts.options.g.VM_leader or "<leader>m"
        opts.options.g.VM_silent_exit = 1
        opts.options.g.VM_show_warnings = 0

        if not opts.autocmds then opts.autocmds = {} end
        opts.autocmds.visual_multi_mappings = {
          {
            event = "User",
            pattern = "visual_multi_mappings",
            desc = "p and P to paste from system clipboard",
            callback = function()
              -- Remap p and P to paste (from + or * register) because `opt.clipboard = "unnamedplus"` in astrocore
              -- Source: https://github.com/mg979/vim-visual-multi/issues/116
              if vim.tbl_contains(vim.opt.clipboard:get(), "unnamedplus") then
                vim.keymap.set("n", "p", '"+<Plug>(VM-p-Paste)', { buffer = true })
                vim.keymap.set("n", "P", '"+<Plug>(VM-P-Paste)', { buffer = true })
              elseif vim.tbl_contains(vim.opt.clipboard:get(), "unnamed") then
                vim.keymap.set("n", "p", '"*<Plug>(VM-p-Paste)', { buffer = true })
                vim.keymap.set("n", "P", '"*<Plug>(VM-P-Paste)', { buffer = true })
              end
            end,
          },
        }

        -- Remap <cr> to fix enter to select in blink
        -- Source: https://github.com/Saghen/blink.cmp/issues/406#issuecomment-2537184121
        -- Check this if you use VM_custom_motions: https://github.com/Saghen/blink.cmp/issues/406#issuecomment-3239199356
        opts.options.g.VM_maps = {
          ["I BS"] = "",
          ["Goto Next"] = "]v",
          ["Goto Prev"] = "[v",
          ["I CtrlB"] = "<M-b>",
          ["I CtrlF"] = "<M-f>",
          ["I Return"] = "<S-CR>",
          ["I Down Arrow"] = "",
          ["I Up Arrow"] = "",
        }

        if not opts.mappings then opts.mappings = require("astrocore").empty_map_table() end
        local maps = assert(opts.mappings)
        local leader = opts.options.g.VM_leader
        maps.n[leader] = { desc = require("astroui").get_icon("VimVisualMulti", 1, true) .. "Multi cursors" }
        maps.n[leader .. "A"] = { desc = "Select all occurrences word under cursor" }
        maps.n[leader .. "/"] = { desc = "Start regex search" }
        maps.n[leader .. "\\"] = { desc = "Add a single cursor at current position" }
        maps.n[leader .. "gS"] = { desc = "Reselect last visual selection" }
        maps.n["<C-up>"] = { "<C-u>call vm#commands#add_cursor_up(0, v:count1)<cr>", desc = "Add cursor above" }
        maps.n["<C-down>"] = { "<C-u>call vm#commands#add_cursor_down(0, v:count1)<cr>", desc = "Add cursor below" }

        maps.v[leader] = { desc = require("astroui").get_icon("VimVisualMulti", 1, true) .. "Multi cursors" }
        maps.v[leader .. "a"] = { desc = "Convert a visual selection to a VM selection" }
        maps.v[leader .. "a"] = { desc = "Convert a visual selection to a VM selection" }
        maps.v[leader .. "A"] = { desc = "Select all occurrences of selection text" }
        maps.v[leader .. "c"] = { desc = "Add cursors downwards from start of visual block" }
        maps.v[leader .. "/"] = { desc = "Start regex search within selected text" }
      end,
    },
  },
}
