return {
  {
    "CRAG666/code_runner.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "voldikss/vim-floaterm", -- Usar vim-floaterm como terminal flotante
    },
    config = function()
      require("code_runner").setup({
        -- Configuración del plugin
        filetype = {
          python = "python3 -u", -- Ejecutar archivos Python con python3
          javascript = "node", -- Ejecutar archivos JavaScript con Node.js
          typescript = "ts-node", -- Ejecutar archivos TypeScript con ts-node
          sh = "bash", -- Ejecutar archivos Bash con bash
          cpp = "g++ $fileName -o $fileNameWithoutExt && ./$fileNameWithoutExt", -- Compilar y ejecutar C++
          java = "javac $fileName && java $fileNameWithoutExt", -- Compilar y ejecutar Java
          go = "go run", -- Ejecutar archivos Go con go run
          rust = "cargo run", -- Ejecutar archivos Rust con cargo run
          ruby = "ruby", -- Ejecutar archivos Ruby
          php = "php", -- Ejecutar archivos PHP
        },
        mode = "float", -- Usar una terminal flotante (vim-floaterm)
        focus = true, -- Enfocar la terminal después de ejecutar
        startinsert = true, -- Entrar en modo inserción en la terminal
        float = {
          -- Configuración específica para vim-floaterm
          border = "rounded", -- Borde redondeado
          width = 0.8, -- Ancho de la ventana flotante (80% del ancho de la pantalla)
          height = 0.8, -- Altura de la ventana flotante (80% del alto de la pantalla)
        },
      })

      -- Keymaps para ejecutar código
      vim.keymap.set("n", "<leader>rr", ":RunCode<CR>", { desc = "Run code" })
      vim.keymap.set("n", "<leader>rf", ":RunFile<CR>", { desc = "Run file" })
      vim.keymap.set("n", "<leader>rp", ":RunProject<CR>", { desc = "Run project" })
      vim.keymap.set("n", "<C-c>", ":RunClose<CR>", { desc = "Close runner" })
    end,
  },
}
