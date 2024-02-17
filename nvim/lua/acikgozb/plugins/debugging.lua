vim.g.dotnet_build_project = function()
	local default_path = vim.fn.getcwd() .. "/"
	if vim.g["dotnet_last_proj_path"] ~= nil then
		default_path = vim.g["dotnet_last_proj_path"]
	end

	local path = vim.fn.input("Path to your *proj file", default_path, "file")
	vim.g["dotnet_last_proj_path"] = path

	local cmd = "dotnet build -c Debug " .. path .. " > /dev/null"

	print("")
	print("Cmd to execute: " .. cmd)

	local f = os.execute(cmd)
	if f == 0 then
		print("The project has been built.")
	else
		print("The project has been failed to build.")
	end
end

vim.g.dotnet_get_dll_path = function()
	local request = function()
		return vim.fn.input("Path to dll", vim.fn.getcwd() .. "/bin/Debug/", "file")
	end

	if vim.g["dotnet_last_dll_path"] == nil then
		vim.g["dotnet_last_dll_path"] = request()
	else
		if
			vim.fn.confirm("Do you want to change the path to dll?\n" .. vim.g["dotnet_last_dll_path"], "&yes\n&no", 2)
			== 1
		then
			vim.g["dotnet_last_dll_path"] = request()
		end
	end

	return vim.g["dotnet_last_dll_path"]
end

return {
	"mfussenegger/nvim-dap",
	dependencies = {
		-- "rcarriga/nvim-dap-ui",
		"leoluz/nvim-dap-go",
		"theHamsta/nvim-dap-virtual-text",
	},
	config = function()
		local dap = require("dap")
		local dap_virtual_text = require("nvim-dap-virtual-text")

		-- local dap_ui = require("dapui")
		local dap_go = require("dap-go")

		-- Create a debugging adapter for C#
		local home_path = os.getenv("HOME")
		dap.adapters.coreclr = {
			type = "executable",
			command = home_path .. "/.local/share/nvim/mason/bin/netcoredbg",
			args = { "--interpreter=vscode" }, -- Unfortunately, we need to add VSCode here.
		}

		-- Configure DAP to use the custom adapter we initialized for C#
		dap.configurations.cs = {
			{
				type = "coreclr",
				name = "launch - netcoredbg",
				request = "launch",
				program = function()
					if vim.fn.confirm("Should I recompile first?", "&yes\n&no", 2) == 1 then
						vim.g.dotnet_build_project()
					end
					return vim.g.dotnet_get_dll_path()
				end,
			},
		}

		-- dap_ui.setup()
		dap_virtual_text.setup({
			virt_text_pos = "eol",
		})
		dap_go.setup()

		-- dap.listeners.before.attach.dapui_config = function()
		-- 	dap_ui.open()
		-- end
		--
		-- dap.listeners.before.launch.dapui_config = function()
		-- 	dap_ui.open()
		-- end
		--
		-- dap.listeners.before.event_terminated.dapui_config = function()
		-- 	dap_ui.close()
		-- end
		--
		-- dap.listeners.before.event_exited.dapui_config = function()
		-- 	dap_ui.close()
		-- end

		vim.keymap.set("n", "<Leader>dt", dap.toggle_breakpoint, {})
		vim.keymap.set("n", "<Leader>dta", dap.clear_breakpoints, {})
		vim.keymap.set("n", "<Leader>dc", dap.continue, {})
		vim.keymap.set("n", "<Leader>de", dap.terminate, {})
		vim.keymap.set("n", "<Leader>dsi", dap.step_into, {})
		vim.keymap.set("n", "<Leader>dso", dap.step_over, {})
		vim.keymap.set("n", "<Leader>dse", dap.step_out, {})
		vim.keymap.set("n", "<Leader>dgl", dap.goto_, {}) -- Let the debugger jump to the line under the cursor.
		vim.keymap.set("n", "<Leader>drt", dap.repl.toggle, {})
		vim.keymap.set("n", "<Leader>dgt", dap_go.debug_test, {})
		vim.keymap.set("n", "<Leader>duw", function()
			local widgets = require("dap.ui.widgets")
			widgets.centered_float(widgets.scopes)
		end, {})
		vim.keymap.set("n", "<Leader>duh", require("dap.ui.widgets").hover, {})
		vim.keymap.set("n", "<Leader>dgt", dap_go.debug_test, {})

		-- dap ui keymaps, might delete these if UI is not necessary
		-- vim.keymap.set("n", "<Leader>duo", dap_ui.open, {})
		-- vim.keymap.set("n", "<Leader>duc", dap_ui.close, {})
	end,
}
