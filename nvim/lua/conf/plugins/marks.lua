return {
  'chentoast/marks.nvim',
  event = "VeryLazy",
  config = function()
    require('marks').setup({
      -- Marcas por defecto habilitadas
      default_mappings = true,
      
      -- Qué marcas automáticas mostrar
      builtin_marks = { ".", "<", ">", "^" },
      
      -- Ciclo entre marcas con letras
      cyclic = true,
      
      -- Forzar escritura cuando se borra una marca global
      force_write_shada = false,
      
      -- Actualizar marcas al refrescar signos
      refresh_interval = 250,
      
      -- Prioridad en signcolumn
      sign_priority = { lower = 10, upper = 15, builtin = 8, bookmark = 20 },
      
      -- Marcas excluidas (no mostrar en estos tipos de archivo)
      excluded_filetypes = {
        "qf",
        "NvimTree",
        "toggleterm",
        "TelescopePrompt",
        "fzf",
        "oil",
        "alpha",
        "netrw",
      },
      
      -- Tipos de buffer excluidos
      excluded_buftypes = {
        "nofile",
        "terminal",
      },
      
      -- Configuración de bookmarks (0-9)
      bookmark_0 = {
        sign = "⚑",
        virt_text = "",
        annotate = false,
      },
      bookmark_1 = { sign = "󰮱" },
      bookmark_2 = { sign = "󰮲" },
      bookmark_3 = { sign = "󰮳" },
      bookmark_4 = { sign = "󰮴" },
      bookmark_5 = { sign = "󰮵" },
      bookmark_6 = { sign = "󰮶" },
      bookmark_7 = { sign = "󰮷" },
      bookmark_8 = { sign = "󰮸" },
      bookmark_9 = { sign = "󰮹" },
      
      -- Mapeos (default_mappings = true habilita estos automáticamente)
      mappings = {
        set = "m",              -- Crear marca: ma, mb, mc...
        delete = "dm",          -- Borrar marca bajo cursor
        delete_line = "dm-",    -- Borrar todas las marcas de la línea
        delete_buf = "dm<space>", -- Borrar todas las marcas del buffer
        next = "m]",            -- Ir a siguiente marca
        prev = "m[",            -- Ir a marca anterior
        preview = "m:",         -- Preview de marca
        set_next = "m,",        -- Crear marca en siguiente línea disponible
        toggle = "m;",          -- Toggle bookmark en línea actual
        delete_bookmark = "dmx", -- Borrar bookmark bajo cursor
      }
    })
  end
}
