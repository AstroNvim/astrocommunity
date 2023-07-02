return {
  {
    "jay-babu/project.nvim",
    event = "VeryLazy",
    opts = { ignore_lsp = { "lua_ls" } },
    config = function(_, opts) require("project_nvim").setup(opts) end,
  },
  { "nvim-telescope/telescope.nvim", opts = function() require("telescope").load_extension "projects" end },
}
