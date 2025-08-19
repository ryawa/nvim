-- Leader
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Tab / indentation
vim.o.expandtab = true
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.autoindent = true
vim.o.wrap = false

-- Search
vim.o.inccommand = "split"
vim.o.incsearch = true
vim.o.ignorecase = true
vim.o.smartcase = true

-- Appearance
vim.o.number = true
vim.o.relativenumber = true
vim.o.colorcolumn = "100"
vim.o.signcolumn = "yes"
vim.o.scrolloff = 10
vim.o.winborder = "rounded"
vim.o.cursorline = true
vim.o.title = true

-- Behavior
vim.o.undodir = vim.fn.expand("~/.vim/undodir")
vim.o.undofile = true
vim.o.splitright = true
vim.o.splitbelow = true
vim.o.iskeyword = vim.o.iskeyword .. ",-"
vim.o.mouse = "a"
vim.o.clipboard = "unnamedplus"
vim.o.guicursor = "n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50,\z
    a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor,\z
    sm:block-blinkwait175-blinkoff150-blinkon175"
vim.o.showmode = false
vim.o.fileformats = "unix,dos"
vim.o.virtualedit = "block"
vim.o.shellcmdflag = "-c"
vim.o.shellquote = '"'
vim.o.confirm = true
vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"

-- Folds
vim.o.foldmethod = "expr"
vim.o.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.o.foldtext = ""
vim.o.fillchars = "fold: "
vim.o.foldlevelstart = 2

-- Window management
vim.keymap.set("n", '<Leader>"', "<Cmd>split<CR>")
vim.keymap.set("n", "<Leader>%", "<Cmd>vsplit<CR>")

-- Indenting
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

vim.keymap.set("n", "<Esc>", "<Cmd>nohlsearch<CR>")

require("plugins.colorscheme")
require("plugins.editor")
require("plugins.ui")
require("plugins.treesitter")
require("plugins.lsp")
require("plugins.coding")
require("plugins.completion")
require("plugins.formatting")
require("plugins.linting")
