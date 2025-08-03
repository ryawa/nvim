return {
    "mason-org/mason-lspconfig.nvim",
	opts = {
		ensure_installed = {
			"efm",
			"lua_ls",
		},
		automatic_installation = true,
	},
	event = "BufReadPre",
	dependencies = {
		{ "mason-org/mason.nvim", opts = {} },
	},
}
