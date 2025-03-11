return {
   "rcarriga/nvim-notify",
   config = function()
      local notify = require("notify")
      -- Configuración básica
      notify.setup({
         -- Nivel de transparencia (0 = completamente transparente, 1 = opaco)
         background_colour = "#000000", -- Fondo de la notificación
         timeout = 3000, -- Tiempo en milisegundos antes de que la notificación desaparezca
         max_width = 80, -- Ancho máximo de la notificación
         max_height = 10, -- Altura máxima de la notificación
         stages = "fade_in_slide_out", -- Animación de entrada y salida
         fps = 30, -- Fotogramas por segundo para las animaciones
         render = "default", -- Estilo de renderizado (puede ser "default", "minimal", etc.)
         top_down = true, -- Mostrar notificaciones desde la parte superior hacia abajo
         merge_duplicates = true, -- Fusionar notificaciones duplicadas
      })

      -- Reemplazar las notificaciones predeterminadas de Neovim con notify
      vim.notify = notify

      -- Keymap para ver el historial de notificaciones
      vim.keymap.set("n", "<leader>nh", function()
         notify.history() -- Abre el historial de notificaciones
      end, { desc = "Show notification history" })
   end,
}
