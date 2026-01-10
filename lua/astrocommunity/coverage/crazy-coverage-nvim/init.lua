return {
  "mr-u0b0dy/crazy-coverage.nvim",
  cmd = {
    "CoverageToggle",
    "CoverageToggleHitCount",
    "CoverageLoad",
    "CoverageNextUncovered",
    "CoveragePrevUncovered",
    "CoverageNextCovered",
    "CoveragePrevCovered",
    "CoverageNextPartial",
    "CoveragePrevPartial",
  },
  keys = {
    -- Main commands
    { "<leader>lt", "<cmd>CoverageToggle<cr>", desc = "Coverage: Toggle" },
    { "<leader>lh", "<cmd>CoverageToggleHitCount<cr>", desc = "Coverage: Toggle Hit Count" },

    -- Navigate covered lines
    { "]cc", "<cmd>CoverageNextCovered<cr>", desc = "Coverage: Next Covered" },
    { "[cc", "<cmd>CoveragePrevCovered<cr>", desc = "Coverage: Prev Covered" },

    -- Navigate partial lines
    { "]cp", "<cmd>CoverageNextPartial<cr>", desc = "Coverage: Next Partial" },
    { "[cp", "<cmd>CoveragePrevPartial<cr>", desc = "Coverage: Prev Partial" },

    -- Navigate uncovered lines
    { "]cu", "<cmd>CoverageNextUncovered<cr>", desc = "Coverage: Next Uncovered" },
    { "[cu", "<cmd>CoveragePrevUncovered<cr>", desc = "Coverage: Prev Uncovered" },
  },
  opts = {
    -- Display Options
    virt_text_pos = "eol", -- "eol", "inline", "overlay", "right_align"
    default_show_hit_count = true, -- Show hit counts by default
    show_hit_count = true,
    show_percentage = false, -- Display percentage of execution per line
    show_branch_summary = false, -- Show branch coverage (e.g., b:2/4)
    enable_line_hl = true, -- Highlight covered/uncovered lines with background colors

    -- Color Configuration
    auto_adapt_colors = true, -- Auto-adapt colors based on your colorscheme
    colors = {
      covered = nil, -- nil = use auto-adapted colors
      uncovered = nil,
      partial = nil,
    },
    covered_hl = "CoverageCovered",
    uncovered_hl = "CoverageUncovered",
    partial_hl = "CoveragePartial",

    -- File Detection
    coverage_dirs = {
      "build/coverage", -- CMake default
      "coverage", -- Standard coverage directory
      "build", -- Build directory root
      ".", -- Project root
    },
    project_markers = { ".git", "CMakeLists.txt", "Makefile", "compile_commands.json" },

    -- Cache Settings
    cache_enabled = true,
    cache_dir = vim.fn.stdpath "cache" .. "/crazy-coverage.nvim",
  },
  config = function(_, opts) require("crazy-coverage").setup(opts) end,
}
