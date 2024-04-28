local prefix = "<Leader>f"

return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      if opts.ensure_installed ~= "all" then
        opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, { "html" })
      end
    end,
  },
  {
    "luckasRanarison/nvim-devdocs",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    cmd = {
      "DevdocsFetch",
      "DevdocsInstall",
      "DevdocsUninstall",
      "DevdocsOpen",
      "DevdocsOpenFloat",
      "DevdocsUpdate",
      "DevdocsUpdateAll",
      "DevdocsToggle",
    },
    keys = {
      { prefix .. "dd", "<Cmd>DevdocsOpenCurrentFloat<CR>", desc = "Find Devdocs for current file", mode = { "n" } },
      { prefix .. "dt", "<Cmd>DevdocsToggle<CR>", desc = "Toggle last Devdocs item", mode = { "n" } },
      { prefix .. "D", "<Cmd>DevdocsOpenFloat<CR>", desc = "Find Devdocs", mode = { "n" } },
    },
    opts = {
      previewer_cmd = vim.fn.executable "glow" == 1 and "glow" or nil,
      cmd_args = { "-s", "dark", "-w", "80" },
      picker_cmd = true,
      picker_cmd_args = { "-p" },
      filetypes = {
        typescript = { "node", "javascript", "typescript" },
      },
      after_open = function()
        vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<C-\\><C-n>", true, false, true), "n", true)
      end,
    },
  },
}
