-- misc
return {
    { "rafamadriz/friendly-snippets" },
    { "mbbill/undotree" },
    {
        "uga-rosa/ccc.nvim",
        config = function()
            require("ccc").setup({
                highlighter = {
                    auto_enable = true,
                    lsp = true,
                },
            })
        end,
    },
}
