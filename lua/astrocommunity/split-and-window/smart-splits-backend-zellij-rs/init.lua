local backend = "smart-splits-backend-zellij-rs"
return {
  "smart-splits-nvim/smart-splits.nvim",
  event = (vim.env.ZELLIJ and #vim.env.ZELLIJ > 0) and "VeryLazy" or nil,
  opts = function(_, opts)
    if not opts.mux then opts.mux = {} end
    local prev_backend = opts.mux.backend
    if type(prev_backend) == "table" then
      table.insert(prev_backend, 1, backend)
    elseif type(prev_backend) == "string" then
      opts.mux.backend = { backend, prev_backend }
    elseif type(prev_backend) == "function" then
      opts.mux.backend = function()
        local selected = prev_backend()
        if selected[1] then
          table.insert(selected, 1, require(backend))
          return selected
        else
          return { require(backend), selected }
        end
      end
    else
      opts.mux.backend = { backend }
    end
  end,
  specs = {
    { "smart-splits-nvim/backend-zellij-rs", lazy = true, opts = {} },
  },
}
