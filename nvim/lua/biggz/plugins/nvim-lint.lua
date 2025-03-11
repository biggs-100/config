return {
	"mfussenegger/nvim-lint",
	event = { "BufWritePost", "BufReadPost", "InsertLeave" },
	config = function()
		local lint = require("lint")

		-- Configuración de linters por tipo de archivo
		lint.linters_by_ft = {
			fish = { "fish" },
			-- ["*"] = { "typos" }, -- Linter global para todos los tipos de archivo
			-- ["_"] = { "fallback linter" }, -- Linter de respaldo
		}

		-- Función de debounce usando vim.fn.timer_start
		local function debounce(ms, fn)
			local timer = nil
			return function(...)
				local args = { ... }
				if timer then
					vim.fn.timer_stop(timer) -- Detener el temporizador anterior
				end
				timer = vim.fn.timer_start(ms, function()
					timer = nil -- Limpiar el temporizador después de ejecutar
					pcall(fn, unpack(args)) -- Usamos pcall para manejar errores
				end)
			end
		end

		-- Función de linting optimizada
		local function lint_files()
			local filetype = vim.bo.filetype
			local linters = vim.list_extend({}, lint._resolve_linter_by_ft(filetype))

			-- Añadir linters fallback si no hay específicos
			if #linters == 0 then
				linters = vim.list_extend(linters, lint.linters_by_ft["_"] or {})
			end
			-- Añadir linters globales
			linters = vim.list_extend(linters, lint.linters_by_ft["*"] or {})

			if #linters > 0 then
				lint.try_lint(linters)
			end
		end

		-- Grupo de autocomandos para limpieza automática
		local augroup = vim.api.nvim_create_augroup("NvimLint", { clear = true })

		-- Autocomando con debounce
		vim.api.nvim_create_autocmd({ "BufWritePost", "BufReadPost", "InsertLeave" }, {
			group = augroup,
			callback = debounce(100, lint_files),
			desc = "Run linting on buffer events",
		})
	end,
}
