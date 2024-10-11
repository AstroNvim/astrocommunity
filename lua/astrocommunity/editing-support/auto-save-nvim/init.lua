local group = vim.api.nvim_create_augroup("autosave", {})

-- Disable autoformat before saving
vim.api.nvim_create_autocmd("User", {
  pattern = "AutoSaveWritePre",
  group = group,
  callback = function()
    -- save global autoformat status
    vim.g.OLD_AUTOFORMAT = vim.g.autoformat
    vim.g.autoformat = false
    vim.g.OLD_AUTOFORMAT_BUFFERS = {}
    -- disable all manually enabled buffers
    for _, bufnr in ipairs(vim.api.nvim_list_bufs()) do
      if vim.b[bufnr].autoformat then
        table.insert(vim.g.OLD_AUTOFORMAT_BUFFERS, bufnr)
        vim.b[bufnr].autoformat = false
      end
    end
  end,
})

-- Re-enable autoformat after saving
vim.api.nvim_create_autocmd("User", {
  pattern = "AutoSaveWritePost",
  group = group,
  callback = function()
    -- restore global autoformat status
    vim.g.autoformat = vim.g.OLD_AUTOFORMAT
    -- re-enable all manually enabled buffers
    for _, bufnr in ipairs(vim.g.OLD_AUTOFORMAT_BUFFERS or {}) do
      vim.b[bufnr].autoformat = true
    end
  end,
})

return {
  "okuuva/auto-save.nvim",
  event = { "User AstroFile", "InsertEnter" },
  opts = {},
}
