return {
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
}
