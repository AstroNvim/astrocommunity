---@type LazySpec
return {
	"nosduco/remote-sshfs.nvim",
	config = function(_, opts)
		require("remote-sshfs").setup(opts)
		require("telescope").load_extension("remote-sshfs")
	end,
	dependencies = {
		"nvim-telescope/telescope.nvim",
		"nvim-lua/plenary.nvim",
	},
	specs = {
		"AstroNvim/astrocore",
		optional = true,
		opts = function(_, opts)
			local map = opts.mappings
			local api = require("remote-sshfs.api")
			map.n["<leader>R"] = { desc = "Remote" }
			map.n["<leader>Rc"] = { api.connect, desc = "Connect" }
			map.n["<leader>Rd"] = { api.disconnect, desc = "Disconnect" }
			map.n["<leader>Re"] = { api.edit, desc = "Edit" }
			-- Override telescope find_files and live_grep to make dynamic based on if connected to host
			local connections = require("remote-sshfs.connections")
			local builtin = require("telescope.builtin")
			map.n["<leader>ff"] = {
				function()
					if connections.is_connected then
						api.find_files()
					else
						builtin.find_files()
					end
				end,
				desc = "Find files",
			}
			map.n["<leader>fw"] = {
				function()
					if connections.is_connected then
						api.live_grep()
					else
						builtin.live_grep()
					end
				end,
				desc = "Find files",
			}
		end,
	},
}
