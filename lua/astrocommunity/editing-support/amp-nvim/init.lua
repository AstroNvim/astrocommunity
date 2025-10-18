return {
  "sourcegraph/amp.nvim",
  branch = "main",
  lazy = false,
  opts = { auto_start = true, log_level = "info" },
  dependencies = {
    {
      "AstroNvim/astrocore",
      opts = {
        commands = {
          AmpSend = {
            function(event)
              local message = event.args
              if message == "" then
                print "Please provide a message to send"
                return
              end
              require("amp.message").send_message(message)
            end,
            nargs = "*",
            desc = "Send a message to Amp",
          },
          AmpSendBuffer = {
            function()
              local buf = vim.api.nvim_get_current_buf()
              local lines = vim.api.nvim_buf_get_lines(buf, 0, -1, false)
              local content = table.concat(lines, "\n")
              require("amp.message").send_message(content)
            end,
            desc = "Send current buffer contents to Amp",
          },
          AmpPromptSelection = {
            function(event)
              local lines = vim.api.nvim_buf_get_lines(0, event.line1 - 1, event.line2, false)
              local text = table.concat(lines, "\n")
              require("amp.message").send_to_prompt(text)
            end,
            range = true,
            desc = "Add selected text to Amp prompt",
          },
          AmpPromptRef = {
            function(event)
              local bufname = vim.api.nvim_buf_get_name(0)
              if bufname == "" then
                print "Current buffer has no filename"
                return
              end
              local relative_path = vim.fn.fnamemodify(bufname, ":.")
              local ref = "@" .. relative_path
              if event.line1 ~= event.line2 then
                ref = ref .. "#L" .. event.line1 .. "-" .. event.line2
              elseif event.line1 > 1 then
                ref = ref .. "#L" .. event.line1
              end
              require("amp.message").send_to_prompt(ref)
            end,
            range = true,
            desc = "Add file reference (with selection) to Amp prompt",
          },
        },
      },
    },
  },
}
