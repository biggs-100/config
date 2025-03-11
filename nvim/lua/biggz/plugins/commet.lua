return {
   "numToStr/Comment.nvim",
   event = { "BufReadPre", "BufNewFile" }, -- Cargar el plugin al abrir un archivo
   dependencies = {
      "JoosepAlviste/nvim-ts-context-commentstring", -- Dependencia para comentarios contextuales
   },
   config = function()
      -- Importar el plugin Comment.nvim de manera segura
      local comment = require("Comment")

      -- Importar la integración de comentarios contextuales
      local ts_context_commentstring = require("ts_context_commentstring.integrations.comment_nvim")

      -- Configurar Comment.nvim
      comment.setup({
         -- Habilitar comentarios contextuales para TSX, JSX, Svelte, HTML, etc.
         pre_hook = ts_context_commentstring.create_pre_hook(),

         -- Campos obligatorios
         padding = true, -- Agrega un espacio después del comentario
         sticky = true, -- Mantiene el cursor en su posición al comentar
         ignore = "^$", -- Ignorar archivos vacíos (puedes cambiarlo según tus necesidades)
         mappings = { -- Keymaps personalizados
            basic = true, -- Habilita keymaps básicos (gcc, gbc, etc.)
            extra = true, -- Habilita keymaps adicionales
         },
         toggler = { -- Configuración para comentar/descomentar
            line = "gcc", -- Comentar/descomentar una línea
            block = "gbc", -- Comentar/descomentar en bloque
         },
         opleader = { -- Configuración para comentar en modo visual
            line = "gc", -- Comentar/descomentar en modo visual
            block = "gb", -- Comentar/descomentar en bloque en modo visual
         },
         extra = { -- Configuración adicional
            above = "gcO", -- Comentar arriba de la línea actual
            below = "gco", -- Comentar debajo de la línea actual
            eol = "gcA", -- Comentar al final de la línea
         },
         post_hook = function(ctx) -- Hook después de comentar
            print("Comentario aplicado en línea " .. ctx.range.srow)
         end,
      })
   end,
}
