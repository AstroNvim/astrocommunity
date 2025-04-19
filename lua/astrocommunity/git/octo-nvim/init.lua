return {
  "pwntester/octo.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "AstroNvim/astroui", opts = { icons = { Octo = "" } } },
    {
      "AstroNvim/astrocore",
      opts = function(_, opts)
        local maps = opts.mappings
        local prefix = "<Leader>O"
        maps.n[prefix] = { desc = require("astroui").get_icon("Octo", 1, true) .. "Octo" }
        maps.n[prefix .. "a"] = { desc = "Assignee/Reviewer" }
        maps.n[prefix .. "aa"] = { "<Cmd>Octo assignee add<CR>", desc = "Assign a user" }
        maps.n[prefix .. "ap"] = { "<Cmd>Octo reviewer add<CR>", desc = "Assign a PR reviewer" }
        maps.n[prefix .. "ar"] = { "<Cmd>Octo assignee remove<CR>", desc = "Remove a user" }
        maps.n[prefix .. "c"] = { desc = "Comments" }
        maps.n[prefix .. "ca"] = { "<Cmd>Octo comment add<CR>", desc = "Add a new comment" }
        maps.n[prefix .. "cd"] = { "<Cmd>Octo comment delete<CR>", desc = "Delete a comment" }
        maps.n[prefix .. "e"] = { desc = "Reaction" }
        maps.n[prefix .. "e1"] = { "<Cmd>Octo reaction thumbs_up<CR>", desc = "Add 👍 reaction" }
        maps.n[prefix .. "e2"] = { "<Cmd>Octo reaction thumbs_down<CR>", desc = "Add 👎 reaction" }
        maps.n[prefix .. "e3"] = { "<Cmd>Octo reaction eyes<CR>", desc = "Add 👀 reaction" }
        maps.n[prefix .. "e4"] = { "<Cmd>Octo reaction laugh<CR>", desc = "Add 😄 reaction" }
        maps.n[prefix .. "e5"] = { "<Cmd>Octo reaction confused<CR>", desc = "Add 😕 reaction" }
        maps.n[prefix .. "e6"] = { "<Cmd>Octo reaction rocket<CR>", desc = "Add 🚀 reaction" }
        maps.n[prefix .. "e7"] = { "<Cmd>Octo reaction heart<CR>", desc = "Add ❤️ reaction" }
        maps.n[prefix .. "e8"] = { "<Cmd>Octo reaction party<CR>", desc = "Add 🎉 reaction" }
        maps.n[prefix .. "i"] = { desc = "Issues" }
        maps.n[prefix .. "ic"] = { "<Cmd>Octo issue close<CR>", desc = "Close current issue" }
        maps.n[prefix .. "il"] = { "<Cmd>Octo issue list<CR>", desc = "List open issues" }
        maps.n[prefix .. "io"] = { "<Cmd>Octo issue browser<CR>", desc = "Open current issue in browser" }
        maps.n[prefix .. "ir"] = { "<Cmd>Octo issue reopen<CR>", desc = "Reopen current issue" }
        maps.n[prefix .. "iu"] = { "<Cmd>Octo issue url<CR>", desc = "Copies URL of current issue" }
        maps.n[prefix .. "l"] = { desc = "Label" }
        maps.n[prefix .. "la"] = { "<Cmd>Octo label add<CR>", desc = "Assign a label" }
        maps.n[prefix .. "lc"] = { "<Cmd>Octo label create<CR>", desc = "Create a label" }
        maps.n[prefix .. "lr"] = { "<Cmd>Octo label remove<CR>", desc = "Remove a label" }
        maps.n[prefix .. "p"] = { desc = "Pull requests" }
        maps.n[prefix .. "pc"] = { "<Cmd>Octo pr close<CR>", desc = "Close current PR" }
        maps.n[prefix .. "pd"] = { "<Cmd>Octo pr diff<CR>", desc = "Show PR diff" }
        maps.n[prefix .. "pl"] = { "<Cmd>Octo pr changes<CR>", desc = "List changed files in PR" }
        maps.n[prefix .. "pm"] = { desc = "Merge current PR" }
        maps.n[prefix .. "pmd"] = { "<Cmd>Octo pr merge delete<CR>", desc = "Delete merge PR" }
        maps.n[prefix .. "pmm"] = { "<Cmd>Octo pr merge commit<CR>", desc = "Merge commit PR" }
        maps.n[prefix .. "pmr"] = { "<Cmd>Octo pr merge rebase<CR>", desc = "Rebase merge PR" }
        maps.n[prefix .. "pms"] = { "<Cmd>Octo pr merge squash<CR>", desc = "Squash merge PR" }
        maps.n[prefix .. "pn"] = { "<Cmd>Octo pr create<CR>", desc = "Create PR for current branch" }
        maps.n[prefix .. "po"] = { "<Cmd>Octo pr browser<CR>", desc = "Open current PR in browser" }
        maps.n[prefix .. "pp"] = { "<Cmd>Octo pr checkout<CR>", desc = "Checkout PR" }
        maps.n[prefix .. "pr"] = { "<Cmd>Octo pr ready<CR>", desc = "Mark draft as ready for review" }
        maps.n[prefix .. "ps"] = { "<Cmd>Octo pr list<CR>", desc = "List open PRs" }
        maps.n[prefix .. "pt"] = { "<Cmd>Octo pr commits<CR>", desc = "List PR commits" }
        maps.n[prefix .. "pu"] = { "<Cmd>Octo pr url<CR>", desc = "Copies URL of current PR" }
        maps.n[prefix .. "r"] = { desc = "Repo" }
        maps.n[prefix .. "rf"] = { "<Cmd>Octo repo fork<CR>", desc = "Fork repo" }
        maps.n[prefix .. "rl"] = { "<Cmd>Octo repo list<CR>", desc = "List repo user stats" }
        maps.n[prefix .. "ro"] = { "<Cmd>Octo repo open<CR>", desc = "Open current repo in browser" }
        maps.n[prefix .. "ru"] = { "<Cmd>Octo repo url<CR>", desc = "Copies URL of current repo" }
        maps.n[prefix .. "s"] = { desc = "Review" }
        maps.n[prefix .. "sc"] = { "<Cmd>Octo review close<CR>", desc = "Return to PR" }
        maps.n[prefix .. "sc"] = { "<Cmd>Octo review comments<CR>", desc = "View pending comments" }
        maps.n[prefix .. "sd"] = { "<Cmd>Octo review discard<CR>", desc = "Delete pending review" }
        maps.n[prefix .. "sf"] = { "<Cmd>Octo review submit<CR>", desc = "Submit review" }
        maps.n[prefix .. "sp"] = { "<Cmd>Octo review commit<CR>", desc = "Select commit to review" }
        maps.n[prefix .. "sr"] = { "<Cmd>Octo review resume<CR>", desc = "Resume review" }
        maps.n[prefix .. "ss"] = { "<Cmd>Octo review start<CR>", desc = "Start review" }
        maps.n[prefix .. "t"] = { desc = "Threads" }
        maps.n[prefix .. "ta"] = { "<Cmd>Octo thread resolve<CR>", desc = "Mark thread as resolved" }
        maps.n[prefix .. "td"] = { "<Cmd>Octo thread unresolve<CR>", desc = "Mark thread as unresolved" }
        maps.n[prefix .. "x"] = { "<Cmd>Octo actions<CR>", desc = "Run an action" }
      end,
    },
  },
  specs = {
    {
      "catppuccin",
      optional = true,
      ---@type CatppuccinOptions
      opts = { integrations = { octo = true } },
    },
  },
  cmd = { "Octo" },
  opts = function(_, opts)
    local is_available = require("astrocore").is_available
    opts.use_diagnostic_signs = true
    opts.mappings = {}
    opts.picker = (is_available "telescope.nvim" and "telescope")
      or (is_available "fzf-lua" and "fzf-lua")
      or (is_available "snacks.nvim" and "snacks")
  end,
}
