local format_filetypes = {
  "css",
  "graphql",
  "handlebars",
  "html",
  "javascript",
  "javascriptreact",
  "json",
  "json5",
  "jsonc",
  "less",
  "markdown",
  "markdown.mdx",
  "scss",
  "typescript",
  "typescriptreact",
  "vue",
  "yaml",
}

local lsp_rooter_cache, prettierrc_rooter_cache

local function get_lsp_rooter()
  if not lsp_rooter_cache then
    lsp_rooter_cache = require("astrocore.rooter").resolve("lsp", {
      ignore = {
        servers = function(client)
          return not vim.tbl_contains({
            "eslint",
            "ts_ls",
            "typescript-tools",
            "volar",
            "vtsls",
          }, client.name)
        end,
      },
    })
  end
  return lsp_rooter_cache
end

local prettier_files = {
  ".prettierrc",
  ".prettierrc.json",
  ".prettierrc.json5",
  ".prettierrc.yaml",
  ".prettierrc.yml",
  ".prettierrc.toml",
  ".prettierrc.cjs",
  ".prettierrc.js",
  ".prettierrc.mjs",
  ".prettierrc.ts",
  ".prettierrc.mts",
  ".prettierrc.cts",
  "prettier.config.js",
  "prettier.config.cjs",
  "prettier.config.mjs",
  "prettier.config.ts",
  "prettier.config.mts",
}

local function get_prettierrc_rooter()
  if not prettierrc_rooter_cache then prettierrc_rooter_cache = require("astrocore.rooter").resolve(prettier_files) end
  return prettierrc_rooter_cache
end

local function decode_json(filename)
  local file = io.open(filename, "r")
  if not file then return false end
  local content = file:read "*all"
  file:close()
  local ok, json = pcall(vim.fn.json_decode, content)
  if not ok or type(json) ~= "table" then return false end
  return json
end

local function check_json_key_exists(json, ...) return vim.tbl_get(json, ...) ~= nil end

local function has_prettier(bufnr)
  if type(bufnr) ~= "number" then bufnr = vim.api.nvim_get_current_buf() end

  local prettier_dependency = false

  local lsp_rooter = get_lsp_rooter()
  local search_roots = require("astrocore").list_insert_unique(lsp_rooter(bufnr) or {}, { vim.fn.getcwd() })

  for _, root in ipairs(search_roots) do
    local package_json_path = root .. "/package.json"
    if vim.fn.filereadable(package_json_path) == 1 then
      local package_json = decode_json(package_json_path)
      if
        package_json
        and (
          check_json_key_exists(package_json, "dependencies", "prettier")
          or check_json_key_exists(package_json, "devDependencies", "prettier")
        )
      then
        prettier_dependency = true
        break
      end
    end
  end

  if prettier_dependency then return true end

  local prettierrc_root = get_prettierrc_rooter()(bufnr)
  return prettierrc_root and next(prettierrc_root) ~= nil
end

local null_ls_formatter = function(params)
  if vim.tbl_contains(format_filetypes, params.filetype) then return has_prettier(params.bufnr) end
  return true
end

local conform_formatter = function(bufnr) return has_prettier(bufnr) and { "prettierd" } or {} end

---@type LazySpec
return {
  {
    "jay-babu/mason-null-ls.nvim",
    optional = true,
    opts = function(_, opts)
      opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed or {}, { "prettierd" })
      if not opts.handlers then opts.handlers = {} end

      opts.handlers.prettierd = function(source_name, methods)
        local null_ls = require "null-ls"
        for _, method in ipairs(methods) do
          null_ls.register(null_ls.builtins[method][source_name].with { runtime_condition = null_ls_formatter })
        end
      end
    end,
  },
  {
    "stevearc/conform.nvim",
    optional = true,
    opts = function(_, opts)
      if not opts.formatters_by_ft then opts.formatters_by_ft = {} end
      for _, filetype in ipairs(format_filetypes) do
        opts.formatters_by_ft[filetype] = conform_formatter
      end
    end,
  },
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    optional = true,
    opts = function(_, opts)
      opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed or {}, { "prettierd" })
    end,
  },
  {
    "echasnovski/mini.icons",
    optional = true,
    opts = function(_, opts)
      if not opts.file then opts.file = {} end
      for _, filename in ipairs(prettier_files) do
        opts.file[filename] = { glyph = "", hl = "MiniIconsPurple" }
      end
    end,
  },
}
