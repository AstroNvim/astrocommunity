return {
  {
    "AstroNvim/astrocore",
    ---@type AstroCoreOpts
    opts = { filetypes = { extension = { gdshaderinc = "gdshaderinc" } } },
  },
  {
    "AstroNvim/astrolsp",
    ---@type AstroLSPOpts
    opts = { servers = { "gdscript" } },
  },
  {
    "mfussenegger/nvim-dap",
    opts = function()
      local dap = require "dap"
      dap.adapters.godot = {
        type = "server",
        host = "127.0.0.1",
        port = vim.env.GDScript_Debug_Port or 6006,
      }
      dap.configurations.gdscript = {
        {
          type = "godot",
          request = "launch",
          name = "Launch scene",
          project = "${workspaceFolder}",
          launch_scene = true,
        },
      }
    end,
  },
  {
    "QuickGD/quickgd.nvim",
    ft = { "gdshader", "gdshaderinc" },
    cmd = { "GodotRun", "GodotRunLast", "GodotStart" },
    opts = function(_, opts)
      local is_available = require("astrocore").is_available
      opts.cmp = is_available "nvim-cmp" or is_available "blink.cmp"
      opts.telescope = is_available "telescope.nvim"
      opts.treesitter = is_available "nvim-treesitter"
    end,
    specs = {
      {
        "hrsh7th/nvim-cmp",
        optional = true,
        opts = {
          sources = { { name = "quickgd", priority = 750 } },
        },
      },
      {
        "Saghen/blink.cmp",
        optional = true,
        dependencies = "QuickGD/quickgd.nvim",
        specs = { "Saghen/blink.compat", version = "*", lazy = true, opts = {} },
        opts = {
          sources = {
            default = { "quickgd" },
            providers = {
              quickgd = { name = "quickgd", module = "blink.compat.source", score_offset = 1 },
            },
          },
        },
      },
    },
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
}
