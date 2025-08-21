vim.pack.add({
	{ src = "https://github.com/neovim/nvim-lspconfig" },
	{ src = "https://github.com/mason-org/mason.nvim" },
	{ src = "https://github.com/mason-org/mason-lspconfig.nvim" },
	{ src = "https://github.com/mfussenegger/nvim-jdtls" },
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = "java",
	callback = function()
		local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
		local workspace_dir = "C:/Users/Ryan/jdtls-data/" .. project_name
		local config = {
			cmd = {
				"java",
				"-Declipse.application=org.eclipse.jdt.ls.core.id1",
				"-Dosgi.bundles.defaultStartLevel=4",
				"-Declipse.product=org.eclipse.jdt.ls.core.product",
				"-Dlog.protocol=true",
				"-Dlog.level=ALL",
				"-Xmx1g",
				"--add-modules=ALL-SYSTEM",
				"--add-opens",
				"java.base/java.util=ALL-UNNAMED",
				"--add-opens",
				"java.base/java.lang=ALL-UNNAMED",
				"-jar",
				"C:/Users/Ryan/AppData/Local/nvim-data/mason/packages/jdtls/plugins/org.eclipse.equinox.launcher_1.7.0.v20250519-0528.jar",
				"-configuration",
				"C:/Users/Ryan/AppData/Local/nvim-data/mason/packages/jdtls/config_win/",
				"-data",
				workspace_dir,
			},
			root_dir = require("jdtls.setup").find_root({ ".git", "mvnw", "gradlew" }),
			settings = {
				java = {
					symbols = {
						includeSourceMethodDeclarations = true,
					},
				},
			},
			init_options = {
				bundles = {},
			},
		}
		require("jdtls").start_or_attach(config)
	end,
})

require("mason").setup()
require("mason-lspconfig").setup({
	automatic_enable = {
		exclude = {
			"jdtls",
		},
	},
})

vim.diagnostic.config({
	virtual_text = true,
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = " ",
			[vim.diagnostic.severity.WARN] = " ",
			[vim.diagnostic.severity.HINT] = "󰌵 ",
			[vim.diagnostic.severity.INFO] = "",
		},
	},
})
vim.lsp.inlay_hint.enable(true)
