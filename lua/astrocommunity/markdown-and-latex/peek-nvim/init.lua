return {
  "toppair/peek.nvim",
  build = "deno task --quiet build:fast",
  config = function()
    vim.api.nvim_create_user_command("PeekOpen", require("peek").open, {})
    vim.api.nvim_create_user_command("PeekClose", require("peek").close, {})
  end,
  cmd = {
    "PeekOpen",
    "PeekClose",
  },
}
