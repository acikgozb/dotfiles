local enable_transparent_background = function()
	local highlight_keys = { "Normal", "NonText", "StatusLine", "LineNr", "SignColumn" }

	for _, highlight_key in ipairs(highlight_keys) do
		vim.api.nvim_set_hl(0, highlight_key, { bg = "NONE" })
	end
end

return {
	"jesseleite/nvim-noirbuddy",
	dependencies = {
		"tjdevries/colorbuddy.nvim",
	},
	lazy = false,
	priority = 1000,
	config = function()
		require("noirbuddy").setup({
			preset = "oxide",
		})

		enable_transparent_background()
	end,
}
