-- Julia language server may be setup manually to use local system images. We should ignore installing the package
-- from Mason if that's the case because it completely changes how the Julia Language Server works
local cached_check
local function julials_manually_setup()
  if cached_check == nil then
    cached_check =
      vim.tbl_contains(vim.tbl_get(require("astrocore").plugin_opts "astrolsp", "servers") or {}, "julials")
  end
  return cached_check
end

return {
  { import = "astrocommunity.pack.toml" },
  { import = "astrocommunity.completion.cmp-latex-symbols" },
  {
    "nvim-treesitter/nvim-treesitter",
    optional = true,
    opts = function(_, opts)
      if opts.ensure_installed ~= "all" then
        opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, { "julia" })
      end
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    optional = true,
    opts = function(_, opts)
      if not julials_manually_setup() then
        opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, { "julials" })
      end
    end,
  },
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    optional = true,
    opts = function(_, opts)
      if not julials_manually_setup() then
        opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, { "julia-lsp" })
      end
    end,
  },
  {
    "AstroNvim/astrolsp",
    opts = function(_, opts)
      local astrocore = require "astrocore"
      opts = astrocore.extend_tbl(opts, {
        commands = {
          JuliaActivateEnv = {
            cond = function(client) return client.name == "julials" end,
            function(args)
              local bufnr = vim.api.nvim_get_current_buf()
              local julials_clients = (vim.lsp.get_clients or vim.lsp.get_active_clients) {
                bufnr = bufnr,
                name = "julials",
              }
              if #julials_clients == 0 then
                vim.notify(
                  "method julia/activateenvironment is not supported by any servers active on the current buffer",
                  vim.log.levels.WARN
                )
                return
              end
              local julia_project_files = { "Project.toml", "JuliaProject.toml" }
              local function _activate_env(environment)
                if environment then
                  for _, julials_client in ipairs(julials_clients) do
                    julials_client.notify("julia/activateenvironment", { envPath = environment })
                  end
                  vim.notify("Julia environment activated: \n`" .. environment .. "`", vim.log.levels.INFO)
                end
              end
              if args.args ~= "" then
                local path = vim.fs.normalize(require("plenary.path"):new(args.args):expand())
                local found_env = false
                for _, project_file in ipairs(julia_project_files) do
                  local file = (vim.uv or vim.loop).fs_stat(vim.fs.joinpath(path, project_file))
                  if file and file.type then
                    found_env = true
                    break
                  end
                end
                if not found_env then
                  vim.notify("Path is not a julia environment: \n`" .. path .. "`", vim.log.levels.WARN)
                  return
                end
                _activate_env(path)
              else
                local depot_paths = vim.env.JULIA_DEPOT_PATH
                    and vim.split(vim.env.JULIA_DEPOT_PATH, vim.fn.has "win32" == 1 and ";" or ":")
                  or { vim.fn.expand "~/.julia" }
                local environments = {}
                vim.list_extend(
                  environments,
                  vim.fs.find(julia_project_files, { type = "file", upward = true, limit = math.huge })
                )
                for _, depot_path in ipairs(depot_paths) do
                  local depot_env = vim.fs.joinpath(vim.fs.normalize(depot_path), "environments")
                  vim.list_extend(
                    environments,
                    vim.fs.find(
                      function(name, env_path)
                        return vim.tbl_contains(julia_project_files, name)
                          and string.sub(env_path, #depot_env + 1):match "^/[^/]*$"
                      end,
                      { path = depot_env, type = "file", limit = math.huge }
                    )
                  )
                end
                environments = vim.tbl_map(vim.fs.dirname, environments)
                vim.ui.select(environments, { prompt = "Select a Julia environment" }, _activate_env)
              end
            end,
            desc = "Activate a julia environment",
            nargs = "?",
            complete = "file",
          },
        },
        config = {
          julials = {
            settings = {
              -- use the same default settings as the Julia VS Code extension
              julia = {
                completionmode = "qualify",
                lint = { missingrefs = "none" },
              },
            },
          },
        },
      })

      opts.config.julials.on_attach = astrocore.patch_func(opts.config.julials.on_attach, function(orig, client, bufnr)
        local environment = vim.tbl_get(client, "settings", "julia", "environmentPath")
        if environment then client.notify("julia/activateenvironment", { envPath = environment }) end
        orig(client, bufnr)
      end)

      return opts
    end,
  },
}
