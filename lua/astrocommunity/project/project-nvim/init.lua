return {
  {
    "jay-babu/project.nvim",
    name = "project_nvim",
    event = "VeryLazy",
    opts = { ignore_lsp = { "lua_ls" } },
  },
  {
    "nvim-telescope/telescope.nvim",
    optional = true,
    dependencies = { "project_nvim" },
    opts = function() require("telescope").load_extension "projects" end,
  },
}
