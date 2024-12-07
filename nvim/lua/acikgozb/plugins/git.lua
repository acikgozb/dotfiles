return {
	{
		"tpope/vim-fugitive",
		config = function()
			vim.api.nvim_set_keymap("n", "<leader>glb", ":Git log --graph --decorate --oneline<CR>", { noremap = true })
			vim.api.nvim_set_keymap(
				"n",
				"<leader>gla",
				":Git log --graph --decorate --oneline --all<CR>",
				{ noremap = true }
			)
			vim.api.nvim_set_keymap("n", "<leader>gb", ":Git blame<CR>", { noremap = true })
			vim.api.nvim_set_keymap("n", "<leader>gs", ":G<CR>", { noremap = true })
		end,
	},
	{
		"aaronhallaert/advanced-git-search.nvim",
		dependencies = {
			"nvim-telescope/telescope.nvim",
			"tpope/vim-fugitive",
		},
		config = function()
			vim.api.nvim_create_user_command(
				"DiffCommitLine",
				"lua require('telescope').extensions.advanced_git_search.diff_commit_line()",
				{ range = true }
			)

			vim.api.nvim_set_keymap("v", "<leader>dl", ":DiffCommitLine<CR>", { noremap = true })

			-- Fugitive keymaps.
			vim.api.nvim_set_keymap("n", "<leader>glb", ":Git log --graph --decorate --oneline<CR>", { noremap = true })
			vim.api.nvim_set_keymap(
				"n",
				"<leader>gla",
				":Git log --graph --decorate --oneline --all<CR>",
				{ noremap = true }
			)
			vim.api.nvim_set_keymap("n", "<leader>gb", ":Git blame<CR>", { noremap = true })
			vim.api.nvim_set_keymap("n", "<leader>gs", ":G<CR>", { noremap = true })
		end,
	},
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup({
				on_attach = function(bufnr)
					local gs = package.loaded.gitsigns

					-- rollback changes for current line
					vim.keymap.set("n", "<leader>hr", gs.reset_hunk, { buffer = bufnr })
					-- rollback changes for current line in visual mode
					vim.keymap.set("v", "<leader>hr", function()
						gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
					end, { buffer = bufnr })
					-- preview changes
					vim.keymap.set("n", "<leader>hp", gs.preview_hunk, { buffer = bufnr })
					-- toggle current line blame
					vim.keymap.set("n", "<leader>tb", gs.toggle_current_line_blame, { buffer = bufnr })
				end,
			})
		end,
	},
}
