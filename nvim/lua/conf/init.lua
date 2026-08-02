vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.cmd([[set mouse=]])
vim.cmd([[set noswapfile]])
vim.cmd([[hi @lsp.type.number gui=bold]])

require "conf.options"
require "conf.keymap"
require "conf.lazy_init"

-- vim.cmd.colorscheme("bark")
vim.diagnostic.config({
    float = { border = "single" },
    virtual_text = true,
})
vim.opt.termguicolors = true
vim.opt.shell = "zsh"
vim.opt.fillchars:append({ eob = " " })
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.signcolumn = "yes"
vim.opt.scrolloff = 8
vim.opt.splitright = true
vim.opt.shortmess:append("A")
vim.opt.shada = { "'10", "<0", "s10", "h" }
vim.o.iminsert = 0
vim.o.imsearch = 0
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.o.langnoremap = true
vim.opt.showmode = false
vim.opt.cursorline = true

vim.opt.ignorecase = true
vim.opt.smartcase = true
-- vim.opt.inccommand = "split"

vim.opt.smartindent = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.formatoptions:remove("o")
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undofile = true
vim.opt.undodir = vim.fn.stdpath("data") .. "/undo"

vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking (copying) text",
  callback = function()
    vim.hl.on_yank()
  end, 
})

vim.opt.timeoutlen = 1000 -- im getting old
vim.opt.clipboard = "unnamedplus"

-- 1. Ocultamos el "-- VISUAL --" gris de abajo porque ahora estará integrado arriba
vim.opt.showmode = false

-- 2. Definimos los colores exactos usando códigos Hexadecimales
-- (Puedes ajustar estos hex si quieres un tono exacto de tu terminal)
vim.cmd([[
  hi ModeNormal  guifg=#D3B987 gui=bold  " Amarillo Everforest
  hi ModeInsert  guifg=#7FBBB3 gui=bold  " Azul Everforest
  hi ModeVisual  guifg=#E67E80 gui=bold  " Rosa claro / Rojo suave
]])

-- 3. Función para capturar el modo actual con su color específico
local function get_current_mode()
  local mode_code = vim.api.nvim_get_mode().mode
  
  if mode_code == "n" then
    return "%#ModeNormal# NORMAL %*"
  elseif mode_code == "i" or mode_code == "ic" then
    return "%#ModeInsert# INSERT %*"
  elseif mode_code == "v" or mode_code == "V" or mode_code == "" then
    return "%#ModeVisual# VISUAL %*"
  else
    return "%#ModeNormal# NORMAL %*"
  end
end

-- 4. Tu barra nativa minimalista uniendo todo
function NativeStatusLine()
  local mode = get_current_mode()        -- El modo coloreado (Amarillo, Azul, Rosa)
  local file_path = " %f"                -- Ruta del archivo (ej: Proyectos/main.c)
  local modified = " %m"                 -- Marca [+]
  local align = "%="                     -- Empuja el resto a la derecha
  local line_col = "%l,%c "              -- Línea,Columna
  local percentage = " %P "              -- Porcentaje (All)

  return string.format("%s%s%s%s%s%s", mode, file_path, modified, align, line_col, percentage)
end

vim.opt.statusline = "%{%v:lua.NativeStatusLine()%}"
