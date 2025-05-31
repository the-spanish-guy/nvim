local keymap = require("utils.keymap")

-- { "n", "v" }

-- Selecionar tudo
keymap("n", "<C-a>", "ggvG$", "Seleciona Todo o arquivo")

-- ir para a linha
keymap("n", "<C-g>", ":", "Ir para a linha")

-- Navegação entre buffers
keymap("n", "<S-l>", ":bnext<CR>", "Próximo buffer")
keymap("n", "<S-h>", ":bprevious<CR>", "Buffer anterior")

-- Salvar com Ctrl+S
keymap("n", "<C-s>", ":w<CR>", "Salvar arquivo")
keymap("i", "<C-s>", "<Esc>:w<CR>a", "Salvar arquivo")

-- Fechar buffer
keymap("n", "<leader>x", ":bd<CR>", "Fechar buffer")

-- Dividir janela
keymap("n", "<leader>sv", ":vsplit<CR>", "Dividir verticalmente")
keymap("n", "<leader>sh", ":split<CR>", "Dividir horizontalmente")

-- Navegação entre janelas
keymap("n", "<C-h>", "<C-w>h", "Janela à esquerda")
keymap("n", "<C-j>", "<C-w>j", "Janela abaixo")
keymap("n", "<C-k>", "<C-w>k", "Janela acima")
keymap("n", "<C-l>", "<C-w>l", "Janela à direita")

-- LSP Renomeação (estilo VSCode)
-- F2: Renomeia o símbolo sob o cursor
keymap("n", "<F2>", vim.lsp.buf.rename, "Renomear símbolo")
-- Ctrl+F2: Mostra todas as referências do símbolo
keymap("n", "<C-F2>", vim.lsp.buf.references, "Mostrar todas as referências")

--[[
Movendo a linha selecionada ↑↓
Alt - j Move a linha do cursor pra cima
Alt - k Move a linha do cursor pra baixo

Também é possivel mover as linhas selecionadas
]]

keymap("n", "<A-j>", ":m .+1<CR>==")
keymap("n", "<A-Down>", ":m .+1<CR>==")

keymap("i", "<A-j>", "<Esc>:m .+1<CR>==gi")
keymap("i", "<A-Down>", "<Esc>:m .+1<CR>==gi")

keymap("v", "<A-j>", ":m '>+1<CR>gv=gv")
keymap("v", "<A-Down>", ":m '>+1<CR>gv=gv")

keymap("x", "<A-j>", ":m'>+<CR>gv=gv")
keymap("x", "<A-Down>", ":m'>+<CR>gv=gv")

keymap("n", "<A-k>", ":m .-2<CR>==")
keymap("n", "<A-Up>", ":m .-2<CR>==")

keymap("i", "<A-k>", "<Esc>:m .-2<CR>==gi")
keymap("i", "<A-Up>", "<Esc>:m .-2<CR>==gi")

keymap("v", "<A-k>", ":m '<-2<CR>gv=gv")
keymap("v", "<A-Up>", ":m '<-2<CR>gv=gv")

keymap("x", "<A-Up>", ":m-2<CR>gv=gv")
keymap("x", "<A-k>", ":m-2<CR>gv=gv")

keymap("n", "<C-j>", ":lua require('kulala').run()<CR>")
