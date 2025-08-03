return {
	"mrjones2014/smart-splits.nvim",
	lazy = false,
	keys = {
		{
			"<C-h>",
			function()
				require("smart-splits").move_cursor_left()
			end,
			desc = "Move to left split",
		},
		{
			"<C-j>",
			function()
				require("smart-splits").move_cursor_down()
			end,
			desc = "Move to bottom split",
		},
		{
			"<C-k>",
			function()
				require("smart-splits").move_cursor_up()
			end,
			desc = "Move to top split",
		},
		{
			"<C-l>",
			function()
				require("smart-splits").move_cursor_right()
			end,
			desc = "Move to right split",
		},
		{
			"<C-S-h>",
			function()
				require("smart-splits").resize_left()
			end,
			desc = "Resize split to left",
		},
		{
			"<C-S-j>",
			function()
				require("smart-splits").resize_down()
			end,
			desc = "Resize split down",
		},
		{
			"<C-S-k>",
			function()
				require("smart-splits").resize_up()
			end,
			desc = "Resize split up",
		},
		{
			"<C-S-l>",
			function()
				require("smart-splits").resize_right()
			end,
			desc = "Resize split to right",
		},
	},
}
