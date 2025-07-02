# NEOVIM Configs

> Minhas configurações personalizadas para o Neovim, focadas em produtividade e uma experiência moderna de desenvolvimento.

## ⚡ Requisitos

- Neovim >= 0.9.0
- Git >= 2.19.0
- Um terminal com suporte a true colors e fonte Nerd Font
- Node.js >= 18 (para alguns LSP servers)
- [ripgrep](https://github.com/BurntSushi/ripgrep) (para busca de texto)
- [fd](https://github.com/sharkdp/fd) (para busca de arquivos)

## 📦 Instalação

1. Faça backup da sua configuração atual:
```bash
mv ~/.config/nvim ~/.config/nvim.bak
```

2. Clone este repositório:
```bash
git clone https://github.com/seu-usuario/nvim-config.git ~/.config/nvim
```

3. Inicie o Neovim:
```bash
nvim
```

O [Lazy.nvim](https://github.com/folke/lazy.nvim) irá automaticamente instalar todos os plugins na primeira inicialização.

## 🎨 Plugins de Estilização

### [alpha.nvim](https://github.com/goolord/alpha-nvim)
Dashboard inicial customizado com acesso rápido a arquivos recentes e atalhos.

### [dropbar.nvim](https://github.com/Bekaboo/dropbar.nvim)
Barra de navegação estilo VSCode para fácil navegação entre símbolos e estruturas.

### [catppuccin.nvim](https://github.com/catppuccin/nvim)
Tema moderno com suporte a diversos plugins e sintaxe rica.

### [vague.nvim](https://github.com/ashincoder/vague.nvim)
Tema atual em uso, oferecendo uma paleta de cores suave e moderna para uma experiência visual agradável.

### [lualine.nvim](https://github.com/nvim-lualine/lualine.nvim)
Linha de status minimalista e informativa.

## 🛠️ Plugins Diversos

### [fidget.nvim](https://github.com/j-hui/fidget.nvim)
Feedback visual para operações LSP em andamento.

### [neo-tree.nvim](https://github.com/nvim-neo-tree/neo-tree.nvim)
Explorador de arquivos moderno com suporte a git.

### [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)
Busca fuzzy para arquivos, buffers e muito mais.

### [treesitter.nvim](https://github.com/nvim-treesitter/nvim-treesitter)
Parsing de sintaxe avançado para highlighting e navegação.

> [!NOTE]
> Se ao rodar `:checkhealth nvim-treesitter` aparecer um warning `warning tree-sitter executable not found`
> Será necessário isntalar o pacote `npm install tree-sitter-cli`
> [ref](https://github.com/nvim-treesitter/nvim-treesitter/issues/1097#issuecomment-2512543496)

### [kulala.lua](https://github.com/mistweaverco/kulala.nvim)
Cliente HTTP integrado para testes de API.

## 📚 Plugins para Documentação

### [markdown-preview.nvim](https://github.com/iamcco/markdown-preview.nvim)
Preview em tempo real de arquivos markdown.

### [markdown.nvim](https://github.com/MeanderingProgrammer/markdown.nvim)
Funcionalidades extras para edição markdown.

### [todo-comments.nvim](https://github.com/folke/todo-comments.nvim)
Destaque e navegação para comentários TODO e similares.

## 🔄 Plugins para Versionamento

### [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim)
Indicadores de git na lateral e funcionalidades git inline.

### [Diffview.nvim](https://github.com/sindrets/diffview.nvim)
Interface visual para diffs e resolução de conflitos.

### [fugitive.vim](https://github.com/tpope/vim-fugitive)
Interface git completa dentro do Neovim.

## 🔧 Configuração LSP

### [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)
Configurações prontas para diversos language servers.

### [mason.nvim](https://github.com/williamboman/mason.nvim)
Gerenciador de instalação para LSP servers, linters e formatters.

### [mason-lspconfig.nvim](https://github.com/williamboman/mason-lspconfig.nvim)
Integração entre Mason e LSP config. Para instalar novos servers, consulte a [lista oficial](https://github.com/williamboman/mason-lspconfig.nvim?tab=readme-ov-file#available-lsp-servers).
Alguns arquivos foram movidos, se o link acima não funcionar, tente estes
- [configs.md](https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md)
- [mason-registry](https://mason-registry.dev/registry/list)

### [none-ls.nvim](https://github.com/nvimtools/none-ls.nvim)
Suporte a formatação e diagnósticos adicionais.

### [nvim-cmp](https://github.com/hrsh7th/nvim-cmp)
Engine de autocompletação altamente extensível.

## ⌨️ Atalhos Principais

### Geral
- `<Space>` - Tecla líder
- `<C-s>` - Salvar arquivo
- `<leader>x` - Fechar buffer
- `<C-h/j/k/l>` - Navegar entre janelas

### Edição Básica
- `<C-a>` - Selecionar todo o arquivo
- `<C-S-k>` - Deletar linha sem copiar (estilo VSCode)
- `<A-j>` / `<A-Down>` - Mover linha/seleção para baixo
- `<A-k>` / `<A-Up>` - Mover linha/seleção para cima

### Navegação
- `<C-g>` - Ir para linha específica
- `<S-h>` - Buffer anterior
- `<S-l>` - Próximo buffer

### Gerenciamento de Janelas
- `<leader>sv` - Dividir verticalmente
- `<leader>sh` - Dividir horizontalmente

### LSP e Código
- `<F2>` - Renomear símbolo
- `<leader>rn` - Renomear símbolo (alternativo)
- `gd` - Ir para definição (Telescope)
- `gi` - Ir para implementação (Telescope)
- `gr` - Encontrar referências (Telescope)
- `K` - Mostrar documentação
- `<leader>ca` - Ações de código
- `[d]` - Diagnóstico anterior
- `]d` - Próximo diagnóstico
- `<leader>d` - Mostrar diagnóstico
- `<leader>q` - Lista de diagnósticos
- `<leader>gf` - Formatar código

### Workspace
- `<leader>wa` - Adicionar pasta ao workspace
- `<leader>wr` - Remover pasta do workspace
- `<leader>wl` - Listar pastas do workspace

### Telescope
- `<C-p>` - Buscar arquivos
- `<leader>fg` - Buscar texto (grep)
- `<leader>fb` - Listar buffers
- `<leader>fh` - Buscar na ajuda
- `<leader>fs` - Buscar palavra sob cursor
- `<leader>fr` - Retomar última busca

### Neo-tree (Explorador de Arquivos)
- `<C-b>` - Abrir/fechar explorador de arquivos

### HTTP Client (Kulala)
- `<C-j>` - Executar requisição HTTP

### Completions (nvim-cmp)
- `<C-Space>` - Abrir completions
- `<C-e>` - Fechar completions
- `<CR>` - Confirmar seleção
- `<Tab>` - Próxima sugestão/expandir snippet
- `<S-Tab>` - Sugestão anterior
- `<C-b>` - Rolar documentação para cima
- `<C-f>` - Rolar documentação para baixo

## 🔍 Troubleshooting

### Problemas Comuns

1. **LSP não está funcionando**
   - Verifique se o language server está instalado via `:Mason`
   - Confira os logs com `:LspLog`

2. **Treesitter highlighting não funciona**
   - Instale o parser para sua linguagem: `:TSInstall <language>`
   - Verifique o status: `:TSModuleInfo`

3. **Telescope está lento**
   - Certifique-se de ter `ripgrep` instalado
   - Use `fd` para busca de arquivos mais rápida

4. **Ícones não aparecem**
   - Instale uma Nerd Font
   - Configure seu terminal para usar a fonte

## 🤝 Contribuindo

Sinta-se à vontade para abrir issues ou PRs com melhorias!

## 📝 TODO

- [ ] Adicionar mais snippets
- [ ] Melhorar a documentação dos keymaps
- [ ] Adicionar testes
- [ ] Otimizar carregamento de plugins

---

Made by [the spanish guy](https://github.com/the-spanish-guy) with :black_heart:

```
          ／＞　 フ
         | 　_　_|
       ／` ミ__^ノ
      /　　　　 |
     /　 ヽ　　 ﾉ           ╱|、
    /　　 |　|　|         (˚ˎ 。7
／￣|　　 |　|　|          |、˜〵
(￣ヽ＿_  ヽ_)__)         じしˍ,)ノ
＼二)
```
