vim.pack.add({
	{ src = "https://github.com/EdenEast/nightfox.nvim" },
})

vim.api.nvim_create_autocmd("ColorScheme", {
	pattern = "*",
	callback = function()
		vim.api.nvim_set_hl(0, "NormalFloat", { bg = "NONE" })
		vim.api.nvim_set_hl(0, "Pmenu", { bg = "NONE" })
		-- Force transparency (workaround for colorscheme)
		vim.api.nvim_set_hl(0, "BlinkCmpDoc", { link = "NormalFloat" })
		vim.api.nvim_set_hl(0, "BlinkCmpDocBorder", { link = "NormalFloat" })
	end,
})

require("nightfox").setup({
	options = {
		transparent = true,
	},
	palettes = {
		nordfox = {
			sel0 = "#475568",
		},
	},
})

vim.cmd.colorscheme("nordfox")
