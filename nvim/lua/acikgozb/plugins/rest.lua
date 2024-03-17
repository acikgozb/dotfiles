local gen_rest_template = function(buffer_path)
	local cmd_path = os.getenv("ZSH_PLUGIN_PATH") .. "/placeholder/placeholder.sh"

	vim.system({ cmd_path, "prest", buffer_path }):wait()
	vim.cmd("e!")

	print("the placeholder is generated for the file: " .. buffer_path)
end

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

		-- Add template generation via filetype .rest
		vim.api.nvim_create_autocmd("FileType", {
			pattern = { "rest" },
			callback = function()
				vim.schedule(function()
					vim.keymap.set("n", "<leader>gp", function()
						local buffer_path = vim.api.nvim_buf_get_name(0)
						gen_rest_template(buffer_path)
					end, { buffer = true })
				end)
			end,
		})
	end,
}
