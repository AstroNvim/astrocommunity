return {
  "jbyuki/venn.nvim",
  cmd = "VBox",
  dependencies = {
    "AstroNvim/astrocore",
    ---@type AstroCoreOpts
    opts = {
      commands = {
        ToggleVenn = {
          function()
            local mappings = {
              n = { -- draw a line on HJKL keystokes
                H = "<C-v>h:VBox<CR>",
                J = "<C-v>j:VBox<CR>",
                K = "<C-v>k:VBox<CR>",
                L = "<C-v>l:VBox<CR>",
              },
              v = { -- draw a box by pressing "f" with visual selection
                f = ":VBox<CR>",
              },
            }
            if vim.b.venn_enabled then
              vim.opt_local.virtualedit = ""
              for mode, map in pairs(mappings) do
                for lhs, _ in pairs(map) do
                  vim.keymap.del(mode, lhs, { buffer = true })
                end
              end
              vim.b.venn_enabled = nil
            else
              vim.b.venn_enabled = true
              vim.opt_local.virtualedit = "all"
              require("astrocore").set_mappings(mappings, { buffer = true })
            end
            vim.notify(("Venn Diagramming Mode: %s"):format(vim.b.venn_enabled and "Enabled" or "Disabled"))
          end,
          desc = "Toggle venn diagramming mode",
        },
      },
      mappings = { n = { ["<Leader>v"] = { function() vim.cmd.ToggleVenn() end, desc = "Toggle venn diagramming" } } },
    },
  },
}
