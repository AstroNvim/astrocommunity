local default_opts = { instanceName = "main" }
local function grug_far_open(opts, with_visual)
  local grug_far = require "grug-far"
  opts = require("astrocore").extend_tbl(default_opts, opts)
  if not grug_far.has_instance(opts.instanceName) then
    grug_far.open(opts)
  else
    if with_visual then
      if not opts.prefills then opts.prefills = {} end
      opts.prefills.search = grug_far.get_current_visual_selection()
    end
    grug_far.open_instance(opts.instanceName)
    if opts.prefills then grug_far.update_instance_prefills(opts.instanceName, opts.prefills, false) end
  end
end

---@type LazySpec
return {
  "MagicDuck/grug-far.nvim",
  cmd = { "GrugFar", "GrugFarWithin" },
  specs = {
    {
      "AstroNvim/astroui",
      ---@type AstroUIOpts
      opts = { icons = { GrugFar = "󰛔" } },
    },
    {
      "AstroNvim/astrocore",
      ---@param opts AstroCoreOpts
      opts = function(_, opts)
        local maps, prefix = opts.mappings, "<Leader>s"

        maps.n[prefix] = { desc = require("astroui").get_icon("GrugFar", 1, true) .. "Search/Replace" }
        maps.n[prefix .. "s"] = {
          function() grug_far_open() end,
          desc = "Search/Replace workspace",
        }
        maps.n[prefix .. "e"] = {
          function()
            local ext = require("astrocore.buffer").is_valid() and vim.fn.expand "%:e" or ""
            grug_far_open {
              prefills = { filesFilter = ext ~= "" and "*." .. ext or nil },
            }
          end,
          desc = "Search/Replace filetype",
        }
        maps.n[prefix .. "f"] = {
          function()
            local filter = require("astrocore.buffer").is_valid() and vim.fn.expand "%" or nil
            grug_far_open { prefills = { paths = filter } }
          end,
          desc = "Search/Replace file",
        }
        maps.n[prefix .. "w"] = {
          function()
            local current_word = vim.fn.expand "<cword>"
            if current_word ~= "" then
              grug_far_open {
                startCursorRow = 4,
                prefills = { search = vim.fn.expand "<cword>" },
              }
            else
              vim.notify("No word under cursor", vim.log.levels.WARN, { title = "Grug-far" })
            end
          end,
          desc = "Replace current word",
        }
        maps.x[prefix] = { function() grug_far_open(nil, true) end, desc = "Replace selection" }
      end,
    },
    {
      "zbirenbaum/copilot.lua",
      optional = true,
      opts = {
        filetypes = {
          ["grug-far"] = false,
          ["grug-far-history"] = false,
        },
      },
    },
    {
      "github/copilot.vim",
      optional = true,
      specs = {
        {
          "AstroNvim/astrocore",
          ---@type AstroCoreOpts
          opts = {
            options = {
              g = {
                copilot_filetypes = {
                  ["grug-far"] = false,
                  ["grug-far-history"] = false,
                },
              },
            },
          },
        },
      },
    },
    {
      "catppuccin",
      optional = true,
      ---@type CatppuccinOptions
      opts = { integrations = { grug_far = true } },
    },
    {
      "nvim-neo-tree/neo-tree.nvim",
      optional = true,
      opts = {
        commands = {
          grug_far_replace = function(state)
            local node = state.tree:get_node()
            grug_far_open {
              prefills = {
                paths = node.type == "directory" and node:get_id() or vim.fn.fnamemodify(node:get_id(), ":h"),
              },
            }
          end,
        },
        window = {
          mappings = {
            gS = "grug_far_replace",
          },
        },
      },
    },
    {
      "stevearc/oil.nvim",
      optional = true,
      opts = {
        keymaps = {
          gS = {
            function() grug_far_open { prefills = { paths = require("oil").get_current_dir() } } end,
            desc = "Search/Replace in directory",
          },
        },
      },
    },
    {
      "echasnovski/mini.files",
      optional = true,
      specs = {
        "AstroNvim/astrocore",
        opts = {
          autocmds = {
            mini_files_grug_far = {
              {
                event = "User",
                pattern = "MiniFilesBufferCreate",
                desc = "Create `gS` mapping in `mini.files` for searching in directory",
                callback = function(args)
                  vim.keymap.set(
                    "n",
                    "gS",
                    function()
                      grug_far_open { prefills = { paths = vim.fs.dirname(require("mini.files").get_fs_entry().path) } }
                    end,
                    { buffer = args.data.buf_id, desc = "Search/Replace in directory" }
                  )
                end,
              },
            },
          },
        },
      },
    },
  },
  ---@param opts GrugFarOptionsOverride
  opts = function(_, opts)
    opts.transient = true
    if not opts.icons then opts.icons = {} end
    if vim.g.icons_enabled == false then
      opts.icons.enabled = false
      opts.resultsSeparatorLineChar = "-"
      opts.spinnerStates = { "|", "\\", "-", "/" }
    end
  end,
}
