local keymap = require("utils.keymap")

--[[ ATALHOS BÁSICOS DE EDIÇÃO ]]
-- Selecionar tudo
keymap("n", "<C-a>", "gg<S-v>G", "Seleciona Todo o arquivo")

-- Incrementar/decrementar número.
keymap({ "n", "x" }, "+", "<C-a>", "Incrementar número")
keymap({ "n", "x" }, "-", "<C-x>", "Decrementar número")

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
keymap("n", "<leader>dd", '"_dd', "Deletar linha sem copiar")
keymap("n", "x", '"_x', "Deleta caractere sem afetar o registro (clipboard)")

-- Cola o último yank (registro 0), mesmo depois de apagar outra coisa.
-- O registro 0 só guarda yanks feitos no Neovim, não o que veio de fora.
keymap({ "n", "v" }, "<leader>p", '"0p', "Colar o último yank")

-- Abre linha abaixo/acima sem continuar o comentário
keymap("n", "<leader>o", "o<Esc>^Da", "Nova linha abaixo sem comentário")
keymap("n", "<leader>O", "O<Esc>^Da", "Nova linha acima sem comentário")

-- Contexto para agentes (tudo vai para o clipboard do sistema, registro `+`)
-- No visual, `<leader>yf`/`<leader>yp` copiam o intervalo (`#L10-L20`)
keymap({ "n", "x" }, "<leader>yf", function()
  require("utils.editor").yank_relative_path_with_line()
end, "Copiar caminho relativo com linha")
keymap({ "n", "x" }, "<leader>yp", function()
  require("utils.editor").yank_absolute_path_with_line()
end, "Copiar caminho absoluto com linha")
keymap("x", "<leader>cc", function()
  require("utils.editor").copy_as_codeblock()
end, "Copiar seleção como bloco de código")
keymap("n", "ZR", function()
  require("utils.editor").restart()
end, "Reiniciar o Neovim (recusa com alterações não salvas)")

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

-- Divisões e navegação entre janelas com o prefixo `s` (o `s` nativo, de
-- substituir, fica indisponível; use `cl`)
keymap("n", "ss", ":split<CR>", "Dividir horizontalmente")
keymap("n", "sv", ":vsplit<CR>", "Dividir verticalmente")
keymap("n", "sh", "<C-w>h", "Janela à esquerda")
keymap("n", "sj", "<C-w>j", "Janela abaixo")
keymap("n", "sk", "<C-w>k", "Janela acima")
keymap("n", "sl", "<C-w>l", "Janela à direita")
-- `:close` (e não `:q`) para nunca sair do Neovim ao fechar a última janela
keymap("n", "sq", ":close<CR>", "Fechar janela")
keymap("n", "so", ":only<CR>", "Fechar as outras janelas")

--[[
┌─────────────┬─────────────┐
│   Janela 1  │   Janela 2  │
│             │             │
│             │             │
└─────────────┴─────────────┘
-- Redimensionando janelas
]]--
keymap("n", "<leader>H", "<C-w><", "(na Janela 1) - diminui largura da Janela 1, Janela 2 fica maior")
keymap("n", "<leader>K", "<C-w>+", "aumenta altura da janela atual")
keymap("n", "<leader>J", "<C-w>-", "diminui altura da janela atual")
keymap("n", "<leader>L", "<C-w>>", "(na Janela 1) - aumenta largura da Janela 1, Janela 2 fica menor")

--[[ LSP E CÓDIGO ]]
-- Renomeação e Referências

--[[
--as keymaps para renomear usando F2 foram movidos para o arquivo de incremental-rename.lua
--]]
-- F2: Renomeia o símbolo sob o cursor
-- keymap("n", "<F2>", vim.lsp.buf.rename, "Renomear símbolo")
-- keymap("n", "<F2>", ":IncRename ")
-- Ctrl+F2: Mostra todas as referências do símbolo (usando Telescope para melhor visualização)
--keymap("n", "<C-F2>", vim.lsp.buf.references, "Mostrar todas as referências")
-- keymap("n", "<leader>rn", vim.lsp.buf.rename, "Renomear símbolo (alt F2)")

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

keymap("n", "<C-z>", ":Telescope file_browser path=%:p:h select_buffer=true<CR>", "Abre a extensão de explorador de arquivos do Telescope")

-- Ações e diagnósticos
keymap("n", "<leader>ca", vim.lsp.buf.code_action, "Ações de código")
keymap("n", "<leader>cR", function()
  Snacks.rename.rename_file()
end, "Renomear arquivo atual")
keymap("n", "[d", function()
  vim.diagnostic.jump({ count = -1, float = true })
end, "Diagnóstico anterior")
keymap("n", "]d", function()
  vim.diagnostic.jump({ count = 1, float = true })
end, "Próximo diagnóstico")
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
-- Seletor de tema
keymap("n", "<leader>th", function()
  local actions = require("telescope.actions")
  local action_state = require("telescope.actions.state")
  require("telescope.builtin").colorscheme({
    enable_preview = true,
    attach_mappings = function(prompt_bufnr)
      actions.select_default:replace(function()
        local cs = action_state.get_selected_entry().value
        actions.close(prompt_bufnr)
        vim.cmd.colorscheme(cs)
        vim.fn.writefile({
          "-- Tema ativo, gravado por <leader>th (lua/settings/mapkeys.lua)",
          ('vim.cmd("colorscheme ' .. cs .. '")'),
          "",
        }, vim.fn.stdpath("config") .. "/lua/theme.lua")
      end)
      return true
    end,
  })
end, "Selecionar tema")

-- Seletor de tipo de arquivo
keymap("n", "<leader>ft", function()
  require("utils.ft_picker").pick()
end, "Selecionar tipo de arquivo")

-- Kulala (HTTP Client)
keymap("n", "<C-j>", ":lua require('kulala').run()<CR>")
