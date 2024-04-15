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

			telescope.load_extension("fzf")
			telescope.load_extension("advanced_git_search")
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
