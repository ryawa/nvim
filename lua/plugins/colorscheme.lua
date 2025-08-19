vim.pack.add({
    { src = "https://github.com/EdenEast/nightfox.nvim" },
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
