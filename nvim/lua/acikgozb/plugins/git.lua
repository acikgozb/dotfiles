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
		end,
	},
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup({
				on_attach = function(bufnr)
					local gs = package.loaded.gitsigns

					vim.keymap.set("n", "<leader>hr", gs.reset_hunk, { buffer = bufnr })
					vim.keymap.set("v", "<leader>hr", function()
						gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
					end, { buffer = bufnr })
					vim.keymap.set("n", "<leader>hp", gs.preview_hunk, { buffer = bufnr })
					vim.keymap.set("n", "<leader>tb", gs.toggle_current_line_blame, { buffer = bufnr })
				end,
			})
		end,
	},
}
