-- Ruta para Lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

-- Verificar si Lazy.nvim está instalado, clonarlo si no
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- Última versión estable
    lazypath,
  })
end

-- Añadir Lazy.nvim al runtimepath
vim.opt.rtp:prepend(lazypath)

-- Configuración optimizada de Lazy.nvim
require("lazy").setup({
  -- { "LazyVim/LazyVim" },
  -- Importar plugins desde módulos
  { import = "biggz.plugins" },
  { import = "biggz.plugins.lsp" },
}, {
  -- Opciones de instalación
  install = {
    missing = true, -- Instalar plugins faltantes al iniciar
    colorscheme = { "habamax" }, -- Esquema de color por defecto durante la instalación
  },
  -- Comprobador de actualizaciones
  checker = {
    enabled = true, -- Habilitar búsqueda de actualizaciones
    notify = false, -- Desactivar notificaciones
    frequency = 86400, -- Comprobar cada 24 horas (en segundos)
  },
  -- Detección de cambios en la configuración
  change_detection = {
    enabled = true, -- Habilitar detección de cambios
    notify = false, -- Desactivar notificaciones
  },
  -- Optimización del rendimiento
  performance = {
    rtp = {
      reset = true, -- Resetear el runtimepath para un inicio limpio
      disabled_plugins = {
        "gzip",
        "matchit",
        "matchparen",
        "netrwPlugin",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
  -- Interfaz de usuario
  ui = {
    border = "rounded", -- Bordes redondeados en la UI de Lazy
  },
})
