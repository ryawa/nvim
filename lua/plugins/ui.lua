vim.pack.add({
	{ src = "https://github.com/nvim-tree/nvim-web-devicons" },
	{ src = "https://github.com/nvim-lualine/lualine.nvim" },
	{ src = "https://github.com/folke/which-key.nvim" },
	{ src = "https://github.com/folke/snacks.nvim" },
})

vim.api.nvim_create_autocmd("CursorMoved", {
	group = vim.api.nvim_create_augroup("auto-hlsearch", { clear = true }),
	callback = function()
		if vim.v.hlsearch == 1 and vim.fn.searchcount().exact_match == 0 then
			vim.schedule(function()
				vim.cmd.nohlsearch()
			end)
		end
	end,
})

vim.api.nvim_create_autocmd("TextYankPost", {
	pattern = "*",
	callback = function()
		vim.highlight.on_yank({ higroup = "IncSearch", timeout = 500 })
	end,
})

local time_spent = ""

local timer = vim.uv.new_timer()
timer:start(
	0,
	60 * 1000,
	vim.schedule_wrap(function()
		local function on_exit(obj)
			if obj.code == 0 then
				time_spent = obj.stdout:sub(1, -2)
			end
		end
		local path = vim.fn.expand("~") .. "/.wakatime/wakatime-cli"
		vim.system({ path, "--today" }, { text = true }, on_exit)
	end)
)

require("lualine").setup({
	options = {
		globalstatus = true,
	},
	sections = {
		lualine_c = {
			"buffers",
		},
		lualine_x = {
			{
				function()
					return time_spent
				end,
				icon = "󱑆",
			},
			"encoding",
			"fileformat",
			"filetype",
		},
	},
})

local wk = require("which-key")
wk.add({
	{
		"<Leader>?",
		function()
			wk.show({ global = false })
		end,
		desc = "Buffer local keymaps (which-key)",
	},
})

require("snacks").setup({
	explorer = { enabled = true },
	indent = { enabled = true },
	notifier = { enabled = true },
	picker = {
		enabled = true,
		hidden = true,
	},
	scope = { enabled = true },
	scroll = { enabled = true },
	statuscolumn = { enabled = true },
	words = { enabled = true },
	styles = {
		notification = {
			wo = { wrap = true }, -- Wrap notifications
		},
	},
})

wk.add({
	-- Top Pickers & Explorer
	{
		"<leader><space>",
		function()
			Snacks.picker.smart()
		end,
		desc = "Smart Find Files",
	},
	{
		"<leader>,",
		function()
			Snacks.picker.buffers()
		end,
		desc = "Buffers",
	},
	{
		"<leader>/",
		function()
			Snacks.picker.grep()
		end,
		desc = "Grep",
	},
	{
		"<leader>:",
		function()
			Snacks.picker.command_history()
		end,
		desc = "Command History",
	},
	-- {
	-- 	"<leader>n",
	-- 	function()
	-- 		Snacks.picker.notifications()
	-- 	end,
	-- 	desc = "Notification History",
	-- },
	{
		"<leader>e",
		function()
			Snacks.explorer()
		end,
		desc = "File Explorer",
	},
	-- Find
	{
		"<leader>fb",
		function()
			Snacks.picker.buffers()
		end,
		desc = "Buffers",
	},
	{
		"<leader>fc",
		function()
			Snacks.picker.files({ cwd = vim.fn.stdpath("config") })
		end,
		desc = "Find Config File",
	},
	{
		"<leader>ff",
		function()
			Snacks.picker.files()
		end,
		desc = "Find Files",
	},
	{
		"<leader>fg",
		function()
			Snacks.picker.git_files()
		end,
		desc = "Find Git Files",
	},
	{
		"<leader>fp",
		function()
			Snacks.picker.projects()
		end,
		desc = "Projects",
	},
	{
		"<leader>fr",
		function()
			Snacks.picker.recent()
		end,
		desc = "Recent",
	},
	-- Git
	{
		"<leader>gb",
		function()
			Snacks.picker.git_branches()
		end,
		desc = "Git Branches",
	},
	{
		"<leader>gl",
		function()
			Snacks.picker.git_log()
		end,
		desc = "Git Log",
	},
	{
		"<leader>gL",
		function()
			Snacks.picker.git_log_line()
		end,
		desc = "Git Log Line",
	},
	{
		"<leader>gs",
		function()
			Snacks.picker.git_status()
		end,
		desc = "Git Status",
	},
	{
		"<leader>gS",
		function()
			Snacks.picker.git_stash()
		end,
		desc = "Git Stash",
	},
	{
		"<leader>gd",
		function()
			Snacks.picker.git_diff()
		end,
		desc = "Git Diff (Hunks)",
	},
	{
		"<leader>gf",
		function()
			Snacks.picker.git_log_file()
		end,
		desc = "Git Log File",
	},
	-- Grep
	{
		"<leader>sb",
		function()
			Snacks.picker.lines()
		end,
		desc = "Buffer Lines",
	},
	{
		"<leader>sB",
		function()
			Snacks.picker.grep_buffers()
		end,
		desc = "Grep Open Buffers",
	},
	{
		"<leader>sg",
		function()
			Snacks.picker.grep()
		end,
		desc = "Grep",
	},
	{
		"<leader>sw",
		function()
			Snacks.picker.grep_word()
		end,
		desc = "Visual selection or word",
		mode = { "n", "x" },
	},
	-- Search
	{
		'<leader>s"',
		function()
			Snacks.picker.registers()
		end,
		desc = "Registers",
	},
	{
		"<leader>s/",
		function()
			Snacks.picker.search_history()
		end,
		desc = "Search History",
	},
	{
		"<leader>sa",
		function()
			Snacks.picker.autocmds()
		end,
		desc = "Autocmds",
	},
	{
		"<leader>sb",
		function()
			Snacks.picker.lines()
		end,
		desc = "Buffer Lines",
	},
	{
		"<leader>sc",
		function()
			Snacks.picker.command_history()
		end,
		desc = "Command History",
	},
	{
		"<leader>sC",
		function()
			Snacks.picker.commands()
		end,
		desc = "Commands",
	},
	{
		"<leader>sd",
		function()
			Snacks.picker.diagnostics()
		end,
		desc = "Diagnostics",
	},
	{
		"<leader>sD",
		function()
			Snacks.picker.diagnostics_buffer()
		end,
		desc = "Buffer Diagnostics",
	},
	{
		"<leader>sh",
		function()
			Snacks.picker.help()
		end,
		desc = "Help Pages",
	},
	{
		"<leader>sH",
		function()
			Snacks.picker.highlights()
		end,
		desc = "Highlights",
	},
	{
		"<leader>si",
		function()
			Snacks.picker.icons()
		end,
		desc = "Icons",
	},
	{
		"<leader>sj",
		function()
			Snacks.picker.jumps()
		end,
		desc = "Jumps",
	},
	{
		"<leader>sk",
		function()
			Snacks.picker.keymaps()
		end,
		desc = "Keymaps",
	},
	{
		"<leader>sl",
		function()
			Snacks.picker.loclist()
		end,
		desc = "Location List",
	},
	{
		"<leader>sm",
		function()
			Snacks.picker.marks()
		end,
		desc = "Marks",
	},
	{
		"<leader>sM",
		function()
			Snacks.picker.man()
		end,
		desc = "Man Pages",
	},
	{
		"<leader>sp",
		function()
			Snacks.picker.lazy()
		end,
		desc = "Search for Plugin Spec",
	},
	{
		"<leader>sq",
		function()
			Snacks.picker.qflist()
		end,
		desc = "Quickfix List",
	},
	{
		"<leader>sR",
		function()
			Snacks.picker.resume()
		end,
		desc = "Resume",
	},
	{
		"<leader>su",
		function()
			Snacks.picker.undo()
		end,
		desc = "Undo History",
	},
	{
		"<leader>uC",
		function()
			Snacks.picker.colorschemes()
		end,
		desc = "Colorschemes",
	},
	-- LSP
	{
		"gd",
		function()
			Snacks.picker.lsp_definitions()
		end,
		desc = "Goto Definition",
	},
	{
		"gD",
		function()
			Snacks.picker.lsp_declarations()
		end,
		desc = "Goto Declaration",
	},
	{
		"gr",
		function()
			Snacks.picker.lsp_references()
		end,
		nowait = true,
		desc = "References",
	},
	{
		"gI",
		function()
			Snacks.picker.lsp_implementations()
		end,
		desc = "Goto Implementation",
	},
	{
		"gy",
		function()
			Snacks.picker.lsp_type_definitions()
		end,
		desc = "Goto T[y]pe Definition",
	},
	{
		"<leader>ss",
		function()
			Snacks.picker.lsp_symbols()
		end,
		desc = "LSP Symbols",
	},
	{
		"<leader>sS",
		function()
			Snacks.picker.lsp_workspace_symbols()
		end,
		desc = "LSP Workspace Symbols",
	},
	-- Other
	-- { "<leader>z",  function() Snacks.zen() end, desc = "Toggle Zen Mode" },
	-- { "<leader>Z",  function() Snacks.zen.zoom() end, desc = "Toggle Zoom" },
	-- { "<leader>.",  function() Snacks.scratch() end, desc = "Toggle Scratch Buffer" },
	-- { "<leader>S",  function() Snacks.scratch.select() end, desc = "Select Scratch Buffer" },
	{
		"<leader>n",
		function()
			Snacks.notifier.show_history()
		end,
		desc = "Notification History",
	},
	-- { "<leader>bd", function() Snacks.bufdelete() end, desc = "Delete Buffer" },
	-- { "<leader>cR", function() Snacks.rename.rename_file() end, desc = "Rename File" },
	-- { "<leader>gB", function() Snacks.gitbrowse() end, desc = "Git Browse", mode = { "n", "v" } },
	-- { "<leader>gg", function() Snacks.lazygit() end, desc = "Lazygit" },
	-- { "<leader>un", function() Snacks.notifier.hide() end, desc = "Dismiss All Notifications" },
	-- { "<c-/>",      function() Snacks.terminal() end, desc = "Toggle Terminal" },
	-- { "<c-_>",      function() Snacks.terminal() end, desc = "which_key_ignore" },
	{
		"]]",
		function()
			Snacks.words.jump(vim.v.count1)
		end,
		desc = "Next Reference",
		mode = { "n", "t" },
	},
	{
		"[[",
		function()
			Snacks.words.jump(-vim.v.count1)
		end,
		desc = "Prev Reference",
		mode = { "n", "t" },
	},
})
