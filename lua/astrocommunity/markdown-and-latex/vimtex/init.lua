return {
  "lervag/vimtex",
  lazy = false,
  init = function()
    -- add which-key mapping descriptions for VimTex
    vim.api.nvim_create_autocmd("FileType", {
      desc = "Set up VimTex Which-Key descriptions",
      group = vim.api.nvim_create_augroup("vimtex_mapping_descriptions", { clear = true }),
      pattern = "tex",
      callback = function(event)
        local wk = require "which-key"
        local opts = {
          mode = "n", -- NORMAL mode
          buffer = event.buf, -- Specify a buffer number for buffer local mappings to show only in tex buffers
        }
        local mappings = {
          ["<localleader>l"] = {
            name = "+VimTeX",
            a = "Show Context Menu",
            C = "Full Clean",
            c = "Clean",
            e = "Show Errors",
            G = "Show Status for All",
            g = "Show Status",
            i = "Show Info",
            I = "Show Full Info",
            k = "Stop VimTeX",
            K = "Stop All VimTeX",
            L = "Compile Selection",
            l = "Compile",
            m = "Show Imaps",
            o = "Show Compiler Output",
            q = "Show VimTeX Log",
            s = "Toggle Main",
            t = "Open Table of Contents",
            T = "Toggle Table of Contents",
            v = "View Compiled Document",
            X = "Reload VimTeX State",
            x = "Reload VimTeX",
          },
          ["ts"] = {
            name = "VimTeX Toggles & Cycles", -- optional group name
            ["$"] = "Cycle inline, display & numbered equation",
            c = "Toggle star of command",
            d = "Cycle (), \\left(\\right) [,...]",
            D = "Reverse Cycle (), \\left(\\right) [, ...]",
            e = "Toggle star of environment",
            f = "Toggle a/b vs \\frac{a}{b}",
          },
          ["[/"] = "Previous start of a LaTeX comment",
          ["[*"] = "Previous end of a LaTeX comment",
          ["[["] = "Previous beginning of a section",
          ["[]"] = "Previous end of a section",
          ["[m"] = "Previous \\begin",
          ["[M"] = "Previous \\end",
          ["[n"] = "Previous start of a math zone",
          ["[N"] = "Previous end of a math zone",
          ["[r"] = "Previous \\begin{frame}",
          ["[R"] = "Previous \\end{frame}",
          ["]/"] = "Next start of a LaTeX comment %",
          ["]*"] = "Next end of a LaTeX comment %",
          ["]["] = "Next beginning of a section",
          ["]]"] = "Next end of a section",
          ["]m"] = "Next \\begin",
          ["]M"] = "Next \\end",
          ["]n"] = "Next start of a math zone",
          ["]N"] = "Next end of a math zone",
          ["]r"] = "Next \\begin{frame}",
          ["]R"] = "Next \\end{frame}",
          ["cs"] = {
            c = "Change surrounding command",
            e = "Change surrounding environment",
            ["$"] = "Change surrounding math zone",
            d = "Change surrounding delimiter",
          },
          ["ds"] = {
            c = "Delete surrounding command",
            e = "Delete surrounding environment",
            ["$"] = "Delete surrounding math zone",
            d = "Delete surrounding delimiter",
          },
        }
        wk.register(mappings, opts)
        -- VimTeX Text Objects without variants with targets.vim
        opts = {
          mode = "o", -- Operator pending mode
          buffer = event.buf,
        }
        local objects = {
          ["ic"] = [[LaTeX Command]],
          ["ac"] = [[LaTeX Command]],
          ["id"] = [[LaTeX Math Delimiter]],
          ["ad"] = [[LaTeX Math Delimiter]],
          ["ie"] = [[LaTeX Environment]],
          ["ae"] = [[LaTeX Environment]],
          ["i$"] = [[LaTeX Math Zone]],
          ["a$"] = [[LaTeX Math Zone]],
          ["iP"] = [[LaTeX Section, Paragraph, ...]],
          ["aP"] = [[LaTeX Section, Paragraph, ...]],
          ["im"] = [[LaTeX Item]],
          ["am"] = [[LaTeX Item]],
        }
        wk.register(objects, opts)
      end,
    })
  end,
}
