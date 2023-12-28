return {
  "antosha417/nvim-lsp-file-operations",
  -- lazy will handle loading nvim-tree and neo-tree appropriately based on the module load and our `init` function
  lazy = true,
  init = function(plugin) -- lazily load plugin after a tree plugin is loaded
    -- the plugins that should trigger this one to load when they have loaded
    local triggers = { "nvim-tree.lua", "neo-tree.nvim" }

    local load_plugin = function() require("lazy").load { plugins = { plugin.name } } end
    local lazy_plugins = require("lazy.core.config").plugins

    -- check if any of the plugins are already loaded, in which case load
    for _, trigger in ipairs(triggers) do
      if vim.tbl_get(lazy_plugins, trigger, "_", "loaded") then
        vim.schedule(load_plugin)
        return
      end
    end

    -- if none, then set up autocommand to load the plugin
    local autocmd
    autocmd = vim.api.nvim_create_autocmd("User", {
      pattern = "LazyLoad",
      desc = "lazily load nvim-lsp-file-operations",
      callback = function(args)
        if vim.tbl_contains(triggers, args.data) then
          load_plugin()
          if autocmd then vim.api.nvim_del_autocmd(autocmd) end
        end
      end,
    })

    -- TODO: This entire `init` function can be simplified to the following line after AstroNvim v4 is released
    -- require("astrocore").on_load({ "neo-tree.nvim", "nvim-tree.lua" }, plugin.name)
  end,
  main = "lsp-file-operations", -- set the main module name where the `setup` function is
  opts = {},
}
