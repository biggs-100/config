return {
  {
    "L3MON4D3/LuaSnip", -- Plugin de snippets
    dependencies = {
      "rafamadriz/friendly-snippets", -- Colección de snippets útiles
    },
    config = function()
      require("luasnip.loaders.from_vscode").lazy_load() -- Carga snippets de friendly-snippets
    end,
  },
  {
    "saghen/blink.cmp", -- Plugin de autocompletado
    version = "*", -- Usa la última versión estable
    build = "cargo build --release", -- Compila el plugin (necesitas Rust instalado)
    dependencies = {
      "rafamadriz/friendly-snippets", -- Snippets útiles
      {
        "saghen/blink.compat", -- Compatibilidad opcional
        optional = true,
      },
    },
    event = "InsertEnter", -- Se carga al entrar en modo de inserción
    config = function()
      local cmp = require("blink.cmp")
      local luasnip = require("luasnip")

      cmp.setup({
        snippets = {
          expand = function(args)
            luasnip.lsp_expand(args.body) -- Usa luasnip para expandir snippets
          end,
        },
        appearance = {
          use_nvim_cmp_as_default = false, -- No usa los grupos de resaltado de nvim-cmp
          nerd_font_variant = "mono", -- Ajusta el espaciado para íconos
        },
        completion = {
          accept = {
            auto_brackets = {
              enabled = true, -- Habilita la inserción automática de corchetes
            },
          },
          menu = {
            draw = {
              treesitter = { "lsp" }, -- Dibuja el menú con soporte para Treesitter
            },
          },
          documentation = {
            auto_show = true, -- Muestra la documentación automáticamente
            auto_show_delay_ms = 200, -- Retraso de 200 ms
          },
          ghost_text = {
            enabled = true, -- Habilita el texto fantasma (sugerencias en línea)
          },
        },
        sources = {
          default = { "lsp", "path", "snippets", "buffer" }, -- Fuentes predeterminadas
        },
        cmdline = {
          enabled = false, -- Desactiva el autocompletado en la línea de comandos
        },
        keymap = {
          preset = "enter", -- Conjunto predeterminado de atajos
          ["<C-y>"] = { "select_and_accept" }, -- Asigna Ctrl+y para seleccionar y aceptar
          ["<C>n"] = { -- Asigna Tab para navegar y aceptar
            function(fallback)
              if luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump() -- Expande o salta en snippets
              else
                fallback() -- Comportamiento de respaldo
              end
            end,
          },
          ["<C>p"] = { -- Asigna Shift+Tab para navegar hacia atrás
            function(fallback)
              if luasnip.jumpable(-1) then
                luasnip.jump(-1) -- Salta hacia atrás en snippets
              else
                fallback() -- Comportamiento de respaldo
              end
            end,
          },
        },
      })
    end,
  },
}
