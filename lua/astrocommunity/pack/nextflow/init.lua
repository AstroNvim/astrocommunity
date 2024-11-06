---@type LazySpec
return {
  {
    "AstroNvim/astrocore",
    ---@type AstroCoreOpts
    opts = { filetypes = { extension = {
      nf = "nextflow",
      ["nf.test"] = "nextflow",
    } } },
  },
  { "nextflow-io/vim-language-nextflow", ft = "nextflow" },
  {
    "AstroNvim/astrolsp",
    ---@type AstroLSPOpts
    opts = {
      ---@diagnostic disable-next-line: missing-fields
      config = {
        nextflow_ls = {
          cmd = {
            "java",
            "-jar",
            "nextflow-language-server.jar",
          },
          filetypes = { "nextflow" },
          root_dir = function(fname)
            local util = require "lspconfig.util"
            return util.root_pattern "nextflow.config"(fname) or util.find_git_ancestor(fname)
          end,
          settings = {
            nextflow = {
              suppressFutureWarnings = true,
              files = {
                exclude = { ".git", ".nf-test", "work" },
              },
            },
          },
        },
      },
    },
  },
  {
    "echasnovski/mini.icons",
    optional = true,
    opts = {
      filetype = {
        nextflow = { glyph = "󰉛", hl = "MiniIconsGreen" },
      },
    },
  },
}
