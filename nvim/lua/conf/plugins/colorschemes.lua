return {
  -- Tema 1: Catppuccin
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    opts = {
      flavour = "mocha", 
      transparent_background = true, 
      term_colors = true, 
    },
  },

  -- Tema 2: Gentleman Kanagawa Blur
  {
    "Gentleman-Programming/gentleman-kanagawa-blur",
    name = "gentleman-kanagawa-blur",
    lazy = false, -- Para que cargue de golpe
    priority = 1000,
  },

  -- Tema 3: Oldworld
  {
    "Alan-TheGentleman/oldworld.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
  },

  -- Tema 4: Kanagawa Original
  {
    "rebelot/kanagawa.nvim",
    priority = 1000,
    lazy = true,
    config = function()
      require("kanagawa").setup({
        compile = false,
        undercurl = true,
        commentStyle = { italic = true },
        keywordStyle = { italic = true },
        statementStyle = { bold = true },
        transparent = true,
        dimInactive = false,
        terminalColors = true,
        theme = "wave",
        background = { dark = "wave", light = "lotus" },
        overrides = function(colors)
          return {
            LineNr = { bg = "none" },
            NormalFloat = { bg = "none" },
            FloatBorder = { bg = "none" },
            FloatTitle = { bg = "none" },
            TelescopeNormal = { bg = "none" },
            TelescopeBorder = { bg = "none" },
            LspInfoBorder = { bg = "none" },
          }
        end,
      })
    end,
  },
}
