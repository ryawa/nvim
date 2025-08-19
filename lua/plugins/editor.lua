vim.pack.add({
    { src = "https://github.com/mrjones2014/smart-splits.nvim" },
    { src = "https://github.com/wakatime/vim-wakatime" },
})

local ss = require("smart-splits")
vim.keymap.set("n", "<C-h>", ss.move_cursor_left)
vim.keymap.set("n", "<C-j>", ss.move_cursor_down)
vim.keymap.set("n", "<C-k>", ss.move_cursor_up)
vim.keymap.set("n", "<C-l>", ss.move_cursor_right)
vim.keymap.set("n", "<C-S-h>", ss.resize_left)
vim.keymap.set("n", "<C-S-j>", ss.resize_down)
vim.keymap.set("n", "<C-S-k>", ss.resize_up)
vim.keymap.set("n", "<C-S-l>", ss.resize_right)
