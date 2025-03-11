return {
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-neotest/nvim-nio", -- Dependencia requerida para neotest
      "nvim-neotest/neotest-go", -- Adapter para Go (opcional)
      "nvim-neotest/neotest-python", -- Adapter para Python
    },
    opts = {
      -- Configuración de adapters
      adapters = {
        ["neotest-go"] = {
          go_test_args = { "-v", "-race", "-count=1", "-timeout=60s" }, -- Argumentos para pruebas en Go
          dap_go_enabled = true, -- Habilitar debugging con DAP para Go
        },
        ["neotest-python"] = {
          -- Configuración específica para Python
          runner = "pytest", -- Usar pytest como runner (puedes cambiarlo a "unittest" si prefieres)
          python = "python3", -- Especificar la versión de Python
          args = { "--verbose" }, -- Argumentos adicionales para pytest
          dap_python_enabled = true, -- Habilitar debugging con DAP para Python
        },
      },
      -- Configuración del estado de las pruebas
      status = {
        virtual_text = true, -- Mostrar texto virtual con el estado de las pruebas
      },
      -- Configuración de la salida de las pruebas
      output = {
        open_on_run = true, -- Abrir automáticamente la salida al ejecutar pruebas
      },
      -- Configuración de quickfix
      quickfix = {
        open = function()
          if require("lazy.core.config").plugins["trouble.nvim"] then
            require("trouble").open({ mode = "quickfix", focus = false }) -- Usar Trouble.nvim si está instalado
          else
            vim.cmd("copen") -- Usar quickfix estándar si Trouble.nvim no está instalado
          end
        end,
      },
    },
    config = function(_, opts)
      -- Crear un namespace para neotest
      local neotest_ns = vim.api.nvim_create_namespace("neotest")
      vim.diagnostic.config({
        virtual_text = {
          format = function(diagnostic)
            -- Formatear el mensaje de diagnóstico para que sea más compacto
            local message = diagnostic.message:gsub("\n", " "):gsub("\t", " "):gsub("%s+", " "):gsub("^%s+", "")
            return message
          end,
        },
      }, neotest_ns)

      -- Integración con Trouble.nvim (si está instalado)
      if require("lazy.core.config").plugins["trouble.nvim"] then
        opts.consumers = opts.consumers or {}
        -- Refrescar y cerrar Trouble automáticamente después de ejecutar pruebas
        opts.consumers.trouble = function(client)
          client.listeners.results = function(adapter_id, results, partial)
            if partial then
              return
            end
            local tree = assert(client:get_position(nil, { adapter = adapter_id }))

            local failed = 0
            for pos_id, result in pairs(results) do
              if result.status == "failed" and tree:get_key(pos_id) then
                failed = failed + 1
              end
            end
            vim.schedule(function()
              local trouble = require("trouble")
              if trouble.is_open() then
                trouble.refresh()
                if failed == 0 then
                  trouble.close()
                end
              end
            end)
            return {}
          end
        end
      end

      -- Cargar adapters
      if opts.adapters then
        local adapters = {}
        for name, config in pairs(opts.adapters or {}) do
          if type(name) == "number" then
            if type(config) == "string" then
              config = require(config)
            end
            adapters[#adapters + 1] = config
          elseif config ~= false then
            local adapter = require(name)
            if type(config) == "table" and not vim.tbl_isempty(config) then
              local meta = getmetatable(adapter)
              if adapter.setup then
                adapter.setup(config)
              elseif adapter.adapter then
                adapter.adapter(config)
                adapter = adapter.adapter
              elseif meta and meta.__call then
                adapter = adapter(config)
              else
                error("Adapter " .. name .. " does not support setup")
              end
            end
            adapters[#adapters + 1] = adapter
          end
        end
        opts.adapters = adapters
      end

      -- Configurar neotest
      require("neotest").setup(opts)
    end,
    -- Keymaps personalizados para neotest
    keys = {
      { "<leader>t", "", desc = "+test" }, -- Grupo de keymaps para pruebas
      {
        "<leader>tt",
        function()
          require("neotest").run.run(vim.fn.expand("%"))
        end,
        desc = "Run File (Neotest)",
      }, -- Ejecutar pruebas en el archivo actual
      {
        "<leader>tT",
        function()
          require("neotest").run.run(vim.uv.cwd())
        end,
        desc = "Run All Test Files (Neotest)",
      }, -- Ejecutar todas las pruebas
      {
        "<leader>tr",
        function()
          require("neotest").run.run()
        end,
        desc = "Run Nearest (Neotest)",
      }, -- Ejecutar la prueba más cercana
      {
        "<leader>tl",
        function()
          require("neotest").run.run_last()
        end,
        desc = "Run Last (Neotest)",
      }, -- Ejecutar la última prueba
      {
        "<leader>ts",
        function()
          require("neotest").summary.toggle()
        end,
        desc = "Toggle Summary (Neotest)",
      }, -- Alternar el resumen de pruebas
      {
        "<leader>to",
        function()
          require("neotest").output.open({ enter = true, auto_close = true })
        end,
        desc = "Show Output (Neotest)",
      }, -- Mostrar la salida de las pruebas
      {
        "<leader>tO",
        function()
          require("neotest").output_panel.toggle()
        end,
        desc = "Toggle Output Panel (Neotest)",
      }, -- Alternar el panel de salida
      {
        "<leader>tS",
        function()
          require("neotest").run.stop()
        end,
        desc = "Stop (Neotest)",
      }, -- Detener las pruebas
      {
        "<leader>tw",
        function()
          require("neotest").watch.toggle(vim.fn.expand("%"))
        end,
        desc = "Toggle Watch (Neotest)",
      }, -- Alternar el modo de observación
    },
  },
}
