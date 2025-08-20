vim.pack.add({
	{ src = "https://github.com/rafamadriz/friendly-snippets" },
	{ src = "https://github.com/saghen/blink.cmp", version = vim.version.range("*") },
})

-- disable buggy anims in completion windows
local ui_helpers = vim.api.nvim_create_augroup("UiHelpers", { clear = true })

vim.api.nvim_create_autocmd("User", {
	group = ui_helpers,
	pattern = "BlinkCmpMenuOpen",
	callback = function()
		vim.g.snacks_animate = false
	end,
})

vim.api.nvim_create_autocmd("User", {
	group = ui_helpers,
	pattern = "BlinkCmpMenuClose",
	callback = function()
		vim.g.snacks_animate = true
	end,
})

require("blink.cmp").setup({
	-- "default" (recommended) for mappings similar to built-in completions (C-y to accept)
	-- "super-tab" for mappings similar to vscode (tab to accept)
	-- "enter" for enter to accept
	-- "none" for no mappings
	--
	-- All presets have the following mappings:
	-- C-space: Open menu or open docs if already open
	-- C-n/C-p or Up/Down: Select next/previous item
	-- C-e: Hide menu
	-- C-k: Toggle signature help (if signature.enabled = true)
	--
	-- See :h blink-cmp-config-keymap for defining your own keymap
	keymap = { preset = "super-tab" },
	appearance = {
		-- Fix for theme not supporting blink.cmp highlight groups
		nerd_font_variant = "normal",
	},
	completion = { documentation = { auto_show = true } },
	signature = { enabled = true },
	sources = {
		-- add lazydev to your completion providers
		default = { "lazydev", "lsp", "path", "snippets", "buffer" },
		providers = {
			lazydev = {
				name = "LazyDev",
				module = "lazydev.integrations.blink",
				-- make lazydev completions top priority (see `:h blink.cmp`)
				score_offset = 100,
			},
		},
	},
})
