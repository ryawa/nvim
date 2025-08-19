vim.pack.add({
    { src = "https://github.com/folke/lazydev.nvim" },
    { src = "https://github.com/windwp/nvim-ts-autotag" },
})

require("lazydev").setup({
    library = {
        -- See the configuration section for more details
        -- Load luvit types when the `vim.uv` word is found
        { path = "${3rd}/luv/library", words = { "vim%.uv" } },
    },
})
require("nvim-ts-autotag").setup()
