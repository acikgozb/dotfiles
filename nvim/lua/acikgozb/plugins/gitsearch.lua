return {
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
	end,
}
