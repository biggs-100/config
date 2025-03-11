return {
  "voldikss/vim-floaterm",
  config = function()
    -- Configuración global de vim-floaterm
    vim.g.floaterm_width = 0.8
    vim.g.floaterm_height = 0.8
    vim.g.floaterm_border = "rounded" -- Borde redondeado
    vim.g.floaterm_title = "Terminal $1/$2"
    vim.g.floaterm_autoclose = 1
    vim.g.floaterm_autoinsert = true
    vim.g.floaterm_opener = "edit"

    -- Transparencia en bordes y ventana
    vim.g.floaterm_winblend = 15 -- Nivel de transparencia (0-100)

    -- Configurar colores para bordes transparentes
    vim.api.nvim_set_hl(0, "FloatermBorder", {
      bg = "none",
      fg = "#6c7086", -- Color del borde (ajusta según tu tema)
      ctermbg = "none",
    })

    -- Keymaps personalizados (igual que antes)
    vim.keymap.set("n", "<F1>", ":FloatermNew<CR>", { desc = "Open new floating terminal" })
    vim.keymap.set("n", "<F2>", ":FloatermNext<CR>", { desc = "Next floating terminal" })
    vim.keymap.set("n", "<F3>", ":FloatermPrev<CR>", { desc = "Previous floating terminal" })
    vim.keymap.set("n", "<F4>", ":FloatermKill<CR>", { desc = "Kill floating terminal" })
    vim.keymap.set("n", "<F5>", ":FloatermHide<CR>", { desc = "Hide floating terminal" })
    vim.keymap.set("n", "<F6>", ":FloatermShow<CR>", { desc = "Show floating terminal" })
    vim.keymap.set("n", "<F7>", ":FloatermToggle<CR>", { desc = "Toggle floating terminal" })
    vim.keymap.set("n", "<F12>", ":FloatermKill<CR>", { desc = "Close floating terminal" })

    -- Keymaps en modo terminal
    vim.keymap.set("t", "<Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })
    vim.keymap.set("t", "<C-t>", "<C-\\><C-n>:FloatermToggle<CR>", { desc = "Toggle floating terminal" })
  end,
}
