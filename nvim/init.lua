require("biggz.core")
require("biggz.lazy")

vim.opt.clipboard = "unnamedplus" -- Usa el portapapeles del sistema

-- Ocultar líneas en blanco
vim.opt.fillchars:append({ eob = " " }) -- Oculta el carácter de fin de buffer (~)
