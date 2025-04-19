local function ensure_kernel_for_venv()
  local venv_path = os.getenv "VIRTUAL_ENV" or os.getenv "CONDA_PREFIX"
  if not venv_path then
    vim.notify("No virtual environment found.", vim.log.levels.WARN)
    return
  end

  -- Canonicalize the venv_path to ensure consistency
  venv_path = vim.fn.fnamemodify(venv_path, ":p")

  -- Check if the kernel spec already exists
  local handle = io.popen "jupyter kernelspec list --json"
  local existing_kernels = {}
  if handle then
    local result = handle:read "*a"
    handle:close()
    local json = vim.fn.json_decode(result)
    -- Iterate over available kernel specs to find the one for this virtual environment
    for kernel_name, data in pairs(json.kernelspecs) do
      existing_kernels[kernel_name] = true -- Store existing kernel names for validation
      local kernel_path = vim.fn.fnamemodify(data.spec.argv[1], ":p") -- Canonicalize the kernel path
      if kernel_path:find(venv_path, 1, true) then
        vim.notify("Kernel spec for this virtual environment already exists.", vim.log.levels.INFO)
        return kernel_name
      end
    end
  end

  -- Prompt the user for a custom kernel name, ensuring it is unique
  local new_kernel_name
  repeat
    new_kernel_name = vim.fn.input "Enter a unique name for the new kernel spec: "
    if new_kernel_name == "" then
      vim.notify("Please provide a valid kernel name.", vim.log.levels.ERROR)
      return
    elseif existing_kernels[new_kernel_name] then
      vim.notify(
        "Kernel name '" .. new_kernel_name .. "' already exists. Please choose another name.",
        vim.log.levels.WARN
      )
      new_kernel_name = nil
    end
  until new_kernel_name

  -- Create the kernel spec with the unique name
  print "Creating a new kernel spec for this virtual environment..."
  local cmd = string.format(
    '%s -m ipykernel install --user --name="%s"',
    vim.fn.shellescape(venv_path .. "/bin/python"),
    new_kernel_name
  )

  os.execute(cmd)
  vim.notify("Kernel spec '" .. new_kernel_name .. "' created successfully.", vim.log.levels.INFO)
  return new_kernel_name
end

---@type LazySpec
return {
  "benlubas/molten-nvim",
  lazy = false,
  version = "^1", -- use version <2.0.0 to avoid breaking changes
  build = ":UpdateRemotePlugins",
  dependencies = {
    { "AstroNvim/astroui", opts = { icons = { Molten = "󱓞" } } },
    {
      "AstroNvim/astrocore",
      opts = function(_, opts)
        if not opts.mappings then opts.mappings = {} end
        local prefix = "<leader>m"

        opts.mappings.n[prefix] = { desc = require("astroui").get_icon("Molten", 1, true) .. "Molten" }
        opts.mappings.n[prefix .. "e"] = { "<Cmd>MoltenEvaluateOperator<CR>", desc = "Run operator selection" }
        opts.mappings.n[prefix .. "l"] = { "<Cmd>MoltenEvaluateLine<CR>", desc = "Evaluate line" }
        opts.mappings.n[prefix .. "c"] = { "<Cmd>MoltenReevaluateCell<CR>", desc = "Re-evaluate cell" }

        opts.mappings.n[prefix .. "m"] = { desc = "Commands" }
        opts.mappings.n[prefix .. "mi"] = { "<Cmd>MoltenInit<CR>", desc = "Initialize the plugin" }
        opts.mappings.n[prefix .. "mh"] = { "<Cmd>MoltenHideOutput<CR>", desc = "Hide Output" }
        opts.mappings.n[prefix .. "mI"] = { "<Cmd>MoltenInterrupt<CR>", desc = "Interrupt Kernel" }
        opts.mappings.n[prefix .. "mR"] = { "<Cmd>MoltenRestart<CR>", desc = "Restart Kernel" }
        -- Dynamic Kernel Initialization based on Python Virtual Environment
        opts.mappings.n[prefix .. "mp"] = {
          function()
            local kernel_name = ensure_kernel_for_venv()
            if kernel_name then
              vim.cmd(("MoltenInit %s"):format(kernel_name))
            else
              vim.notify("No kernel to initialize.", vim.log.levels.WARN)
            end
          end,
          desc = "Initialize for Python venv",
          silent = true,
        }

        opts.mappings.v[prefix] = { desc = require("astroui").get_icon("Molten", 1, true) .. "Molten" }
        opts.mappings.v[prefix .. "r"] = { ":<C-u>MoltenEvaluateVisual<CR>gv", desc = "Evaluate visual selection" }

        opts.mappings.n["]c"] = { "<Cmd>MoltenNext<CR>", desc = "Next Molten Cel" }
        opts.mappings.n["[c"] = { "<Cmd>MoltenPrev<CR>", desc = "Previous Molten Cell" }
      end,
    },
    {
      -- Configure heirline.nvim to add the Molten status component
      "rebelot/heirline.nvim",
      opts = function(_, opts)
        local utils = require "heirline.utils"
        local molten_component = {
          provider = function()
            -- Display the status of Molten and attached kernels
            local init_status = require("molten.status").initialized()
            local kernel_status = require("molten.status").kernels()
            local info = (init_status ~= "" and init_status .. ": ") .. kernel_status
            return info ~= "" and info or ""
          end,
          condition = function() return require("molten.status").initialized() ~= "" end,
          padding = { left = 1, right = 1 },
          hl = function()
            local theme_hl = utils.get_highlight "@comment.note"
            return {
              bg = theme_hl.bg,
              fg = theme_hl.fg,
            }
          end,
        }
        local spacer = { provider = " " }
        table.insert(opts.statusline, #opts.statusline, spacer)
        table.insert(opts.statusline, #opts.statusline, molten_component)
      end,
    },
  },
}
