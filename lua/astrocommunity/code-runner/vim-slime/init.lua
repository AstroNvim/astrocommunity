return {
  "jpalardy/vim-slime",
  cmd = { "SlimeConfig", "SlimeSend", "SlimeSend0", "SlimeSend1", "SlimeSendCurrentLine" },
  keys = {
    "<Plug>SlimeConfig",
    "<Plug>SlimeLineSend",
    "<Plug>SlimeMotionSend",
    "<Plug>SlimeParagraphSend",
    "<Plug>SlimeSendCell",
    { "<Plug>SlimeRegionSend", mode = { "n", "x" } },
  },
  dependencies = {
    {
      "AstroNvim/astrocore",
      ---@param opts AstroCoreOpts
      opts = function(_, opts)
        if not opts.options then opts.options = {} end
        if not opts.options.g then opts.options.g = {} end

        -- automatically detect target
        local term = vim.trim((vim.env.TERM_PROGRAM or ""):lower())
        if term == "tmux" then
          opts.options.g.slime_target = "tmux"
        elseif vim.env.STY ~= nil then
          opts.options.g.slime_target = "screen"
        elseif term == "wezterm" then
          opts.options.g.slime_target = "wezterm"
        elseif vim.env.KITTY_LISTEN_ON ~= nil then
          opts.options.g.slime_target = "kitty"
        else
          opts.options.g.slime_target = "neovim"
        end
        -- More target detection could be added here

        -- disable mappings
        opts.options.g.slime_no_mappings = true

        -- leader menu prefix
        local prefix = "<Leader>r"
        -- function to detect if slime cells are configured and fail nicely
        local send_cell = function()
          if vim.g.slime_cell_delimiter or vim.b.slime_cell_delimiter then
            return "<Plug>SlimeSendCell"
          else
            return "<cmd>lua vim.notify('No slime cell configured')<CR>"
          end
        end

        -- add mappings manually for lazy loading and `<Leader>` based menu
        if not opts.mappings then opts.mappings = { n = {}, x = {} } end
        opts.mappings.n[prefix] = { desc = require("astroui").get_icon("Terminal", 1, true) .. "REPL" }
        opts.mappings.n[prefix .. "r"] = { "<Plug>SlimeMotionSend", desc = "Send text object to REPL" }
        opts.mappings.n[prefix .. "c"] = { send_cell, expr = true, desc = "Send cell to REPL" }
        opts.mappings.n[prefix .. "C"] = { send_cell, expr = true, desc = "Send cell to REPL and go to next" }
        opts.mappings.n[prefix .. "p"] = { "<Plug>SlimeParagraphSend", desc = "Send paragraph to REPL" }
        opts.mappings.n[prefix .. "l"] = { "<Plug>SlimeLineSend", desc = "Send line to REPL" }
        opts.mappings.n[prefix .. "<CR>"] = { "<Cmd>SlimeConfig<CR>", desc = "Configure REPL" }
        -- add default vim-slime mappings
        opts.mappings.n["<C-C>"] = { "<Plug>SlimeMotionSend", desc = "Send to REPL" }
        opts.mappings.n["<C-C>v"] = { "<Plug>SlimeConfig", desc = "Configure REPL" }
        opts.mappings.n["<C-C><C-C>"] = { "<Plug>SlimeParagraphSend", desc = "Send paragraph to REPL" }
        opts.mappings.x["<C-C><C-C>"] = { "<Plug>SlimeRegionSend", desc = "Send region to REPL" }

        if not opts.autocmds then opts.autocmds = {} end
        opts.autocmds.slime_cells = {
          { -- configure slime cells for markdown
            event = "FileType",
            pattern = "markdown",
            callback = function(args) vim.b[args.buf].slime_cell_delimiter = "^\\s*```" end,
          },
          -- more filetype and cell configuration could be added here
        }
      end,
    },
  },
}
