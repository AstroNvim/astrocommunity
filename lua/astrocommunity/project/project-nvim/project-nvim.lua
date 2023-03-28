return {
  "ahmedkhalf/project.nvim",
  event = "VeryLazy",
  dependencies = "nvim-telescope/telescope.nvim",
  opts = { ignore_lsp = { "lua_ls" } },
  config = function(_, opts)
    require("project_nvim").setup(opts)
    require("telescope").load_extension "projects"
  end,
}
