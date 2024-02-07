return {
  { import = "astrocommunity.pack.yaml" },
  {
    "jay-babu/mason-null-ls.nvim",
    optional = true,
    opts = function(_, opts)
      opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, "ansiblelint")
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    optional = true,
    opts = function(_, opts)
      opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, "ansiblels")
    end,
  },
  {
    "pearofducks/ansible-vim",
    init = function()
      local function yaml_ft(path, bufnr)
        -- get content of buffer as string
        local content = vim.api.nvim_buf_get_lines(bufnr, 0, -1, false)
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
  {
    "stevearc/conform.nvim",
    optional = true,
    opts = {
      formatters_by_ft = {
        ["yaml.ansible"] = { "prettierd" },
      },
    },
  },
  {
    "mfussenegger/nvim-lint",
    optional = true,
    opts = {
      linters_by_ft = {
        ansible = { "ansible_lint" },
      },
    },
  },
}
