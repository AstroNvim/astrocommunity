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
}
