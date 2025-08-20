vim.pack.add({
	{ src = "https://github.com/mrjones2014/smart-splits.nvim" },
	{ src = "https://github.com/wakatime/vim-wakatime" },
})

local ss = require("smart-splits")
vim.keymap.set("n", "<C-h>", ss.move_cursor_left)
vim.keymap.set("n", "<C-j>", ss.move_cursor_down)
vim.keymap.set("n", "<C-k>", ss.move_cursor_up)
-- https://github.com/mrjones2014/smart-splits.nvim/issues/342
vim.keymap.set("n", "<C-l>", function()
	if vim.bo.filetype == "snacks_picker_list" then
		local win_config = vim.api.nvim_win_get_config(0)
		if win_config.zindex == 33 then -- Snack explorer is on same zindex as main window
			vim.cmd("wincmd l")
		end
	else
		require("smart-splits").move_cursor_right()
	end
end)
vim.keymap.set("n", "<C-S-h>", ss.resize_left)
vim.keymap.set("n", "<C-S-j>", ss.resize_down)
vim.keymap.set("n", "<C-S-k>", ss.resize_up)
vim.keymap.set("n", "<C-S-l>", ss.resize_right)
