local backend = "smart-splits-backend-herdr"
return {
  "smart-splits-nvim/smart-splits.nvim",
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
    { "adriankarlen/smart-splits-backend-herdr", lazy = true, opts = {} },
  },
}
