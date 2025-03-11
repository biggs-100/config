return {
  "lukas-reineke/indent-blankline.nvim",
  event = { "BufReadPre", "BufNewFile" }, -- Lazy loading en apertura de buffers
  main = "ibl", -- Módulo principal
  opts = {
    -- Configuración de indentación
    indent = {
      char = "┊", -- Carácter para las líneas de indentación
      -- tab_char = "▸", -- Carácter específico para tabs (opcional)
      -- highlight = "IblIndent", -- Grupo de resaltado
    },

    -- Configuración del scope (contexto de indentación)
    scope = {
      enabled = false, -- Mostrar el scope actual
      --char = "│", -- Carácter para el scope
      show_start = false, -- Mostrar inicio del scope
      show_end = false, -- Ocultar fin del scope
      -- highlight = "IblScope", -- Grupo de resaltado para scope
    },

    -- Exclusiones
    exclude = {
      filetypes = {
        "help",
        "dashboard",
        "packer",
        "NvimTree",
        "mason",
        "lazy",
        "terminal",
      },
      buftypes = {
        "terminal",
        "nofile",
        "quickfix",
      },
    },

    -- Opciones adicionales
    whitespace = {
      remove_blankline_trail = false, -- Mantener espacios finales
    },
  },
  config = function(_, opts)
    -- Configuración adicional si es necesaria
    require("ibl").setup(opts)
  end,
}
