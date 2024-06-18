return {
  "jackMort/ChatGPT.nvim",
  cmd = { "ChatGPT", "ChatGPTActAs", "ChatGPTEditWithInstructions", "ChatGPTRun" },
  dependencies = {
    {
      "AstroNvim/astrocore",
      ---@param opts AstroCoreOpts
      opts = function(_, opts)
        local astrocore = require "astrocore"
        local get_icon = require("astroui").get_icon
        local maps = {
          ["<Leader>m"] = { desc = get_icon("ChatGPT", 1, true) .. "ChatGPT" },
          ["<Leader>mc"] = { "<Cmd>ChatGPT<CR>", desc = "ChatGPT" },
          ["<Leader>mC"] = { "<Cmd>ChatGPTActAs<CR>", desc = "ChatGPT Acts As ..." },
          ["<Leader>me"] = { "<Cmd>ChatGPTEditWithInstruction<CR>", desc = "Edit with instruction" },
          ["<Leader>mg"] = { "<Cmd>ChatGPTRun grammar_correction<CR>", desc = "Grammar Correction" },
          ["<Leader>mt"] = { "<Cmd>ChatGPTRun translate<CR>", desc = "Translate" },
          ["<Leader>mk"] = { "<Cmd>ChatGPTRun keywords<CR>", desc = "Keywords" },
          ["<Leader>md"] = { "<Cmd>ChatGPTRun docstring<CR>", desc = "Docstring" },
          ["<Leader>ma"] = { "<Cmd>ChatGPTRun add_tests<CR>", desc = "Add Tests" },
          ["<Leader>mo"] = { "<Cmd>ChatGPTRun optimize_code<CR>", desc = "Optimize Code" },
          ["<Leader>ms"] = { "<Cmd>ChatGPTRun summarize<CR>", desc = "Summarize" },
          ["<Leader>mf"] = { "<Cmd>ChatGPTRun fix_bugs<CR>", desc = "Fix Bugs" },
          ["<Leader>mx"] = { "<Cmd>ChatGPTRun explain_code<CR>", desc = "Explain Code" },
          ["<Leader>mr"] = { "<Cmd>ChatGPTRun roxygen_edit<CR>", desc = "Roxygen Edit" },
          ["<Leader>ml"] = { "<Cmd>ChatGPTRun code_readability_analysis<CR>", desc = "Code Readability Analysis" },
        }

        return astrocore.extend_tbl({
          mappings = {
            n = maps,
            v = maps,
          },
        }, opts)
      end,
    },
    { "AstroNvim/astroui", opts = { icons = { ChatGPT = "󰭹" } } },
    "MunifTanjim/nui.nvim",
    "folke/trouble.nvim",
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",
  },
  opts = {},
}
