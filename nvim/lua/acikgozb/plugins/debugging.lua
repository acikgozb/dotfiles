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
	dependencies = { "rcarriga/nvim-dap-ui", "leoluz/nvim-dap-go" },
	config = function()
		local dap = require("dap")
		local dap_ui = require("dapui")

		-- Enable logger to diagnose errors between DAP and adapters
		dap.set_log_level("DEBUG")

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

		dap_ui.setup()
		require("dap-go").setup()

		dap.listeners.before.attach.dapui_config = function()
			dap_ui.open()
		end

		dap.listeners.before.launch.dapui_config = function()
			dap_ui.open()
		end

		dap.listeners.before.event_terminated.dapui_config = function()
			dap_ui.close()
		end

		dap.listeners.before.event_exited.dapui_config = function()
			dap_ui.close()
		end

		vim.keymap.set("n", "<Leader>dt", dap.toggle_breakpoint, {})
		vim.keymap.set("n", "<Leader>dc", dap.continue, {})
		vim.keymap.set("n", "<Leader>de", dap.terminate, {})
		vim.keymap.set("n", "<Leader>dsi", dap.step_into, {})
		vim.keymap.set("n", "<Leader>dso", dap.step_over, {})
		vim.keymap.set("n", "<Leader>dse", dap.step_out, {})
	end,
}
