local keymap = require("utils.keymap")

--[[ ATALHOS BÁSICOS DE EDIÇÃO ]]
-- Selecionar tudo
keymap("n", "<C-a>", "ggvG$", "Seleciona Todo o arquivo")
-- keymap("n", "<C-a>", "gg<S-v>G", "Seleciona Todo o arquivo")

-- Salvar com Ctrl+S
keymap("n", "<C-s>", ":w<CR>", "Salvar arquivo")
keymap("i", "<C-s>", "<Esc>:w<CR>a", "Salvar arquivo")

--[[
Deletar linha sem copiar (estilo VSCode)
"_dd -> onde:
- "_ : envia a operação para o registro blackhole (nada é copiado)
- dd : deleta a linha inteira
Dessa forma, a linha é deletada sem afetar o registro de cópia,
exatamente como o atalho Ctrl+Shift+K do VSCode
]]
keymap("n", "<C-S-k>", '"_dd', "Deletar linha sem copiar")
keymap("n", "x", '"_x"', "Deleta caractere sem afetar o registro (clipboard)")

--[[ NAVEGAÇÃO ]]
-- Ir para a linha
keymap("n", "<C-g>", ":", "Ir para a linha")

-- Navegação entre buffers
keymap("n", "<S-l>", ":bnext<CR>", "Próximo buffer")
keymap("n", "<S-h>", ":bprevious<CR>", "Buffer anterior")
-- Fechar buffer
keymap("n", "<leader>x", ":bd<CR>", "Fechar buffer")

--[[ GERENCIAMENTO DE JANELAS ]]
-- Dividir janela
keymap("n", "<leader>sv", ":vsplit<CR>", "Dividir verticalmente")
keymap("n", "<leader>sh", ":split<CR>", "Dividir horizontalmente")

-- Navegação entre janelas
keymap("n", "<C-h>", "<C-w>h", "Janela à esquerda")
keymap("n", "<C-j>", "<C-w>j", "Janela abaixo")
keymap("n", "<C-k>", "<C-w>k", "Janela acima")
keymap("n", "<C-l>", "<C-w>l", "Janela à direita")

--[[
┌─────────────┬─────────────┐
│   Janela 1  │   Janela 2  │
│             │             │
│             │             │
└─────────────┴─────────────┘
-- Redimensionando janelas
]]--
keymap("n", "<C-H>", "<C-w><", "(na Janela 1) - diminui largura da Janela 1, Janela 2 fica maior")
keymap("n", "<C-K>", "<C-w>+", "aumenta altura da janela atual")
keymap("n", "<C-J>", "<C-w>-", "diminui altura da janela atual")
keymap("n", "<C-L>", "<C-w>>", "(na Janela 1) - aumenta largura da Janela 1, Janela 2 fica menor")

--[[ LSP E CÓDIGO ]]
-- Renomeação e Referências

-- F2: Renomeia o símbolo sob o cursor
keymap("n", "<F2>", vim.lsp.buf.rename, "Renomear símbolo")
-- Ctrl+F2: Mostra todas as referências do símbolo (usando Telescope para melhor visualização)
--keymap("n", "<C-F2>", vim.lsp.buf.references, "Mostrar todas as referências")
keymap("n", "<leader>rn", vim.lsp.buf.rename, "Renomear símbolo (alt F2)")

-- Definição e Implementação
--[[ Keymaps LSP padrão (usando quickfix list)
keymap("n", "gd", vim.lsp.buf.definition, "Ir para definição")
keymap("n", "gi", vim.lsp.buf.implementation, "Ir para implementação")
keymap("n", "gr", vim.lsp.buf.references, "Encontrar referências")
]]

-- Navegação de código com Telescope
keymap("n", "gd", "<cmd>Telescope lsp_definitions<CR>", "Ir para definição")
keymap("n", "gi", "<cmd>Telescope lsp_implementations<CR>", "Ir para implementação")
keymap("n", "gr", "<cmd>Telescope lsp_references<CR>", "Encontrar referências")
keymap("n", "K", vim.lsp.buf.hover, "Mostrar documentação")

-- Ações e diagnósticos
keymap("n", "<leader>ca", vim.lsp.buf.code_action, "Ações de código")
keymap("n", "[d", vim.diagnostic.goto_prev, "Diagnóstico anterior")
keymap("n", "]d", vim.diagnostic.goto_next, "Próximo diagnóstico")
keymap("n", "<leader>d", vim.diagnostic.open_float, "Mostrar diagnóstico")
keymap("n", "<leader>q", vim.diagnostic.setloclist, "Lista de diagnósticos")

--[[ WORKSPACE ]]
keymap("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, "Adicionar pasta ao workspace")
keymap("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, "Remover pasta do workspace")
keymap("n", "<leader>wl", function()
  print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
end, "Listar pastas do workspace")

--[[ MOVIMENTAÇÃO DE LINHAS ]]
--[[
Movendo a linha selecionada ↑↓
Alt - j Move a linha do cursor pra cima
Alt - k Move a linha do cursor pra baixo

Também é possivel mover as linhas selecionadas
]]

-- Mover linha/seleção para baixo
keymap("n", "<A-j>", ":m .+1<CR>==")
keymap("n", "<A-Down>", ":m .+1<CR>==")
keymap("i", "<A-j>", "<Esc>:m .+1<CR>==gi")
keymap("i", "<A-Down>", "<Esc>:m .+1<CR>==gi")
keymap("v", "<A-j>", ":m '>+1<CR>gv=gv")
keymap("v", "<A-Down>", ":m '>+1<CR>gv=gv")
keymap("x", "<A-j>", ":m'>+<CR>gv=gv")
keymap("x", "<A-Down>", ":m'>+<CR>gv=gv")

-- Mover linha/seleção para cima
keymap("n", "<A-k>", ":m .-2<CR>==")
keymap("n", "<A-Up>", ":m .-2<CR>==")
keymap("i", "<A-k>", "<Esc>:m .-2<CR>==gi")
keymap("i", "<A-Up>", "<Esc>:m .-2<CR>==gi")
keymap("v", "<A-k>", ":m '<-2<CR>gv=gv")
keymap("v", "<A-Up>", ":m '<-2<CR>gv=gv")
keymap("x", "<A-Up>", ":m-2<CR>gv=gv")
keymap("x", "<A-k>", ":m-2<CR>gv=gv")

--[[ PLUGINS ]]
-- Kulala (HTTP Client)
keymap("n", "<C-j>", ":lua require('kulala').run()<CR>")
