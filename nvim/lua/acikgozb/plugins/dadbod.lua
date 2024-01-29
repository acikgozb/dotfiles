return {
	"tpope/vim-dadbod",
	dependencies = {
		"kristijanhusak/vim-dadbod-ui",
		"kristijanhusak/vim-dadbod-completion",
	},
	config = function()
		local db_completion = function()
			require("cmp").setup.buffer({ sources = { { name = "vim-dadbod-completion" } } })
		end

		vim.g.db_ui_save_location = vim.fn.stdpath("config") .. require("plenary.path").path.sep .. "db_ui"

		vim.api.nvim_create_autocmd("FileType", {
			pattern = {
				"sql",
			},
			command = [[setlocal omnifunc=vim_dadbod_completion#omni]],
		})

		vim.api.nvim_create_autocmd("FileType", {
			pattern = {
				"sql",
				"plsql",
			},
			callback = function()
				vim.schedule(db_completion)
			end,
		})

		vim.keymap.set("n", "<Leader>db", vim.cmd.DBUIToggle)
	end,
}
