local hint = [[
 Arrow^^^^^^   Select region with <C-v> 
 ^ ^ _K_ ^ ^   _f_: surround it with box
 _H_ ^ ^ _L_
 ^ ^ _J_ ^ ^                      _<Esc>_
]]

return {
  "jbyuki/venn.nvim",
  cmd = "VBox",
  dependencies = {
    {
      "AstroNvim/astrocore",
      opts = function(_, opts)
        local astrocore = require "astrocore"
        if astrocore.is_available "hydra.nvim" then
          if not opts.commands then opts.comands = {} end
          opts.commands.ToggleVenn = {
            function()
              local hydra = vim.tbl_get(astrocore.plugin_opts "hydra.nvim", "Draw Diagram", "hydra")
              if hydra then
                if hydra.layer.active then
                  hydra:exit()
                else
                  hydra:activate()
                end
              end
            end,
            desc = "Toggle venn diagramming mode",
          }
        else
          return astrocore.extend_tbl(opts, {
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
            mappings = {
              n = { ["<Leader>v"] = { function() vim.cmd.ToggleVenn() end, desc = "Toggle venn diagramming" } },
            },
          })
        end
      end,
    },
  },
  specs = {
    {
      "anuvyklack/hydra.nvim",
      optional = true,
      opts = {
        ["Draw Diagram"] = {
          hint = hint,
          config = {
            color = "pink",
            invoke_on_body = true,
            hint = { border = "rounded" },
            on_enter = function() vim.o.virtualedit = "all" end,
          },
          mode = "n",
          body = "<leader>v",
          heads = {
            { "H", "<C-v>h:VBox<CR>" },
            { "J", "<C-v>j:VBox<CR>" },
            { "K", "<C-v>k:VBox<CR>" },
            { "L", "<C-v>l:VBox<CR>" },
            { "f", ":VBox<CR>", { mode = "v" } },
            { "<Esc>", nil, { exit = true } },
          },
        },
      },
    },
  },
}
