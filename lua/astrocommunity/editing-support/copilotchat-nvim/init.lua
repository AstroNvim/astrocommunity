---@type LazySpec
return {
  "CopilotC-Nvim/CopilotChat.nvim",
  branch = "canary",
  cmd = {
    "CopilotChat",
    "CopilotChatOpen",
    "CopilotChatClose",
    "CopilotChatToggle",
    "CopilotChatStop",
    "CopilotChatReset",
    "CopilotChatSave",
    "CopilotChatLoad",
    "CopilotChatDebugInfo",
    "CopilotChatModels",
    "CopilotChatExplain",
    "CopilotChatReview",
    "CopilotChatFix",
    "CopilotChatOptimize",
    "CopilotChatDocs",
    "CopilotChatFixDiagnostic",
    "CopilotChatCommit",
    "CopilotChatCommitStaged",
  },
  dependencies = {
    { "zbirenbaum/copilot.lua" },
    { "nvim-lua/plenary.nvim" },
    {
      "AstroNvim/astrocore",
      ---@param opts AstroCoreOpts
      opts = function(_, opts)
        local maps = assert(opts.mappings)

        local prefix = "<Leader>A"
        maps.n[prefix] = { desc = require("astroui").get_icon("CopilotChat", 1, true) .. "CopilotChat" }
        maps.v[prefix] = { desc = require("astroui").get_icon("CopilotChat", 1, true) .. "CopilotChat" }

        maps.n[prefix .. "x"] = { ":CopilotChatExplain<CR>", desc = "Explain" }
        maps.v[prefix .. "x"] = { ":CopilotChatExplain<CR>", desc = "Explain" }

        maps.n[prefix .. "r"] = { ":CopilotChatReview<CR>", desc = "Review" }
        maps.v[prefix .. "r"] = { ":CopilotChatReview<CR>", desc = "Review" }

        maps.n[prefix .. "f"] = { ":CopilotChatFix<CR>", desc = "Fix" }
        maps.v[prefix .. "f"] = { ":CopilotChatFix<CR>", desc = "Fix" }

        maps.n[prefix .. "o"] = { ":CopilotChatOptimize<CR>", desc = "Optimize" }
        maps.v[prefix .. "o"] = { ":CopilotChatOptimize<CR>", desc = "Optimize" }

        maps.n[prefix .. "t"] = { ":CopilotChatDocs<CR>", desc = "Tests" }
        maps.v[prefix .. "t"] = { ":CopilotChatDocs<CR>", desc = "Tests" }

        maps.n[prefix .. "d"] = { ":CopilotChatFixDiagnostic<CR>", desc = "Diagnostic" }
        maps.v[prefix .. "d"] = { ":CopilotChatFixDiagnostic<CR>", desc = "Diagnostic" }

        maps.n[prefix .. "c"] = { ":CopilotChatCommit<CR>", desc = "Commit Message" }
        maps.v[prefix .. "c"] = { ":CopilotChatCommit<CR>", desc = "Commit Message" }

        maps.n[prefix .. "C"] = { ":CopilotChatCommitStaged<CR>", desc = "Commitizen Convention Commit Message" }
        maps.v[prefix .. "C"] = { ":CopilotChatCommitStaged<CR>", desc = "Commitizen Convention Commit Message" }
      end,
    },
    { "AstroNvim/astroui", opts = { icons = { CopilotChat = "" } } },
  },
  opts = {},
}
