return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  opts = { picker = { ui_select = true } },
  specs = {
    {
      "AstroNvim/astrocore",
      opts = function(_, opts)
        local maps = opts.mappings
        local astro = require "astrocore"
        maps.n["<Leader>f"] = vim.tbl_get(opts, "_map_sections", "f")
        if vim.fn.executable "git" == 1 then
          maps.n["<Leader>g"] = vim.tbl_get(opts, "_map_sections", "g")
          maps.n["<Leader>gb"] = { function() require("snacks").picker.git_branches() end, desc = "Git branches" }
          maps.n["<Leader>gc"] = {
            function() require("snacks").picker.git_log() end,
            desc = "Git commits (repository)",
          }
          maps.n["<Leader>gC"] = {
            function() require("snacks").picker.git_log { current_file = true, follow = true } end,
            desc = "Git commits (current file)",
          }
          maps.n["<Leader>gt"] = { function() require("snacks").picker.git_status() end, desc = "Git status" }
        end
        maps.n["<Leader>f<CR>"] = { function() require("snacks").picker.resume() end, desc = "Resume previous search" }
        maps.n["<Leader>f'"] = { function() require("snacks").picker.marks() end, desc = "Find marks" }
        maps.n["<Leader>fl"] = {
          function() require("snacks").picker.lines() end,
          desc = "Find lines",
        }
        maps.n["<Leader>fa"] = {
          function() require("snacks").picker.files { dirs = { vim.fn.stdpath "config" }, desc = "Config Files" } end,
          desc = "Find AstroNvim config files",
        }
        maps.n["<Leader>fb"] = { function() require("snacks").picker.buffers() end, desc = "Find buffers" }
        maps.n["<Leader>fc"] = { function() require("snacks").picker.grep_word() end, desc = "Find word under cursor" }
        maps.n["<Leader>fC"] = { function() require("snacks").picker.commands() end, desc = "Find commands" }
        maps.n["<Leader>ff"] = {
          function()
            require("snacks").picker.files {
              hidden = vim.tbl_get((vim.uv or vim.loop).fs_stat ".git" or {}, "type") == "directory",
            }
          end,
          desc = "Find files",
        }
        maps.n["<Leader>fF"] = {
          function() require("snacks").picker.files { hidden = true, ignored = true } end,
          desc = "Find all files",
        }
        maps.n["<Leader>fg"] = { function() require("snacks").picker.git_files() end, desc = "Find git files" }
        maps.n["<Leader>fh"] = { function() require("snacks").picker.help() end, desc = "Find help" }
        maps.n["<Leader>fk"] = { function() require("snacks").picker.keymaps() end, desc = "Find keymaps" }
        maps.n["<Leader>fm"] = { function() require("snacks").picker.man() end, desc = "Find man" }
        if astro.plugin_opts("snacks.nvim").notifier then
          maps.n["<Leader>fn"] =
            { function() require("snacks").picker.notifications() end, desc = "Find notifications" }
        end
        maps.n["<Leader>fo"] = { function() require("snacks").picker.recent() end, desc = "Find old files" }
        maps.n["<Leader>fO"] =
          { function() require("snacks").picker.recent { filter = { cwd = true } } end, desc = "Find old files (cwd)" }
        maps.n["<Leader>fr"] = { function() require("snacks").picker.registers() end, desc = "Find registers" }
        maps.n["<Leader>fs"] = { function() require("snacks").picker.smart() end, desc = "Find buffers/recent/files" }
        maps.n["<Leader>ft"] = { function() require("snacks").picker.colorschemes() end, desc = "Find themes" }
        if vim.fn.executable "rg" == 1 then
          maps.n["<Leader>fw"] = { function() require("snacks").picker.grep() end, desc = "Find words" }
          maps.n["<Leader>fW"] = {
            function() require("snacks").picker.grep { hidden = true, ignored = true } end,
            desc = "Find words in all files",
          }
        end
        maps.n["<Leader>lD"] = { function() require("snacks").picker.diagnostics() end, desc = "Search diagnostics" }
        maps.n["<Leader>ls"] = { function() require("snacks").picker.lsp_symbols() end, desc = "Search symbols" }
      end,
    },
    {
      "folke/todo-comments.nvim",
      optional = true,
      dependencies = { "folke/snacks.nvim" },
      specs = {
        {
          "AstroNvim/astrocore",
          opts = {
            mappings = {
              n = {
                ["<Leader>fT"] = {
                  function()
                    if not package.loaded["todo-comments"] then -- make sure to load todo-comments
                      require("lazy").load { plugins = { "todo-comments.nvim" } }
                    end
                    require("snacks").picker.todo_comments()
                  end,
                  desc = "Todo Comments",
                },
              },
            },
          },
        },
      },
    },
    {
      "nvim-neo-tree/neo-tree.nvim",
      optional = true,
      opts = {
        commands = {
          find_in_dir = function(state)
            local node = state.tree:get_node()
            local path = node.type == "file" and node:get_parent_id() or node:get_id()
            require("snacks").picker.files { cwd = path }
          end,
        },
        window = { mappings = { F = "find_in_dir" } },
      },
    },
    { "stevearc/dressing.nvim", optional = true, opts = { select = { enabled = false } } },
    { "nvim-telescope/telescope.nvim", enabled = false },
  },
}
