local function decode_json_file(filename)
  local file = io.open(filename, "r")
  if file then
    local content = file:read "*all"
    file:close()

    local ok, data = pcall(vim.fn.json_decode, content)
    if ok and type(data) == "table" then return data end
  end
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
                local root_pattern = require("lspconfig").util.root_pattern

                -- First, check for common Tailwind config files
                local root = root_pattern(
                  "tailwind.config.mjs",
                  "tailwind.config.cjs",
                  "tailwind.config.js",
                  "tailwind.config.ts",
                  "postcss.config.js",
                  "config/tailwind.config.js",
                  "assets/tailwind.config.js"
                )(fname)
                -- If not found, check for package.json dependencies
                if not root then
                  local package_root = root_pattern "package.json"(fname)
                  if package_root then
                    local package_data = decode_json_file(package_root .. "/package.json")
                    if
                      package_data
                      and (
                        has_nested_key(package_data, "dependencies", "tailwindcss")
                        or has_nested_key(package_data, "devDependencies", "tailwindcss")
                      )
                    then
                      root = package_root
                    end
                  end
                end
                return root
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
