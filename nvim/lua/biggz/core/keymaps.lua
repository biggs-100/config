vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness

keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })

keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

-- increment/decrement numbers
keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number" }) -- increment
keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" }) -- decrement

-- window management
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" }) -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" }) -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" }) -- make split windows equal width & height
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" }) -- close current split window

keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" }) -- open new tab
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" }) -- close current tab
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" }) --  go to next tab
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" }) --  go to previous tab
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" }) --  move current buffer to new tab

----- OIL ----
vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
-- [[ vim.keymap.set("n", "<leader>oe", "<cmd>Oil --float<CR>", { desc = "Open Oil in floating window" }) ]]

-- save file
vim.keymap.set({ "i", "x", "n", "s" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save File" })

-- lazy
vim.keymap.set("n", "<leader>l", "<cmd>Lazy<cr>", { desc = "Lazy" })

-- Mason
vim.keymap.set("n", "<leader>ma", "<cmd>Mason<cr>", { desc = "Mason" })

-- quit
vim.keymap.set("n", "<leader>qq", "<cmd>qa<cr>", { desc = "Quit All" })
vim.keymap.set("n", "<leader>qr", "<cmd>q<cr>", { desc = "Quit" })

--vim.keymap.set("n", "<leader>e", ":Neotree focus<CR>")
--vim.keymap.set("n", "<leader>ee", ":Neotree filesystem reveal leftoggle<CR>")

--terminal
vim.keymap.set("n", "<leader>tt", "<cmd>ToggleTerm direction=float<CR>", { desc = "Toggle floating terminal" })
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" }) -- Para salir del modo terminal

--BUFFERS
-- Moverse al siguiente buffer
vim.keymap.set("n", "<Tab>", "<cmd>bnext<cr>", { desc = "Next buffer" })

-- Moverse al buffer anterior
vim.keymap.set("n", "<S-Tab>", "<cmd>bprevious<cr>", { desc = "Previous buffer" })

-- Cerrar el buffer actual
vim.keymap.set("n", "<leader>bd", "<cmd>bd<cr>", { desc = "Close buffer" })

-- Cerrar todos los buffers menos el actual
vim.keymap.set("n", "<leader>bo", "<cmd>%bd|e#|bd#<cr>", { desc = "Close other buffers" })

-- Mostrar lista de buffers con Telescope
vim.keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>", { desc = "Find buffers" })

-- -- Modo Normal: Pegar después del cursor
-- vim.keymap.set("n", "<C-v>", '"+p', { noremap = true, silent = true })

-- -- Modo Insert: Pegar directamente en la posición del cursor
-- vim.keymap.set("i", "<C-v>", "<C-r>+", { noremap = true, silent = true })

-- -- Modo Visual: Sustituir la selección con el contenido del portapapeles
-- vim.keymap.set("v", "<C-v>", '"+p', { noremap = true, silent = true })

-- -- Modo Visual: Copiar la selección al portapapeles
-- vim.keymap.set("v", "<C-c>", '"+y', { noremap = true, silent = true })
