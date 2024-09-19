local function grug_far_explorer(dir)
  local grug_far, prefills = require "grug-far", { paths = dir }
  if not grug_far.has_instance "explorer" then
    grug_far.open {
      instanceName = "explorer",
      prefills = prefills,
      staticTitle = "Find and Replace from Explorer",
    }
  else
    grug_far.open_instance "explorer"
    grug_far.update_instance_prefills("explorer", prefills, false)
  end
end

---@type LazySpec
return {
  "MagicDuck/grug-far.nvim",
  cmd = "GrugFar",
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
          function() require("grug-far").open { transient = true } end,
          desc = "Search/Replace workspace",
        }
        maps.n[prefix .. "e"] = {
          function()
            local ext = require("astrocore.buffer").is_valid() and vim.fn.expand "%:e" or ""
            require("grug-far").open {
              transient = true,
              prefills = { filesFilter = ext ~= "" and "*." .. ext or nil },
            }
          end,
          desc = "Search/Replace filetype",
        }
        maps.n[prefix .. "f"] = {
          function()
            local filter = require("astrocore.buffer").is_valid() and vim.fn.expand "%" or nil
            require("grug-far").open { transient = true, prefills = { paths = filter } }
          end,
          desc = "Search/Replace file",
        }
        maps.n[prefix .. "w"] = {
          function()
            local current_word = vim.fn.expand "<cword>"
            if current_word ~= "" then
              require("grug-far").open {
                transient = true,
                startCursorRow = 4,
                prefills = { search = vim.fn.expand "<cword>" },
              }
            else
              vim.notify("No word under cursor", vim.log.levels.WARN, { title = "Grug-far" })
            end
          end,
          desc = "Replace current word",
        }
        maps.x[prefix] = {
          function() require("grug-far").open { transient = true, startCursorRow = 4 } end,
          desc = "Replace selection",
        }
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
      "catppuccin",
      optional = true,
      ---@type CatppuccinOptions
      opts = { integrations = { grug_far = true } },
    },
    {
      "folke/which-key.nvim",
      optional = true,
      opts = function(_, opts)
        if not opts.disable then opts.disable = {} end
        opts.disable.ft = require("astrocore").list_insert_unique(opts.disable.ft, { "grug-far" })
      end,
    },
    {
      "nvim-neo-tree/neo-tree.nvim",
      optional = true,
      opts = {
        commands = {
          grug_far_replace = function(state)
            local node = state.tree:get_node()
            grug_far_explorer(node.type == "directory" and node:get_id() or vim.fn.fnamemodify(node:get_id(), ":h"))
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
            function() grug_far_explorer(require("oil").get_current_dir()) end,
            desc = "Search/Replace in directory",
          },
        },
      },
    },
  },
  ---@param opts GrugFarOptionsOverride
  opts = function(_, opts)
    if not opts.icons then opts.icons = {} end
    opts.icons.enabled = vim.g.icons_enabled
    if not vim.g.icons_enabled then
      opts.resultsSeparatorLineChar = "-"
      opts.spinnerStates = {
        "|",
        "\\",
        "-",
        "/",
      }
    end
  end,
}
