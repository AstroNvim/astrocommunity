return {
  {
    "zschreur/telescope-jj.nvim",
    config = function() require("telescope").load_extension "jj" end,
    dependencies = {
      {
        "AstroNvim/astrocore",
        opts = {
          mappings = {
            n = {
              ["<Leader>jf"] = {
                function()
                  local jj_pick_status, jj_res = pcall(require("telescope").extensions.jj.files)
                  if jj_pick_status then return end

                  -- Git fallback
                  local git_files_status, git_res = pcall(require("telescope.builtin").git_files)
                  if not git_files_status then
                    error("Could not launch jj or git files: \n" .. jj_res .. "\n" .. git_res)
                  end
                end,
                desc = "jj files",
              },
              ["<Leader>jc"] = { function() require("telescope").extensions.jj.conflicts() end, desc = "jj conflicts" },
              ["<Leader>jd"] = { function() require("telescope").extensions.jj.diff() end, desc = "jj diff" },
            },
          },
        },
      },
    },
  },
  {
    "Cretezy/neo-tree-jj.nvim",
    dependencies = {
      {
        "nvim-neo-tree/neo-tree.nvim",
        opts = function(_, opts)
          table.insert(opts.sources, "jj")

          -- Replace git tab in neo-tree when in jj repo
          if require("neo-tree.sources.jj.utils").get_repository_root() then
            -- Remove git tab
            for i, source in ipairs(opts.source_selector.sources) do
              if source.source == "git_status" then
                table.remove(opts.source_selector.sources, i)
                break
              end
            end

            -- Add jj tab
            table.insert(opts.source_selector.sources, {
              display_name = "󰊢 JJ",
              source = "jj",
            })
          end
        end,
      },
    },
  },
  { "avm99963/vim-jjdescription", lazy = false },
  {
    "AstroNvim/astrocore",
    ---@param opts AstroCoreOpts
    opts = function(_, opts)
      local maps = assert(opts.mappings)

      if vim.fn.executable "lazyjj" == 1 then
        maps.n["<Leader>jl"] = {
          function()
            local astro = require "astrocore"
            local worktree = astro.file_worktree()
            local flags = worktree and ("--path '%s'"):format(worktree.toplevel, worktree.gitdir) or ""
            astro.toggle_term_cmd("lazyjj " .. flags)
          end,
          desc = "lazyjj",
        }
      end

      if vim.fn.executable "jjui" == 1 then
        maps.n["<Leader>ju"] = {
          function()
            local astro = require "astrocore"
            astro.toggle_term_cmd "jjui"
          end,
          desc = "jjui",
        }
      end
    end,
  },
}
