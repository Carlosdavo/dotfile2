return {
  -- =========================================================================
  -- PLUGIN 1: TELESCOPE
  -- =========================================================================
  {
    "nvim-telescope/telescope.nvim",
    version = "0.1.8",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "nvim-telescope/telescope-ui-select.nvim",
      "LinArcX/telescope-env.nvim",
      "aznhe21/actions-preview.nvim", -- Movido aquí de forma limpia
    },
    cmd = "Telescope",
    keys = function()
      local builtin = require("telescope.builtin")

      local function git_files()
        builtin.find_files({ no_ignore = true })
      end

      return {
        { "<leader>f", builtin.find_files, desc = "Find files" },
        { "<leader>fh", function() require("fzf-lua").files() end, desc = "Find files (FZF)" },
        { "<leader>g", builtin.live_grep, desc = "Live grep" },
        { "<leader>sg", git_files, desc = "Find files (no ignore)" },
        { "<leader>fb", builtin.buffers, desc = "Buffers" },
        { "<leader>fi", builtin.grep_string, desc = "Grep string" },
        { "<leader>fo", builtin.oldfiles, desc = "Old files" },
        { "<leader>sh", builtin.help_tags, desc = "Help tags" },
        { "<leader>fm", builtin.man_pages, desc = "Man pages" },
        { "<leader>G", builtin.git_commits, desc = "Git commits" },
        { "<leader>fr", builtin.lsp_references, desc = "LSP references" },
        { "<leader>fd", builtin.diagnostics, desc = "Diagnostics" },
        { "<leader>fT", builtin.lsp_type_definitions, desc = "LSP type definitions" },
        { "<leader>ss", builtin.current_buffer_fuzzy_find, desc = "Fuzzy find in buffer" },
        { "<leader>st", builtin.builtin, desc = "Telescope builtins" },
        { "<leader>fk", builtin.keymaps, desc = "Keymaps" },
        { "<leader>se", "<cmd>Telescope env<cr>", desc = "Env vars" },
        { "<leader>sa", function() require("actions-preview").code_actions() end, desc = "Code actions" },
      }
    end,
    config = function()
      local telescope = require("telescope")

      telescope.setup({
        defaults = {
          preview = { treesitter = true },
          color_devicons = true,
          sorting_strategy = "ascending",
          borderchars = { "", "", "", "", "", "", "", "" },
          path_displays = { "smart" },
          layout_config = {
            height = 100,
            width = 400,
            prompt_position = "top",
            preview_cutoff = 40,
          },
        },
      })

      telescope.load_extension("ui-select")
      telescope.load_extension("env")
    end,
  },

  -- =========================================================================
  -- PLUGIN 2: FZF-LUA
  -- =========================================================================
  {
    "ibhagwan/fzf-lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("fzf-lua").setup({})
      
      -- Configuramos Actions Preview una sola vez para que use FZF como backend
      require("actions-preview").setup({
        backend = { "fzf-lua" },
        extensions = { "env" },
      })
    end,
  },
}
