local autocmd = vim.api.nvim_create_autocmd

--[[ Destacar ao yankar (copiar)
Este autocomando cria um feedback visual (flash) quando você copia texto.
O destaque dura 200ms e ajuda a identificar exatamente o que foi copiado.

Exemplos de comandos de yank:
y  - precisa de um movimento (operador)
yy - copia a linha inteira
yw - copia do cursor até o final da palavra
y$ - copia do cursor até o final da linha
yi" - copia texto entre aspas
yi{ - copia texto entre chaves
yiw - copia a palavra inteira onde o cursor está
yap - copia o parágrafo inteiro
2yy - copia duas linhas
yt, - copia do cursor até a próxima vírgula
]]
autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank({ timeout = 200 })
  end,
})

--[[ Remover whitespace ao salvar
Remove automaticamente espaços em branco e tabs desnecessários no final das linhas
ao salvar qualquer arquivo. Não afeta:
- Quebras de linha (enters)
- Espaços entre palavras
- Espaços de indentação
- Linhas em branco

O comando '%s/\s\+$//e' significa:
% - aplica em todo arquivo
\s\+ - encontra um ou mais espaços/tabs
$ - apenas no final das linhas
e - ignora silenciosamente se não encontrar matches
]]
autocmd("BufWritePre", {
  pattern = "*",
  command = ":%s/\\s\\+$//e",
})

--[[ Retornar à última posição ao abrir arquivo
Quando você reabre um arquivo, este comando automaticamente move o cursor
para a posição exata onde estava quando você fechou o arquivo pela última vez.

Funciona da seguinte forma:
- Guarda a posição do cursor quando você fecha o arquivo
- Ao reabrir, verifica se a posição guardada ainda é válida
- Se for válida, move o cursor para lá
- Se o arquivo foi modificado e a linha não existe mais, mantém o cursor no topo

Exemplo de uso:
1. Você está editando um arquivo na linha 50
2. Fecha o arquivo
3. Mais tarde, ao reabrir o mesmo arquivo, o cursor irá automaticamente para a linha 50
]]
autocmd("BufReadPost", {
  pattern = "*",
  callback = function()
    local line = vim.fn.line
    if line("'\"") > 0 and line("'\"") <= line("$") then
      vim.cmd('normal! g`"')
    end
  end,
})

--[[ Recarregar arquivo quando modificado externamente
Atualiza automaticamente o buffer do Neovim quando o arquivo é modificado por outro programa.
Este comando é ativado em diferentes situações:
- FocusGained: quando o Neovim recebe foco (ex: alt-tab de volta para o Neovim)
- BufEnter: quando você muda para um buffer
- CursorHold: quando o cursor fica parado por um tempo
- CursorHoldI: mesmo que acima, mas no modo de inserção

Exemplo de uso:
1. Você tem um arquivo aberto no Neovim
2. Abre e edita o mesmo arquivo em outro editor (VS Code, Sublime, etc)
3. Ao voltar para o Neovim, ele detecta a mudança e atualiza o conteúdo automaticamente
4. Evita o clássico aviso "File changed on disk" e mantém seu buffer sincronizado
]]
autocmd({ "FocusGained", "BufEnter", "CursorHold", "CursorHoldI" }, {
  pattern = "*",
  callback = function()
    if not vim.fn.bufexists("[Command Line]") then
      vim.cmd("checktime")
    end
  end,
})

--[[ Definir tipo de arquivo para arquivos específicos
Configura comportamentos específicos baseados na extensão do arquivo.
Neste caso:
- Arquivos .md (Markdown) terão 'wrap' ativado
- 'wrap' faz com que linhas longas quebrem visualmente na tela
- Útil para arquivos de texto onde você não quer rolar horizontalmente

Para adicionar mais tipos de arquivo, você pode:
1. Usar múltiplos padrões: pattern = {"*.md", "*.txt"}
2. Criar novos autocommands para cada tipo:

Exemplos de outros tipos comuns:
autocmd({ "BufRead", "BufNewFile" }, {
  pattern = "*.txt",
  command = "setlocal wrap"
})

autocmd({ "BufRead", "BufNewFile" }, {
  pattern = "*.json",
  command = "setlocal ts=2 sw=2"
})

autocmd({ "BufRead", "BufNewFile" }, {
  pattern = "*.py",
  command = "setlocal ts=4 sw=4"
})
]]
autocmd({ "BufRead", "BufNewFile" }, {
  pattern = "*.md",
  command = "setlocal wrap",
})

--[[ Abrir help em split vertical
Modifica como as janelas de ajuda do Neovim são exibidas.
Por padrão, a ajuda abre em um split horizontal (divisão cima/baixo).
Este comando força a janela de help a:
- Abrir em um split vertical (divisão esquerda/direita)
- Mover para o lado direito da tela

Ativado quando você usa comandos como:
- :help algum-comando (ou :h)
- K sobre uma palavra para ver documentação
- :h autocmd
- :h função

Exemplo visual:
┌──────────────┬─────────────┐
│              │             │
│   Seu        │    Janela   │
│   código     │     de      │
│              │    Help     │
│              │             │
└──────────────┴─────────────┘
]]
autocmd("FileType", {
  pattern = "help",
  command = "wincmd L",
}) 