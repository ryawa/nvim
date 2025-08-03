-- Window management
vim.keymap.set("n", '<Leader>"', "<Cmd>split<CR>")
vim.keymap.set("n", "<Leader>%", "<Cmd>vsplit<CR>")

-- Indenting
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

vim.keymap.set("n", "<Esc>", "<Cmd>nohlsearch<CR>")
