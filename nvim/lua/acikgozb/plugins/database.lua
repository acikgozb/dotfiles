return {
	"kndndrj/nvim-dbee",
	dependencies = {
		"MunifTanjim/nui.nvim",
	},
	build = function()
		require("dbee").install("cgo")
	end,
	config = function()
		local dbee = require("dbee")
		dbee.setup({
			sources = {
				require("dbee.sources").EnvSource:new("DB_CONNECTIONS"),
			},
		})

		vim.keymap.set("n", "<Leader>dbo", dbee.open)
		vim.keymap.set("n", "<Leader>dbc", dbee.close)
	end,
}
