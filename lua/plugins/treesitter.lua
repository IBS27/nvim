require("nvim-treesitter.configs").setup {
    ensure_installed = {
        "python",
        "c",
        "cpp",
        "html",
        "css",
        "lua",
        "comment",
        "json",
        "javascript",
        "json5",
        "markdown",
        "json",
    },
    highlight = {
        enable = true, -- false will disable the whole extension
        disable = { "html", "css" },
        additional_vim_regex_highlighting = true,
    },
    indent = {
        enable = true,
        disable = { "python" },
    },
    autotag = {
        enable = true,
    },
    context_commentstring = {
        enable = true,
    },
    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = "<C-n>",
            node_incremental = "<C-n>",
            scope_incremental = "<C-s>",
            node_decremental = "<C-r>",
        },
    },
}
