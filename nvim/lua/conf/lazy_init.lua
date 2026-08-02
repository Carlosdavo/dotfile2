-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Setup lazy.nvim
require("lazy").setup({
  spec = {
    -- Importa tus plugins desde la carpeta correspondiente
    { import = "conf.plugins" },
  },
  -- SOLUCIÓN AL PARPADEO: Lazy usará este tema inmediatamente al arrancar
  install = { colorscheme = { "gentleman-kanagawa-blur", "habamax" } },
  
  checker = { enabled = true },
})

-- Forzar la carga limpia del tema al final del inicio
vim.cmd("colorscheme gentleman-kanagawa-blur")
