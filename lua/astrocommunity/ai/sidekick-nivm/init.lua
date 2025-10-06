local cli_tool = vim.g.sidekick_cli_tool or "opencode"
local prefix = "<Leader>A"

---@type LazySpec
return {
  "folke/sidekick.nvim",
  specs = {
    {
      "AstroNvim/astrocore",
      ---@param opts AstroCoreOpts
      opts = function(_, opts)
        local maps = assert(opts.mappings)
        maps.n[prefix] = { desc = require("astroui").get_icon("Sidekick", 1, true) .. "Sidekick" }
        maps.x[prefix] = { desc = require("astroui").get_icon("Sidekick", 1, true) .. "Sidekick" }
      end,
    },
    { "AstroNvim/astroui", opts = { icons = { Sidekick = "" } } },
  },
  opts = {
    nes = {
      enabled = true, -- If the user doesn't have the copilot LSP running internally this gets set as false
    },
    cli = {
      mux = {
        enabled = true,
      },
    },
  },
  keys = {
    {
      "<tab>",
      function()
        if not require("sidekick").nes_jump_or_apply() then return "<Tab>" end
      end,
      expr = true,
      desc = "Goto/Apply Next Edit Suggestion",
    },
    {
      "<c-.>",
      function() require("sidekick.cli").toggle { name = cli_tool } end,
      desc = "Sidekick Toggle",
      mode = { "n", "t", "i", "x" },
    },
    {
      prefix .. "a",
      function() require("sidekick.cli").toggle { name = cli_tool } end,
      desc = "Sidekick Toggle CLI",
    },
    {
      prefix .. "s",
      function() require("sidekick.cli").select { name = cli_tool } end,
      desc = "Select CLI",
    },
    {
      prefix .. "d",
      function() require("sidekick.cli").close { name = cli_tool } end,
      desc = "Detach a CLI Session",
    },
    {
      prefix .. "t",
      function() require("sidekick.cli").send { name = cli_tool, msg = "{this}" } end,
      mode = { "x", "n" },
      desc = "Send This",
    },
    {
      prefix .. "f",
      function() require("sidekick.cli").send { name = cli_tool, msg = "{file}" } end,
      desc = "Send File",
    },
    {
      prefix .. "v",
      function() require("sidekick.cli").send { name = cli_tool, msg = "{selection}" } end,
      mode = { "x" },
      desc = "Send Visual Selection",
    },
    {
      prefix .. "p",
      function() require("sidekick.cli").prompt { name = cli_tool } end,
      mode = { "n", "x" },
      desc = "Sidekick Select Prompt",
    },
  },
}
