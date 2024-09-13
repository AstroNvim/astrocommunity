---@type LazySpec
return {
  "nosduco/remote-sshfs.nvim",
  cmd = {
    "RemoteSSHFSConnect",
    "RemoteSSHFSDisconnect",
    "RemoteSSHFSEdit",
    "RemoteSSHFSFindFiles",
    "RemoteSSHFSLiveGrep",
  },
  opts = {},
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope.nvim", opts = function() require("telescope").load_extension "remote-sshfs" end },
  },
  specs = {
    {
      "AstroNvim/astrocore",
      optional = true,
      opts = function(_, opts)
        local map = opts.mappings
        map.n["<Leader>R"] = { desc = "Remote" }
        map.n["<Leader>Rc"] = { function() require("remote-sshfs.api").connect() end, desc = "Connect" }
        map.n["<Leader>Rd"] = { function() require("remote-sshfs.api").disconnect() end, desc = "Disconnect" }
        map.n["<Leader>Re"] = { function() require("remote-sshfs.api").edit() end, desc = "Edit" }
        -- Override telescope find_files and live_grep to make dynamic based on if connected to host
        local find_files = map.n["<Leader>ff"]
        if type(find_files) == "table" then
          local orig_find_files = find_files[1]
          find_files[1] = function()
            if require("remote-sshfs.connections").is_connected() then
              require("remote-sshfs.api").find_files()
            elseif type(orig_find_files) == "function" then
              orig_find_files()
            elseif type(orig_find_files) == "string" then
              vim.cmd(orig_find_files)
            end
          end
        end
        local live_grep = map.n["<Leader>fw"]
        if type(live_grep) == "table" then
          local orig_live_grep = live_grep[1]
          live_grep[1] = function()
            if require("remote-sshfs.connections").is_connected() then
              require("remote-sshfs.api").live_grep()
            elseif type(orig_live_grep) == "function" then
              orig_live_grep()
            elseif type(orig_live_grep) == "string" then
              vim.cmd(orig_live_grep)
            end
          end
        end
      end,
    },
  },
}
