return {
  "smartinellimarco/nvcheatsheet.nvim",
  lazy = true,
  dependencies = {
    {
      "AstroNvim/astrocore",
      opts = {
        mappings = {
          n = {
            ["<F1>"] = { function() require("nvcheatsheet").toggle() end, desc = "Cheatsheet" },
          },
        },
      },
    },
  },
  opts = function(_, opts)
    local mappings = vim.tbl_get(require("astrocore").plugin_opts "astrocore", "mappings", "n")
    if mappings then
      local heading_desc = { [""] = "General" }
      if not opts.keymaps then opts.keymaps = {} end
      for lhs, rhs in pairs(mappings) do
        if type(rhs) == "table" then
          local cmd, desc = rhs[1], rhs.name or rhs.desc
          if desc and not cmd then heading_desc[lhs] = desc end
        end
      end
      local headings = vim.tbl_keys(heading_desc)
      for lhs, rhs in pairs(mappings) do
        if type(rhs) == "table" then
          local cmd, desc = rhs[1], rhs.name or rhs.desc
          if desc and cmd then
            local matched_heading = ""
            for _, heading in ipairs(headings) do
              if lhs:sub(1, #heading) == heading then
                if #heading > #matched_heading then matched_heading = heading end
              end
            end
            local heading = heading_desc[matched_heading]
            if not opts.keymaps[heading] then opts.keymaps[heading] = {} end
            table.insert(opts.keymaps[heading], { desc, lhs })
          end
        end
      end
    end
  end,
}
