return {
  {
    "pwntester/octo.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
      "nvim-tree/nvim-web-devicons",
      { "AstroNvim/astroui", opts = { icons = { Octo = "" } } },
      {
        "AstroNvim/astrocore",
        opts = function(_, opts)
          local maps = opts.mappings
          local prefix = "<Leader>O"
          maps.n[prefix] = { desc = require("astroui").get_icon("Octo", 1, true) .. "Octo" }
          maps.n[prefix .. "a"] = { desc = "Assignee/Reviewer" }
          maps.n[prefix .. "aa"] = { "<CMD>Octo assignee add<CR>", desc = "Assign a user" }
          maps.n[prefix .. "ap"] = { "<CMD>Octo reviewer add<CR>", desc = "Assign a PR reviewer" }
          maps.n[prefix .. "ar"] = { "<CMD>Octo assignee remove<CR>", desc = "Remove a user" }
          maps.n[prefix .. "c"] = { desc = "Comments" }
          maps.n[prefix .. "ca"] = { "<CMD>Octo comment add<CR>", desc = "Add a new comment" }
          maps.n[prefix .. "cd"] = { "<CMD>Octo comment delete<CR>", desc = "Delete a comment" }
          maps.n[prefix .. "e"] = { desc = "Reaction" }
          maps.n[prefix .. "e1"] = { "<CMD>Octo reaction thumbs_up<CR>", desc = "Add 👍 reaction" }
          maps.n[prefix .. "e2"] = { "<CMD>Octo reaction thumbs_down<CR>", desc = "Add 👎 reaction" }
          maps.n[prefix .. "e3"] = { "<CMD>Octo reaction eyes<CR>", desc = "Add 👀 reaction" }
          maps.n[prefix .. "e4"] = { "<CMD>Octo reaction laugh<CR>", desc = "Add 😄 reaction" }
          maps.n[prefix .. "e5"] = { "<CMD>Octo reaction confused<CR>", desc = "Add 😕 reaction" }
          maps.n[prefix .. "e6"] = { "<CMD>Octo reaction rocket<CR>", desc = "Add 🚀 reaction" }
          maps.n[prefix .. "e7"] = { "<CMD>Octo reaction heart<CR>", desc = "Add ❤️ reaction" }
          maps.n[prefix .. "e8"] = { "<CMD>Octo reaction party<CR>", desc = "Add 🎉 reaction" }
          maps.n[prefix .. "i"] = { desc = "Issues" }
          maps.n[prefix .. "ic"] = { "<CMD>Octo issue close<CR>", desc = "Close current issue" }
          maps.n[prefix .. "il"] = { "<CMD>Octo issue list<CR>", desc = "List open issues" }
          maps.n[prefix .. "io"] = { "<CMD>Octo issue browser<CR>", desc = "Open current issue in browser" }
          maps.n[prefix .. "ir"] = { "<CMD>Octo issue reopen<CR>", desc = "Reopen current issue" }
          maps.n[prefix .. "iu"] = { "<CMD>Octo issue url<CR>", desc = "Copies URL of current issue" }
          maps.n[prefix .. "l"] = { desc = "Label" }
          maps.n[prefix .. "la"] = { "<CMD>Octo label add<CR>", desc = "Assign a label" }
          maps.n[prefix .. "lc"] = { "<CMD>Octo label create<CR>", desc = "Create a label" }
          maps.n[prefix .. "lr"] = { "<CMD>Octo label remove<CR>", desc = "Remove a label" }
          maps.n[prefix .. "p"] = { desc = "Pull requests" }
          maps.n[prefix .. "pc"] = { "<CMD>Octo pr close<CR>", desc = "Close current PR" }
          maps.n[prefix .. "pd"] = { "<CMD>Octo pr diff<CR>", desc = "Show PR diff" }
          maps.n[prefix .. "pl"] = { "<CMD>Octo pr commits<CR>", desc = "List changed files in PR" }
          maps.n[prefix .. "pm"] = { desc = "Merge current PR" }
          maps.n[prefix .. "pmd"] = { "<CMD>Octo pr merge delete<CR>", desc = "Delete merge PR" }
          maps.n[prefix .. "pmm"] = { "<CMD>Octo pr merge commit<CR>", desc = "Merge commit PR" }
          maps.n[prefix .. "pmr"] = { "<CMD>Octo pr merge rebase<CR>", desc = "Rebase merge PR" }
          maps.n[prefix .. "pms"] = { "<CMD>Octo pr merge squash<CR>", desc = "Squash merge PR" }
          maps.n[prefix .. "pn"] = { "<CMD>Octo pr create<CR>", desc = "Create PR for current branch" }
          maps.n[prefix .. "po"] = { "<CMD>Octo pr browser<CR>", desc = "Open current PR in browser" }
          maps.n[prefix .. "pp"] = { "<CMD>Octo pr checkout<CR>", desc = "Checkout PR" }
          maps.n[prefix .. "pr"] = { "<CMD>Octo pr ready<CR>", desc = "Mark draft as ready for review" }
          maps.n[prefix .. "ps"] = { "<CMD>Octo pr list<CR>", desc = "List open PRs" }
          maps.n[prefix .. "pt"] = { "<CMD>Octo pr commits<CR>", desc = "List PR commits" }
          maps.n[prefix .. "pu"] = { "<CMD>Octo pr url<CR>", desc = "Copies URL of current PR" }
          maps.n[prefix .. "r"] = { desc = "Repo" }
          maps.n[prefix .. "rf"] = { "<CMD>Octo repo fork<CR>", desc = "Fork repo" }
          maps.n[prefix .. "rl"] = { "<CMD>Octo repo list<CR>", desc = "List repo user stats" }
          maps.n[prefix .. "ro"] = { "<CMD>Octo repo open<CR>", desc = "Open current repo in browser" }
          maps.n[prefix .. "ru"] = { "<CMD>Octo repo url<CR>", desc = "Copies URL of current repo" }
          maps.n[prefix .. "s"] = { desc = "Review" }
          maps.n[prefix .. "sc"] = { "<CMD>Octo review close<CR>", desc = "Return to PR" }
          maps.n[prefix .. "sc"] = { "<CMD>Octo review comments<CR>", desc = "View pending comments" }
          maps.n[prefix .. "sd"] = { "<CMD>Octo review discard<CR>", desc = "Delete pending review" }
          maps.n[prefix .. "sf"] = { "<CMD>Octo review submit<CR>", desc = "Submit review" }
          maps.n[prefix .. "sp"] = { "<CMD>Octo review commit<CR>", desc = "Select commit to review" }
          maps.n[prefix .. "sr"] = { "<CMD>Octo review resume<CR>", desc = "Resume review" }
          maps.n[prefix .. "ss"] = { "<CMD>Octo review start<CR>", desc = "Start review" }
          maps.n[prefix .. "t"] = { desc = "Threads" }
          maps.n[prefix .. "ta"] = { "<CMD>Octo thread resolve<CR>", desc = "Mark thread as resolved" }
          maps.n[prefix .. "td"] = { "<CMD>Octo thread unresolve<CR>", desc = "Mark thread as unresolved" }
          maps.n[prefix .. "x"] = { "<CMD>Octo actions<CR>", desc = "Run an action" }
        end,
      },
    },
    cmd = { "Octo" },
    opts = {
      use_diagnostic_signs = true,
      mappings = {},
    },
  },
  {
    "catppuccin/nvim",
    optional = true,
    opts = { integrations = { octo = true } },
  },
}
