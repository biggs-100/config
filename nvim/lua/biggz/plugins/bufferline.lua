return {
  "akinsho/bufferline.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  version = "*", -- Usar la última versión
  opts = {
    options = {
      mode = "tabs", -- Mostrar pestañas en lugar de buffers
    },
    -- highlights = {
    --   -- Grupos principales para pestañas
    --   background = { bg = "NONE" }, -- Fondo de pestañas inactivas
    --   tab = { bg = "NONE" }, -- Fondo de pestañas normales
    --   tab_selected = { bg = "NONE" }, -- Fondo de pestaña seleccionada
    --   tab_close = { bg = "NONE" }, -- Fondo del botón de cerrar pestaña
    --   separator = { bg = "NONE" }, -- Separadores entre pestañas
    --   separator_selected = { bg = "NONE" }, -- Separador de pestaña seleccionada
    --   indicator_selected = { bg = "NONE" }, -- Indicador de pestaña activa (corregido)
    --   modified = { bg = "NONE" }, -- Fondo de pestañas modificadas
    --   modified_selected = { bg = "NONE" }, -- Fondo de pestañas modificadas seleccionadas
    --   fill = { bg = "NONE" }, -- Fondo de la barra completa
    --   buffer = { bg = "NONE" }, -- Fondo de buffers (como fallback)
    --   buffer_selected = { bg = "NONE" }, -- Fondo de buffer seleccionado
    -- },
  },
  config = function(_, opts)
    -- Configurar Bufferline con las opciones
    require("bufferline").setup(opts)

    -- Forzar transparencia después de cargar
    -- local hl = vim.api.nvim_set_hl
    -- hl(0, "BufferLineBackground", { bg = "NONE" })
    -- hl(0, "BufferLineTab", { bg = "NONE" })
    -- hl(0, "BufferLineTabSelected", { bg = "NONE" })
    -- hl(0, "BufferLineTabClose", { bg = "NONE" })
    -- hl(0, "BufferLineSeparator", { bg = "NONE" })
    -- hl(0, "BufferLineSeparatorSelected", { bg = "NONE" })
    -- hl(0, "BufferLineIndicatorSelected", { bg = "NONE" }) -- Corregido
    -- hl(0, "BufferLineModified", { bg = "NONE" })
    -- hl(0, "BufferLineModifiedSelected", { bg = "NONE" })
    -- hl(0, "BufferLineFill", { bg = "NONE" })
    -- hl(0, "BufferLineBuffer", { bg = "NONE" })
    -- hl(0, "BufferLineBufferSelected", { bg = "NONE" })
  end,
}

