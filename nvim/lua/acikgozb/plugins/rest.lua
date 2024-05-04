return {
	"diepm/vim-rest-console",
	config = function()
		-- Set the default response content type to JSON
		vim.g.vrc_response_default_content_type = "application/json"
		-- Use jq to format the response
		vim.g.vrc_auto_format_response_patterns = {
			json = "jq",
		}
		-- Turn off the default key binding
		vim.g.vrc_set_default_mapping = 0
		-- Set the output buffer name
		vim.g.vrc_output_buffer_name = "_OUTPUT.json"

		-- Custom keymap to run REST query under the cursor
		vim.keymap.set("n", "<leader>xr", ":call VrcQuery()<CR>")
	end,
}
