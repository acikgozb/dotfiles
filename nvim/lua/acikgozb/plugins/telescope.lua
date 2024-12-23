local set_highlight_groups = function()
	local colors = require("noirbuddy.colors").all()

	local telescope_highlight_groups = {
		TelescopeNormal = { fg = colors.secondary, bg = "NONE" },
		TelescopeBorder = { fg = colors.primary, bg = "NONE" },
		TelescopePromptNormal = { fg = colors.none, bg = "NONE" },
		TelescopePromptBorder = { fg = colors.primary, bg = "NONE" },
		TelescopePromptCounter = { fg = colors.white, bg = "NONE" },
		TelescopePromptTitle = { fg = colors.secondary, bg = "NONE", gui = "bold" },
		TelescopeSelectionCaret = { fg = colors.primary, bg = colors.background },
		TelescopeSelection = { fg = colors.secondary, bg = colors.background, gui = "bold" },
		TelescopeMatching = { fg = colors.primary, bg = "NONE", gui = "bold" },
	}

	for group_name, config in pairs(telescope_highlight_groups) do
		local cmd = "highlight " .. group_name
		if config.fg then
			cmd = cmd .. " guifg=" .. config.fg
		end
		if config.bg then
			cmd = cmd .. " guibg=" .. config.bg
		end
		if config.gui then
			cmd = cmd .. " gui=" .. config.gui
		end
		vim.cmd(cmd)
	end
end

return {
	{
		"nvim-telescope/telescope.nvim",
		dependencies = { "nvim-lua/plenary.nvim", "BurntSushi/ripgrep", "nvim-telescope/telescope-fzf-native.nvim" },
		build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build bulid --config Release && cmake --install build --prefix build",
		config = function()
			local builtin = require("telescope.builtin")
			local telescope = require("telescope")

			vim.keymap.set("n", "<leader>ff", function()
				builtin.find_files({
					find_command = { "rg", "--files", "--hidden", "-g", "!.git" },
				})
			end, {})
			vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
			vim.keymap.set("n", "<leader>fsg", builtin.grep_string, {})
			vim.keymap.set("n", "<leader>fo", builtin.oldfiles, {})
			vim.keymap.set("n", "<leader>fbs", builtin.current_buffer_fuzzy_find, {})

			telescope.setup({
				extensions = {
					advanced_git_search = {
						diff_plugin = "fugitive",
						git_flags = { "-c", "delta.side-by-side=false" },
					},
				},
			})

			-- Apply Telescope highlight groups.
			local colors = require("noirbuddy.colors").all()

			local telescope_highlight_groups = {
				TelescopeNormal = { fg = colors.secondary, bg = "NONE" },
				TelescopeBorder = { fg = colors.primary, bg = "NONE" },
				TelescopePromptNormal = { fg = colors.none, bg = "NONE" },
				TelescopePromptBorder = { fg = colors.primary, bg = "NONE" },
				TelescopePromptCounter = { fg = colors.white, bg = "NONE" },
				TelescopePromptTitle = { fg = colors.secondary, bg = "NONE", gui = "bold" },
				TelescopeSelectionCaret = { fg = colors.primary, bg = colors.background },
				TelescopeSelection = { fg = colors.secondary, bg = colors.background, gui = "bold" },
				TelescopeMatching = { fg = colors.primary, bg = "NONE", gui = "bold" },
			}

			for group_name, config in pairs(telescope_highlight_groups) do
				local cmd = "highlight " .. group_name
				if config.fg then
					cmd = cmd .. " guifg=" .. config.fg
				end
				if config.bg then
					cmd = cmd .. " guibg=" .. config.bg
				end
				if config.gui then
					cmd = cmd .. " gui=" .. config.gui
				end
				vim.cmd(cmd)
			end

			set_highlight_groups()
			telescope.load_extension("fzf")
		end,
	},
	{
		"nvim-telescope/telescope-ui-select.nvim",
		config = function()
			require("telescope").setup({
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown({}),
					},
				},
			})

			require("telescope").load_extension("ui-select")
		end,
	},
}
