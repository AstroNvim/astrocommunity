return {
  {
    "stevearc/oil.nvim",
    cmd = "Oil",
    dependencies = {
      {
        "AstroNvim/astrocore",
        opts = {
          mappings = {
            n = {
              ["<Leader>O"] = { function() require("oil").open() end, desc = "Open folder in Oil" },
            },
          },
          autocmds = {
            oil_settings = {
              {
                event = "FileType",
                desc = "Disable view saving for oil buffers",
                pattern = "oil",
                callback = function(args) vim.b[args.buf].view_activated = false end,
              },
            },
          },
        },
      },
    },
    opts = {},
  },
  {
    "rebelot/heirline.nvim",
    optional = true,
    opts = function(_, opts)
      local status = require "astroui.status"
      local is_oil = function(bufnr) return status.condition.buffer_matches({ filetype = "^oil$" }, bufnr) end
      local disable_winbar_cb = opts.opts.disable_winbar_cb
      opts.opts.disable_winbar_cb = function(args)
        if is_oil(args.buf) then return false end
        return disable_winbar_cb(args)
      end

      if opts.winbar then
        table.insert(opts.winbar, 1, {
          condition = function(self) return is_oil(self.bufnr) end,
          status.component.separated_path {
            padding = { left = 2 },
            max_depth = false,
            suffix = false,
            path_func = function() return require("oil").get_current_dir() end,
          },
        })
      end
    end,
  },
}
