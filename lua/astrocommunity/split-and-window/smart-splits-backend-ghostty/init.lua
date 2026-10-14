local backend = "smart-splits-backend-ghostty"
return {
  "smart-splits-nvim/smart-splits.nvim",
  event = vim.trim((vim.env.TERM_PROGRAM or ""):lower()) == "ghostty" and "VeryLazy" or nil,
  opts = function(_, opts)
    if not opts.mux then opts.mux = {} end
    local prev_backend = opts.mux.backend
    if type(prev_backend) == "table" then
      table.insert(prev_backend, backend)
    elseif type(prev_backend) == "string" then
      opts.mux.backend = { prev_backend, backend }
    elseif type(prev_backend) == "function" then
      opts.mux.backend = function()
        local selected = prev_backend()
        if selected[1] then
          table.insert(selected, require(backend))
          return selected
        else
          return { selected, require(backend) }
        end
      end
    else
      opts.mux.backend = { backend }
    end
  end,
  specs = {
    { "smart-splits-nvim/backend-ghostty", lazy = true, opts = {} },
  },
}
