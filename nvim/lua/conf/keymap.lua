-- ╔═══════════════════════════════════════════════════════════════════════════╗
-- ║              CONFIGURACIÓN DE KEYMAPS PARA FZF - NEOVIM                  ║
-- ║                  Optimizada para usuarios de fzf.vim                     ║
-- ╚═══════════════════════════════════════════════════════════════════════════╝

-- ─────────────────────────────────────────────────────────────────────────────
-- 1. CONFIGURACIÓN INICIAL
-- ─────────────────────────────────────────────────────────────────────────────

local opts = { noremap = true, silent = true }
local term_opts = { silent = true }
local keymap = vim.api.nvim_set_keymap
local map = vim.keymap.set

-- Definir tecla líder (ESPACIO)
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- ─────────────────────────────────────────────────────────────────────────────
-- 2. NAVEGACIÓN DE VENTANAS (Windows Navigation)
-- ─────────────────────────────────────────────────────────────────────────────

keymap("n", "<C-h>", "<C-w>h", opts)           -- Ir a ventana izquierda
keymap("n", "<C-j>", "<C-w>j", opts)           -- Ir a ventana inferior
keymap("n", "<C-k>", "<C-w>k", opts)           -- Ir a ventana superior
keymap("n", "<C-l>", "<C-w>l", opts)           -- Ir a ventana derecha

-- ─────────────────────────────────────────────────────────────────────────────
-- 3. NAVEGACIÓN DE BUFFERS
-- ─────────────────────────────────────────────────────────────────────────────

keymap("n", "<S-l>", ":bnext<CR>", opts)       -- Buffer siguiente (Shift+L)
keymap("n", "<S-h>", ":bprevious<CR>", opts)   -- Buffer anterior (Shift+H)
keymap("n", "<leader>a", ":edit #<CR>", opts)  -- Alternar entre buffers

-- ─────────────────────────────────────────────────────────────────────────────
-- 4. REDIMENSIONAMIENTO DE VENTANAS
-- ─────────────────────────────────────────────────────────────────────────────

-- Con flechas (más preciso)
keymap("n", "<C-Up>", ":resize +1<CR>", opts)
keymap("n", "<C-Down>", ":resize -1<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -1<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +1<CR>", opts)

-- Con Alt (alternativa, más rápido)
map("n", "<M-n>", "<cmd>resize +2<CR>", { desc = "Resize: Height +" })
map("n", "<M-e>", "<cmd>resize -2<CR>", { desc = "Resize: Height -" })
map("n", "<M-i>", "<cmd>vertical resize +5<CR>", { desc = "Resize: Width +" })
map("n", "<M-m>", "<cmd>vertical resize -5<CR>", { desc = "Resize: Width -" })

-- ─────────────────────────────────────────────────────────────────────────────
-- 5. DESPLAZAMIENTO CENTRADO (Centered Navigation)
-- ─────────────────────────────────────────────────────────────────────────────

keymap("n", "<C-d>", "<C-d>zz", opts)          -- Page Down centrado
keymap("n", "<C-u>", "<C-u>zz", opts)          -- Page Up centrado
map("n", "n", "nzzzv", { desc = "Next match centered" })        -- Siguiente búsqueda centrada
map("n", "N", "Nzzzv", { desc = "Previous match centered" })    -- Anterior búsqueda centrada

-- ─────────────────────────────────────────────────────────────────────────────
-- 7. MOVIMIENTO DE LÍNEAS (Move Lines Up/Down)
-- ─────────────────────────────────────────────────────────────────────────────

-- Modo Visual: Alt+j/k para mover líneas
keymap("v", "<A-j>", ":m .+1<CR>==", opts)     -- Mover línea abajo
keymap("v", "<A-k>", ":m .-2<CR>==", opts)     -- Mover línea arriba

-- Modo Visual Block: J/K o Alt+j/k
keymap("x", "J", ":move '>+1<CR>gv=gv", opts)  -- Mover bloque abajo
keymap("x", "K", ":move '<-2<CR>gv=gv", opts)  -- Mover bloque arriba
keymap("x", "<A-j>", ":move '>+1<CR>gv=gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv=gv", opts)

-- ─────────────────────────────────────────────────────────────────────────────
-- 8. PORTAPAPELES (Clipboard)
-- ─────────────────────────────────────────────────────────────────────────────

map({ "n", "x" }, "<leader>y", '"+y', { desc = "Copy to system clipboard" })
map({ "v", "x", "n" }, "<C-y>", '"+y', { desc = "System clipboard yank" })
map({ "n", "x" }, "<leader>d", '"+d', { desc = "Delete and copy to clipboard" })

-- Paste sin perder registro
keymap("v", "p", '"_dP', opts)                 -- Paste en visual mode (modo v)
keymap("x", "p", '"_dP', opts)                 -- Paste en visual block (modo x)

-- ─────────────────────────────────────────────────────────────────────────────
-- 9. INDENTACIÓN (Indentation)
-- ─────────────────────────────────────────────────────────────────────────────

map("v", "<", "<gv", { desc = "Indent left (keep selection)" })
map("v", ">", ">gv", { desc = "Indent right (keep selection)" })

-- ─────────────────────────────────────────────────────────────────────────────
-- 10. BÚSQUEDA Y REEMPLAZO (Search & Replace)
-- ─────────────────────────────────────────────────────────────────────────────

map({ "n", "v", "x" }, "<ESC>", ":nohlsearch<CR>", opts)  -- ESC = limpiar búsqueda
map({ "n", "v", "x" }, "<C-s>", [[:s/\V]], { desc = "Enter substitute mode" })
map("n", "<C-c>", "<Cmd>qa!<CR>", { desc = "Quit Neovim" })

-- ─────────────────────────────────────────────────────────────────────────────
-- 11. NAVEGACIÓN RÁPIDA (Quick Navigation)
-- ─────────────────────────────────────────────────────────────────────────────

map("n", "gl", "$", { desc = "Jump to end of line" })  -- gl = final de línea
map({ "n", "v", "x" }, "<CR>", ":", { desc = "Command mode" })

-- ─────────────────────────────────────────────────────────────────────────────
-- 12. SNIPPET NAVIGATION (Si usas LuaSnip) - CON MANEJO DE ERRORES
-- ─────────────────────────────────────────────────────────────────────────────

local ok, ls = pcall(require, "luasnip")
if ok then
	map({ "i", "s" }, "<C-e>", function() ls.expand_or_jump(1) end, { silent = true, desc = "Expand or jump" })
	map({ "i", "s" }, "<C-J>", function() ls.jump(1) end, { silent = true, desc = "Jump next" })
	map({ "i", "s" }, "<C-K>", function() ls.jump(-1) end, { silent = true, desc = "Jump previous" })
end

-- SNIPPETS (si tienes fzf-snippet configurado)
-- map("n", "<leader>sn", ":Snippets<CR>", { desc = "Search: Snippets (FZF)" })

-- ─────────────────────────────────────────────────────────────────────────────
-- 14. LSP & CODE ACTIONS (Acciones de lenguaje) - CON MANEJO DE ERRORES
-- ─────────────────────────────────────────────────────────────────────────────

-- Code Actions (actions-preview)
local ok_actions = pcall(require, "actions-preview")
if ok_actions then
	map("n", "<leader>sa", require("actions-preview").code_actions, { desc = "Code: Actions" })
else
	-- Fallback a LSP nativo
	map("n", "<leader>sa", vim.lsp.buf.code_action, { desc = "Code: Actions (LSP)" })
end

-- LSP Format
map("n", "<leader>lf", vim.lsp.buf.format, { desc = "Format: Current buffer (LSP)" })

-- ─────────────────────────────────────────────────────────────────────────────
-- 15. EDITOR & ARCHIVOS (Editor & Files)
-- ─────────────────────────────────────────────────────────────────────────────

-- Explorador de archivos - Neovim nativo o plugins
map("n", "<leader>e", ":Explore<CR>", { desc = "File: Explorer (Netrw)" })

-- Editar archivos de configuración
map({ "n", "v", "x" }, "<leader>v", "<Cmd>edit $MYVIMRC<CR>", { desc = "Edit: init.lua" })
map({ "n", "v", "x" }, "<leader>z", "<Cmd>e ~/.config/zsh/.zshrc<CR>", { desc = "Edit: .zshrc" })
map("n", "<C-f>", "<Cmd>Open .<CR>", { desc = "Open: Current directory" })

-- .gitignore
map({ "n", "v", "x" }, "<leader>i", [[<Cmd>tabedit .gitignore<CR>]], { desc = "Edit: .gitignore" })

-- ─────────────────────────────────────────────────────────────────────────────
-- 16. GUARDAR & CERRAR (Save & Quit)
-- ─────────────────────────────────────────────────────────────────────────────

map("n", "<leader>w", "<Cmd>update<CR>", { desc = "File: Write/Save" })
map("n", "<leader>q", "<Cmd>:quit<CR>", { desc = "File: Quit" })
map("n", "<leader>Q", "<Cmd>:wqa<CR>", { desc = "File: Write all and quit" })

-- ─────────────────────────────────────────────────────────────────────────────
-- 17. TERMINAL (Terminal mode)
-- ─────────────────────────────────────────────────────────────────────────────

-- Abrir terminal
map({ "n", "t" }, "<Leader>t", "<Cmd>split<CR> <Cmd>term<CR>i", { desc = "Terminal: Open" })
map({ "n", "t" }, "<Leader>x", "<Cmd>tabclose<CR>", { desc = "Terminal: Close tab" })

-- Salir de terminal mode
map("t", "<Esc>", "<C-\\><C-n>", { desc = "Terminal: Exit mode" })

-- Navegación dentro de terminal
keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)

-- ─────────────────────────────────────────────────────────────────────────────
-- 18. DEBUGGER (DAP - Depurador) - CON MANEJO DE ERRORES
-- ─────────────────────────────────────────────────────────────────────────────

local ok_dap = pcall(require, "dap")
if ok_dap then
	map("n", "<Leader>d", ":DapNew<CR>", { desc = "Debug: Start debugger" })
	map({ "n", "i" }, "<C-b>", ":DapToggleBreakpoint<CR>", { desc = "Debug: Toggle breakpoint" })
end

-- ─────────────────────────────────────────────────────────────────────────────
-- 19. PESTAÑAS (Tabs)
-- ─────────────────────────────────────────────────────────────────────────────

for i = 1, 8 do
	map({ "n", "t" }, "<Leader>" .. i, "<Cmd>tabnext " .. i .. "<CR>", { desc = "Tab: Go to " .. i })
end

-- ─────────────────────────────────────────────────────────────────────────────
-- 20. SELECCIONAR TODO & NAVEGAR (Select & Navigate)
-- ─────────────────────────────────────────────────────────────────────────────

local opts_silent = { noremap = true, silent = true }
map("n", "yag", ":%y<CR>", opts_silent)       -- Copiar todo el archivo
map("n", "vag", "ggVG", opts_silent)          -- Seleccionar todo

-- ─────────────────────────────────────────────────────────────────────────────
-- 21. COMANDOS PERSONALIZADOS (Custom Commands)
-- ─────────────────────────────────────────────────────────────────────────────

vim.cmd([[
	" Aumentar número de forma más cómoda
	nnoremap g= g+
	
	" Unir línea anterior con la actual
	nnoremap gK @='ddkPJ'<cr>
	xnoremap gK <esc><cmd>keeppatterns '<,'>-global/$/normal! ddpkJ<cr>
	
	" Insertar fecha y hora dinámicamente
	noremap! <c-r><c-d> <c-r>=strftime('%F')<cr>      " YYYY-MM-DD
	noremap! <c-r><c-t> <c-r>=strftime('%T')<cr>      " HH:MM:SS
	noremap! <c-r><c-f> <c-r>=expand('%:t')<cr>       " Nombre archivo
	noremap! <c-r><c-p> <c-r>=expand('%:p')<cr>       " Ruta completa
	
	" Repeat (.) en visual mode
	xnoremap <expr> . "<esc><cmd>'<,'>normal! ".v:count1.'.<cr>'
	
	" Desactivar Ex mode
	nnoremap Q <nop>
]])

-- ─────────────────────────────────────────────────────────────────────────────
-- 22. PREVIEW (Vista previa de archivos)
-- ─────────────────────────────────────────────────────────────────────────────

local function open_current_html()
	local path = vim.api.nvim_buf_get_name(0)
	if path == "" then
		vim.notify("Preview requires a saved HTML file", vim.log.levels.ERROR)
		return
	end
	vim.cmd.update()
	local result = vim.system({ "open", path }, { text = true }):wait()
	if result.code ~= 0 then
		local output = result.stderr ~= "" and result.stderr or result.stdout
		if output == "" then output = "Failed to open " .. path end
		vim.notify(output, vim.log.levels.ERROR)
	end
end

local function preview_current_file()
	local filetype = vim.bo.filetype
	if filetype == "typst" then
		vim.cmd.TypstPreview()
	elseif filetype == "html" then
		open_current_html()
	else
		vim.notify("No preview for: " .. filetype, vim.log.levels.WARN)
	end
end

map("n", "<leader>p", preview_current_file, { desc = "Preview: Current file" })

-- ─────────────────────────────────────────────────────────────────────────────
-- 23. ARCHIVOS & SESIONES (Files & Sessions)
-- ─────────────────────────────────────────────────────────────────────────────

map({ "n", "v", "x" }, "<leader>r", ":edit!<CR>", { desc = "File: Reload" })
map({ "n", "v", "x" }, "<leader>o", "<Cmd>source %<CR>", { desc = "File: Source" })
map({ "n", "v", "x" }, "<leader>O", "<Cmd>restart<CR>", { desc = "Restart: Neovim" })

-- ─────────────────────────────────────────────────────────────────────────────
-- 24. COMANDOS NORMALES (Normal mode commands)
-- ─────────────────────────────────────────────────────────────────────────────

map({ "n", "v", "x" }, "<leader>n", ":norm ", { desc = "Normal: Command mode" })
map("n", "<leader>c", "1z=", { desc = "Spell: Correct word" })
map("n", "<C-q>", ":copen<CR>", { silent = true, desc = "Quickfix: Open" })

-- ─────────────────────────────────────────────────────────────────────────────
-- 25. LIMPIEZA DE PLUGINS (Plugin cleanup)
-- ─────────────────────────────────────────────────────────────────────────────

local function pack_clean()
	local active_plugins = {}
	local unused_plugins = {}

	for _, plugin in ipairs(vim.pack.get()) do
		active_plugins[plugin.spec.name] = plugin.active
	end

	for _, plugin in ipairs(vim.pack.get()) do
		if not active_plugins[plugin.spec.name] then
			table.insert(unused_plugins, plugin.spec.name)
		end
	end

	if #unused_plugins == 0 then
		print("No unused plugins.")
		return
	end

	local choice = vim.fn.confirm("Remove unused plugins?", "&Yes\n&No", 2)
	if choice == 1 then
		vim.pack.del(unused_plugins)
	end
end

map("n", "<leader>pc", pack_clean, { desc = "Plugin: Clean unused" })

-- ═══════════════════════════════════════════════════════════════════════════════
-- FZF CONFIGURACIÓN RECOMENDADA (Añade a tu init.lua o init.vim)
-- ═══════════════════════════════════════════════════════════════════════════════

-- Configuración de FZF desde Lua
-- Asegúrate de que tienes instalado: junegunn/fzf.vim y fzf en el sistema

vim.g.fzf_preview_window = { 'right:50%', 'ctrl-/' }  -- Ventana preview a la derecha
vim.g.fzf_buffers_jump = 1                             -- Salta a buffer existente
vim.g.fzf_layout = { window = { width = 0.9, height = 0.6 } }  -- Ventana flotante

-- Customizar colores de FZF si lo necesitas:
-- vim.g.fzf_colors = {
--   ['fg'] = { 'fg', 'Normal' },
--   ['bg'] = { 'bg', 'Normal' },
--   ['preview-bg'] = { 'bg', 'Normal' },
-- }

-- ═══════════════════════════════════════════════════════════════════════════════
-- FIN DE LA CONFIGURACIÓN DE KEYMAPS PARA FZF
-- ═══════════════════════════════════════════════════════════════════════════════
