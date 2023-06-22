local prefix = "<leader>s"
return {
  "nvim-pack/nvim-spectre",
  cmd = "Spectre",
  keys = {
    { prefix, desc = "Search / Replace", mode = { "n", "x" } },
    { prefix .. "s", function() require("spectre").open() end, desc = "Spectre" },
    {
      prefix .. "w",
      mode = "x",
      function() require("spectre").open_visual { select_word = true } end,
      desc = "Spectre (current word)",
    },
    { prefix .. "f", function() require("spectre").open_file_search() end, desc = "Spectre (current file)" },
  },

  opts = function()
    return {
      mapping = {
        send_to_qf = { map = "q" },
        replace_cmd = { map = "c" },
        show_option_menu = { map = "o" },
        run_current_replace = { map = "C" },
        run_replace = { map = "R" },
        change_view_mode = { map = "v" },
        resume_last_search = { map = "l" },
      },
    }
  end,
}
