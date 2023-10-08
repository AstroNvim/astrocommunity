return {
  {
    "jay-babu/project.nvim",
    main = "project_nvim",
    event = "VeryLazy",
    opts = { ignore_lsp = { "lua_ls" } },
  },
  {
    "nvim-telescope/telescope.nvim",
    optional = true,
    dependencies = { "jay-babu/project.nvim" },
    opts = function() require("telescope").load_extension "projects" end,
  },
}
