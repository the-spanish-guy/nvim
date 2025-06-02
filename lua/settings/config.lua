---@diagnostic disable: undefined-global

-- Referência de APIs do Neovim:
-- vim.opt: Usado para definir opções do editor (equivalente ao comando 'set' do Vim)
-- vim.g: Usado para definir variáveis globais do Vim (equivalente ao prefixo 'g:' do Vim)

-- Configurações de codificação e cores
-- Nota: A configuração abaixo não é mais necessária no Neovim moderno
-- vim.opt.t_Co = "256"         -- O Neovim detecta e configura automaticamente o suporte a cores do terminal
vim.opt.encoding = "UTF-8"       -- Define a codificação do arquivo para UTF-8

-- Configurações de indentação
vim.opt.expandtab = true         -- Converte tabs em espaços
vim.opt.tabstop = 2             -- Define o tamanho visual de um caractere tab como 2 espaços
vim.opt.softtabstop = 2         -- Define o número de espaços inseridos quando pressiona tab
vim.opt.shiftwidth = 2          -- Define o número de espaços usados para indentação (>>)

-- Configurações de interface
vim.opt.number = true           -- Mostra números de linha
vim.opt.relativenumber = true   -- Mostra números de linha relativos à linha atual
vim.opt.cursorline = true      -- Destaca a linha atual do cursor
vim.opt.signcolumn = "yes"     -- Sempre mostra a coluna de símbolos (git/lsp)
vim.opt.scrolloff = 8          -- Mantém 8 linhas visíveis acima/abaixo do cursor
vim.opt.sidescrolloff = 8      -- Mantém 8 colunas visíveis à esquerda/direita do cursor

-- Configurações de busca
vim.opt.ignorecase = true      -- Ignora maiúsculas/minúsculas na busca
vim.opt.smartcase = true       -- Considera maiúsculas/minúsculas se usar maiúsculas na busca
vim.opt.hlsearch = true        -- Destaca todos os resultados da busca
vim.opt.incsearch = true       -- Mostra resultados da busca enquanto digita

-- Configurações de experiência de edição
vim.opt.mouse = "a"            -- Habilita suporte completo ao mouse
vim.opt.clipboard = "unnamedplus" -- Usa o clipboard do sistema
vim.opt.undofile = true        -- Mantém histórico de desfazer mesmo após fechar arquivo
vim.opt.updatetime = 300       -- Reduz o tempo de atualização (melhor experiência git/lsp)
vim.opt.timeoutlen = 500       -- Tempo para completar uma sequência de teclas

-- Configurações de janelas divididas
vim.opt.splitbelow = true      -- Novas janelas horizontais abrem abaixo
vim.opt.splitright = true      -- Novas janelas verticais abrem à direita

-- Configurações de backup e segurança
vim.opt.backup = false         -- Desativa arquivos de backup
vim.opt.writebackup = false    -- Não cria backup antes de sobrescrever arquivo
vim.opt.swapfile = false       -- Desativa arquivos de swap

-- Configuração do EditorConfig
vim.g.loaded_editorconfig = 0  -- Ativa o suporte nativo ao EditorConfig no Neovim