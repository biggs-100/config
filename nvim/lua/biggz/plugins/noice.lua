return {
	{
		"folke/noice.nvim",
		event = "VeryLazy", -- Cargar bajo demanda
		dependencies = {
			"MunifTanjim/nui.nvim", -- Dependencia requerida por noice.nvim
			"rcarriga/nvim-notify", -- Dependencia opcional para notificaciones mejoradas
		},
		opts = {
			cmdline = {
				enabled = true, -- Habilitar la command-line mejorada
				view = "cmdline_popup", -- Usar una ventana flotante para la command-line
				opts = {}, -- Opciones adicionales para la command-line
			},
			messages = {
				enabled = true, -- Habilitar mensajes mejorados
				view = "notify", -- Usar notificaciones para mensajes
				view_error = "notify", -- Usar notificaciones para errores
				view_warn = "notify", -- Usar notificaciones para advertencias
				view_history = "messages", -- Ver historial de mensajes
				view_search = "virtualtext", -- Ver búsquedas como texto virtual
			},
			presets = {
				bottom_search = true, -- Habilitar la vista de búsqueda en la parte inferior
				command_palette = true, -- Habilitar la paleta de comandos
				long_message_to_split = true, -- Dividir mensajes largos en varias líneas
				lsp_doc_border = true, -- Habilitar bordes en la documentación LSP
			},
			views = {
				cmdline_popup = {
					position = {
						row = 5, -- Posición vertical de la command-line flotante
						col = "50%", -- Posición horizontal centrada
					},
					size = {
						width = 60, -- Ancho de la command-line flotante
						height = "auto", -- Altura automática
					},
					border = {
						style = "rounded", -- Borde redondeado
						-- padding = { 1, 2 }, -- Relleno del borde
					},
					win_options = {
						winhighlight = "NormalFloat:NormalFloat,FloatBorder:FloatBorder", -- Resaltado de la ventana
					},
				},
			},
		},
		config = function(_, opts)
			require("noice").setup(opts)

			-- Keymaps personalizados para noice.nvim
			local keymap = vim.keymap.set
			keymap("n", "<leader>nc", "<cmd>NoiceCmdline<CR>", { desc = "Toggle command-line UI" }) -- Alternar la command-line UI
			keymap("n", "<leader>nh", "<cmd>NoiceHistory<CR>", { desc = "View message history" }) -- Ver historial de mensajes
			keymap("n", "<leader>nl", "<cmd>NoiceLast<CR>", { desc = "View last message" }) -- Ver el último mensaje
		end,
	},
}
