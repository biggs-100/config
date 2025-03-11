return {
   "nvim-telescope/telescope.nvim",
   -- branch = "0.1.x",
   dependencies = {
      "nvim-lua/plenary.nvim",
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
      "nvim-tree/nvim-web-devicons",
      "folke/todo-comments.nvim",
   },
   config = function()
      local telescope = require("telescope")
      local actions = require("telescope.actions")
      local transform_mod = require("telescope.actions.mt").transform_mod

      local trouble = require("trouble")
      local trouble_telescope = require("trouble.sources.telescope")

      -- Acciones personalizadas
      local custom_actions = transform_mod({
         open_trouble_qflist = function()
            trouble.toggle("quickfix")
         end,
      })

      telescope.setup({
         defaults = {
            path_display = { "smart" },
            mappings = {
               i = {
                  ["<C-k>"] = actions.move_selection_previous,
                  ["<C-j>"] = actions.move_selection_next,
                  ["<C-q>"] = actions.send_selected_to_qflist + custom_actions.open_trouble_qflist,
                  ["<C-t>"] = trouble_telescope.open,
               },
            },
            -- Configuración del tamaño de las ventanas
            layout_config = {
               width = 0.8, -- Ancho de la ventana (90% del ancho de la pantalla)
               height = 0.7, -- Altura de la ventana (80% del alto de la pantalla)
               prompt_position = "bottom", -- Posición del prompt (arriba)
               preview_cutoff = 120, -- Límite de ancho para la vista previa
               horizontal = {
                  preview_width = 0.6, -- Ancho de la vista previa en modo horizontal
               },
               vertical = {
                  preview_height = 0.5, -- Altura de la vista previa en modo vertical
               },
            },
            -- Personalización de resaltados para transparencia
            highlight = {
               enable = true, -- Asegura que los resaltados personalizados se apliquen
            },
         },
      })

      -- Cargar extensión fzf
      telescope.load_extension("fzf")

      -- Keymaps
      local keymap = vim.keymap
      keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Fuzzy find files in cwd" })
      keymap.set("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", { desc = "Fuzzy find recent files" })
      keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>", { desc = "Find string in cwd" })
      keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>", { desc = "Find string under cursor in cwd" })
      keymap.set("n", "<leader>ft", "<cmd>TodoTelescope<cr>", { desc = "Find todos" })
      keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>", { desc = "Find open buffers" })

      -- Forzar transparencia en los resaltados de Telescope después de cargar
      local hl = vim.api.nvim_set_hl
      hl(0, "TelescopeNormal", { bg = "NONE" }) -- Fondo principal transparente
      hl(0, "TelescopeBorder", { bg = "NONE", fg = "#4C4C5D" }) -- Bordes blancos y transparentes
      hl(0, "TelescopePromptNormal", { bg = "NONE" }) -- Fondo del prompt transparente
      hl(0, "TelescopePromptBorder", { bg = "NONE", fg = "#4C4C5D" }) -- Borde del prompt blanco
      hl(0, "TelescopeResultsNormal", { bg = "NONE" }) -- Fondo de resultados transparente
      hl(0, "TelescopeResultsBorder", { bg = "NONE", fg = "#4C4C5D" }) -- Borde de resultados blanco
      hl(0, "TelescopePreviewNormal", { bg = "NONE" }) -- Fondo de vista previa transparente
      hl(0, "TelescopePreviewBorder", { bg = "NONE", fg = "#4C4C5D" }) -- Borde de vista previa blanco
      hl(0, "TelescopeTitle", { bg = "NONE" }) -- Título transparente
      hl(0, "TelescopePromptTitle", { bg = "NONE" }) -- Título del prompt transparente
      hl(0, "TelescopeResultsTitle", { bg = "NONE" }) -- Título de los resultados transparente
      hl(0, "TelescopePreviewTitle", { bg = "NONE" }) -- Título de la vista previa transparente
   end,
}
