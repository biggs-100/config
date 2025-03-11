return {
  {
    "rebelot/kanagawa.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      transparent = true, -- Fondo transparente
      dimInactive = false, -- No atenuar ventanas inactivas
      colors = {
        theme = {
          all = {
            ui = {
              bg_gutter = "none", -- Sin fondo en los números de línea
            },
          },
        },
      },
      overrides = function(colors)
        return {
          -- Grupos básicos de Vim con colores menos saturados
          Normal = { fg = "#C8C3A6", bg = "NONE" }, -- Blanco crema más tenue
          Comment = { fg = "#82817A", italic = true }, -- Gris más apagado
          Function = { fg = "#6E8CC8", bold = true, italic = true }, -- Azul menos vibrante
          Variable = { fg = "#B09C5E" }, -- Beige más apagado
          Keyword = { fg = "#E19050", italic = true }, -- Naranja menos brillante
          Constant = { fg = "#D05060" }, -- Rojo menos fuerte
          String = { fg = "#88A85C", italic = true }, -- Verde menos saturado
          Identifier = { fg = "#C8C3A6" }, -- Azul cian más apagado
          Statement = { fg = "#E19050" }, -- Naranja menos saturado
          PreProc = { fg = "#E19050" }, -- Naranja menos saturado
          Type = { fg = "#6E8CC8" }, -- Azul menos vibrante
          NormalFloat = { bg = "NONE" },
          FloatBorder = { fg = "#4C4C5D", bg = "NONE" }, -- Blanco crema más tenue
          VertSplit = { fg = "#4C4C5D", bg = "NONE" }, -- Gris oscuro menos fuerte
          WinSeparator = { fg = "#4C4C5D", bg = "NONE" }, -- Gris oscuro menos fuerte
          CursorLine = { bg = "#2E2E3D" }, -- Color más oscuro para la línea del cursor
          Visual = { bg = "#2E2E3D", fg = "#C8C3A6" }, -- Texto seleccionado (gris oscuro)

          -- Grupos de Treesitter con colores menos saturados
          ["@variable"] = { fg = "#B09C5E" }, -- Beige más apagado
          ["@identifier"] = { fg = "#C8C3A6" }, -- Azul cian más apagado
          ["@function"] = { fg = "#6E8CC8", bold = true, italic = true }, -- Azul menos vibrante
          ["@keyword"] = { fg = "#E19050", italic = true }, -- Naranja menos brillante
          ["@constant"] = { fg = "#D05060" }, -- Rojo menos fuerte
          ["@string"] = { fg = "#88A85C", italic = true }, -- Verde menos saturado
          ["@type"] = { fg = "#6E8CC8" }, -- Azul menos vibrante
          ["@statement"] = { fg = "#E19050" }, -- Naranja menos saturado
          ["@preproc"] = { fg = "#E19050" }, -- Naranja menos saturado
          ["@comment"] = { fg = "#82817A", italic = true }, -- Gris más apagado
        }
      end,
      show_end_of_buffer = false, -- No mostrar ~ al final del buffer
    },
    config = function(_, opts)
      require("kanagawa").setup(opts)

      -- Aplicar el tema Dark
      vim.cmd.colorscheme("kanagawa")

      -- Forzar compatibilidad con Treesitter y bordes después de cargar todo
      vim.api.nvim_set_hl(0, "@variable", { fg = "#B09C5E" }) -- Beige más apagado
      vim.api.nvim_set_hl(0, "@identifier", { fg = "#C8C3A6" }) -- Azul cian más apagado
      vim.api.nvim_set_hl(0, "@string", { fg = "#88A85C", italic = true }) -- Verde menos saturado
      vim.api.nvim_set_hl(0, "FloatBorder", { fg = "#4C4C5D", bg = "NONE" }) -- Blanco crema más tenue
      vim.api.nvim_set_hl(0, "VertSplit", { fg = "#4C4C5D", bg = "NONE" }) -- Gris oscuro menos fuerte
      vim.api.nvim_set_hl(0, "WinSeparator", { fg = "#4C4C5D", bg = "NONE" }) -- Gris oscuro menos fuerte
      vim.api.nvim_set_hl(0, "CursorLine", { bg = "#232324" }) -- Color más oscuro para la línea del cursor
      vim.api.nvim_set_hl(0, "Visual", { bg = "#2E2E3D", fg = "#C8C3A6" }) -- Texto seleccionado (gris oscuro)

      -- Autocomando para forzar la actualización después de cargar el colorscheme
      vim.api.nvim_create_autocmd("ColorScheme", {
        pattern = "*",
        callback = function()
          vim.api.nvim_set_hl(0, "FloatBorder", { fg = "#4C4C5D", bg = "NONE" }) -- Blanco crema más tenue
          vim.api.nvim_set_hl(0, "VertSplit", { fg = "#4C4C5D", bg = "NONE" }) -- Gris oscuro menos fuerte
          vim.api.nvim_set_hl(0, "WinSeparator", { fg = "#4C4C5D", bg = "NONE" }) -- Gris oscuro menos fuerte
          vim.api.nvim_set_hl(0, "CursorLine", { bg = "#2E2E3D" }) -- Color más oscuro para la línea del cursor
          vim.api.nvim_set_hl(0, "Visual", { bg = "#2E2E3D", fg = "#C8C3A6" }) -- Texto seleccionado (gris oscuro)
        end,
      })
    end,
  },
}
