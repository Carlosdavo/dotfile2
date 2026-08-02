return {
    "epwalsh/obsidian.nvim",
    version = "*",
    lazy = true,
    ft = "markdown",
    cmd = {
        "ObsidianBacklinks", "ObsidianDailies", "ObsidianExtractNote",
        "ObsidianFollowLink", "ObsidianLink", "ObsidianLinkNew",
        "ObsidianLinks", "ObsidianNew", "ObsidianNewFromTemplate",
        "ObsidianOpen", "ObsidianPasteImg", "ObsidianQuickSwitch",
        "ObsidianRename", "ObsidianSearch", "ObsidianTags",
        "ObsidianTemplate", "ObsidianToday", "ObsidianToggleCheckbox",
        "ObsidianTomorrow", "ObsidianTOC", "ObsidianYesterday",
    },
    keys = {
        { "<leader>ob", "<cmd>ObsidianBacklinks<CR>",   desc = "Obsidian backlinks" },
        { "<leader>od", "<cmd>ObsidianToday<CR>",       desc = "Obsidian daily note" },
        { "<leader>ol", "<cmd>ObsidianLinks<CR>",       desc = "Obsidian note links" },
        { "<leader>oo", "<cmd>ObsidianOpen<CR>",        desc = "Open in Obsidian" },
        { "<leader>oq", "<cmd>ObsidianQuickSwitch<CR>", desc = "Obsidian quick switch" },
        { "<leader>os", "<cmd>ObsidianSearch<CR>",      desc = "Search Obsidian notes" },
        { "<leader>ot", "<cmd>ObsidianTemplate<CR>",    desc = "Insert Obsidian template" },
        { "<leader>oT", "<cmd>ObsidianTOC<CR>",         desc = "Obsidian table of contents" },
    },
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-telescope/telescope.nvim",
        "hrsh7th/nvim-cmp",
    },
    opts = {
        workspaces = {
            {
                name = "personal",
                path = vim.fn.expand("~/Obsidian Vault"),
            },
        },
        daily_notes = {
            folder = "daily",
        },
        completion = {
            nvim_cmp = true,
            min_chars = 2,
        },
        ui = {
            enable = true,
        },
    },
}
