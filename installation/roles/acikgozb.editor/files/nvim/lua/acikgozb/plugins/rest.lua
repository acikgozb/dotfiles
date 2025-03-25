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
		vim.g.vrc_output_buffer_name = "vrc.buffer.json"

		-- Show the constructed curl command by VRC - used to share output with other people.
		vim.g.vrc_show_command = 1

		-- Custom keymap to run REST query under the cursor
		vim.keymap.set("n", "<leader>vq", ":call VrcQuery()<CR>")
	end,
}
