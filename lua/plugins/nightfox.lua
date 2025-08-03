return {
	"EdenEast/nightfox.nvim",
	lazy = false,
	priority = 999,
	config = function()
		require("nightfox").setup({
			options = {
				transparent = true,
			},
		})
		vim.cmd.colorscheme("nordfox")
	end,
}
