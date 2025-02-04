local function decode_json_file(filename)
  local file = io.open(filename, "r")
  if not file then return nil end

  local content = file:read "*all"
  file:close()

  local ok, data = pcall(vim.fn.json_decode, content)
  if ok and type(data) == "table" then return data end
  return nil
end

local function has_nested_key(json, ...) return vim.tbl_get(json, ...) ~= nil end

return {
  { import = "astrocommunity.pack.html-css" },
  {
    "williamboman/mason-lspconfig.nvim",
    optional = true,
    opts = function(_, opts)
      opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, { "tailwindcss" })
    end,
    dependencies = {
      {
        "AstroNvim/astrolsp",
        optional = true,
        ---@type AstroLSPOpts
        opts = {
          config = {
            tailwindcss = {
              root_dir = function(fname)
                local lsp_util = require("lspconfig").util

                -- First, check for common Tailwind config files
                local root_pattern = lsp_util.root_pattern(
                  "tailwind.config.mjs",
                  "tailwind.config.cjs",
                  "tailwind.config.js",
                  "tailwind.config.ts",
                  "postcss.config.js",
                  "config/tailwind.config.js",
                  "assets/tailwind.config.js"
                )
                local root = root_pattern(fname)
                if root then return root end

                -- Next, check for package.json dependencies
                root_pattern = lsp_util.root_pattern "package.json"
                root = root_pattern(fname)
                if root then
                  local package_data = decode_json_file(root .. "/package.json")
                  if
                    package_data
                    and (
                      has_nested_key(package_data, "dependencies", "tailwindcss")
                      or has_nested_key(package_data, "devDependencies", "tailwindcss")
                    )
                  then
                    return root
                  end
                end

                -- Couldn't find valid root dir
                return nil
              end,
            },
          },
        },
      },
    },
  },
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    optional = true,
    opts = function(_, opts)
      opts.ensure_installed =
        require("astrocore").list_insert_unique(opts.ensure_installed, { "tailwindcss-language-server" })
    end,
  },
  {
    "hrsh7th/nvim-cmp",
    optional = true,
    dependencies = {
      { "js-everts/cmp-tailwind-colors", opts = {} },
    },
    opts = function(_, opts)
      local format_kinds = opts.formatting.format
      opts.formatting.format = function(entry, item)
        if item.kind == "Color" then
          item = require("cmp-tailwind-colors").format(entry, item)
          if item.kind == "Color" then return format_kinds(entry, item) end
          return item
        end
        return format_kinds(entry, item)
      end
    end,
  },
  {
    "NvChad/nvim-colorizer.lua",
    optional = true,
    opts = {
      user_default_options = {
        names = true,
        tailwind = true,
      },
    },
  },
}
