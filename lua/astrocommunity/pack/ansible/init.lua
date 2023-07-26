local utils = require "astrocore"

return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      if opts.ensure_installed ~= "all" then
        opts.ensure_installed = utils.list_insert_unique(opts.ensure_installed, "yaml")
      end
    end,
  },
  {
    "jay-babu/mason-null-ls.nvim",
    opts = function(_, opts) opts.ensure_installed = utils.list_insert_unique(opts.ensure_installed, "ansiblelint") end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    opts = function(_, opts) opts.ensure_installed = utils.list_insert_unique(opts.ensure_installed, "ansiblels") end,
  },
  {
    "pearofducks/ansible-vim",
    init = function()
      local function yaml_ft(path, bufnr)
        -- get content of buffer as string
        local content = vim.filetype.getlines(bufnr)
        if type(content) == "table" then content = table.concat(content, "\n") end

        -- check if file is in roles, tasks, or handlers folder
        local path_regex = vim.regex "(tasks\\|roles\\|handlers)/"
        if path_regex and path_regex:match_str(path) then return "yaml.ansible" end
        -- check for known ansible playbook text and if found, return yaml.ansible
        local regex = vim.regex "hosts:\\|tasks:"
        if regex and regex:match_str(content) then return "yaml.ansible" end

        -- return yaml if nothing else
        return "yaml"
      end

      vim.filetype.add {
        extension = {
          yml = yaml_ft,
          yaml = yaml_ft,
        },
      }
    end,
    ft = "yaml.ansible",
  },
}
