local prefix = "gz"
return {
  { "machakann/vim-sandwich", enabled = false },
  {
    "echasnovski/mini.surround",
    keys = {
      { prefix, desc = "Surround" },
    },
    opts = {
      mappings = {
        add = prefix .. "a", -- Add surrounding in Normal and Visual modes
        delete = prefix .. "d", -- Delete surrounding
        find = prefix .. "f", -- Find surrounding (to the right)
        find_left = prefix .. "F", -- Find surrounding (to the left)
        highlight = prefix .. "h", -- Highlight surrounding
        replace = prefix .. "r", -- Replace surrounding
        update_n_lines = prefix .. "n", -- Update `n_lines`
      },
    },
  },
}
