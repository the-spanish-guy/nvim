-- Configurações de codificação e cores
vim.cmd("set t_Co=256")          -- Habilita suporte a 256 cores no terminal
vim.cmd("set encoding=UTF-8")     -- Define a codificação do arquivo para UTF-8

-- Configurações de indentação
vim.cmd("set expandtab")         -- Converte tabs em espaços
vim.cmd("set tabstop=2")         -- Define o tamanho visual de um caractere tab como 2 espaços
vim.cmd("set softtabstop=2")     -- Define o número de espaços inseridos quando pressiona tab
vim.cmd("set shiftwidth=2")      -- Define o número de espaços usados para indentação (>>)

-- Configurações de interface
vim.cmd("set number")            -- Mostra números de linha
vim.cmd("set relativenumber")    -- Mostra números de linha relativos à linha atual
vim.cmd("set cursorline")        -- Destaca a linha atual do cursor
vim.cmd("set signcolumn=yes")    -- Sempre mostra a coluna de símbolos (git/lsp)
vim.cmd("set scrolloff=8")       -- Mantém 8 linhas visíveis acima/abaixo do cursor
vim.cmd("set sidescrolloff=8")   -- Mantém 8 colunas visíveis à esquerda/direita do cursor

-- Configurações de busca
vim.cmd("set ignorecase")        -- Ignora maiúsculas/minúsculas na busca
vim.cmd("set smartcase")         -- Considera maiúsculas/minúsculas se usar maiúsculas na busca
vim.cmd("set hlsearch")          -- Destaca todos os resultados da busca
vim.cmd("set incsearch")         -- Mostra resultados da busca enquanto digita

-- Configurações de experiência de edição
vim.cmd("set mouse=a")           -- Habilita suporte completo ao mouse
vim.cmd("set clipboard=unnamedplus") -- Usa o clipboard do sistema
vim.cmd("set undofile")          -- Mantém histórico de desfazer mesmo após fechar arquivo
vim.cmd("set updatetime=300")    -- Reduz o tempo de atualização (melhor experiência git/lsp)
vim.cmd("set timeoutlen=500")    -- Tempo para completar uma sequência de teclas

-- Configurações de janelas divididas
vim.cmd("set splitbelow")        -- Novas janelas horizontais abrem abaixo
vim.cmd("set splitright")        -- Novas janelas verticais abrem à direita

-- Configurações de backup e segurança
vim.cmd("set nobackup")          -- Desativa arquivos de backup
vim.cmd("set nowritebackup")     -- Não cria backup antes de sobrescrever arquivo
vim.cmd("set noswapfile")        -- Desativa arquivos de swap
