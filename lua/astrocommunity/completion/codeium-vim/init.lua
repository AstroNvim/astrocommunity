return {
  "Exafunction/codeium.vim",
  cmd = {
    "Codeium",
    "CodeiumEnable",
    "CodeiumDisable",
    "CodeiumToggle",
    "CodeiumAuto",
    "CodeiumManual",
  },
  event = "BufEnter",
  dependencies = {
    "AstroNvim/astrocore",
    ---@type AstroCoreOpts
    opts = {
      mappings = {
        n = {
          ["<Leader>;"] = {
            "<Cmd>CodeiumToggle<CR>",
            noremap = true,
            desc = "Toggle Codeium active",
          },
        },
        i = {
          ["<C-g>"] = {
            function() return vim.fn["codeium#Accept"]() end,
            expr = true,
          },
          ["<C-;>"] = {
            function() return vim.fn["codeium#CycleCompletions"](1) end,
            expr = true,
          },
          ["<C-,>"] = {
            function() return vim.fn["codeium#CycleCompletions"](-1) end,
            expr = true,
          },
          ["<C-x>"] = {
            function() return vim.fn["codeium#Clear"]() end,
            expr = true,
          },
        },
      },
    },
  },
}
