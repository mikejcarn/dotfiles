local dap = require('dap')

dap.adapters.node2 = {
	type = "executable",
	command = "node",
	args = { "/usr/lib/vscode-node-debug2/out/src/nodeDebug.js" },
}

dap.configurations.javascript = {
	{
		name = "Launch",
		type = "node2",
		request = "launch",
		program = "${file}",
		cwd = vim.fn.getcwd(),
		sourceMaps = true,
		protocol = "inspector",
		console = "integratedTerminal",
	},
	{
		-- Must run node process with `--inspect` flag
		name = "Attach to process",
		type = "node2",
		request = "attach",
		processId = require("dap.utils").pick_process,
	},
}

