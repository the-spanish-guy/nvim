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

### [none-ls.nvim](https://github.com/nvimtools/none-ls.nvim)
Suporte a formatação e diagnósticos adicionais.

### [nvim-cmp](https://github.com/hrsh7th/nvim-cmp)
Engine de autocompletação altamente extensível.

## ⌨️ Atalhos Principais

### Geral
- `<Space>` - Líder
- `<C-s>` - Salvar
- `<C-q>` - Fechar buffer
- `<C-h/j/k/l>` - Navegar entre janelas

### Telescope
- `<leader>ff` - Buscar arquivos
- `<leader>fg` - Buscar com grep
- `<leader>fb` - Buscar buffers
- `<leader>fh` - Buscar ajuda

### LSP
- `gd` - Ir para definição
- `gr` - Encontrar referências
- `K` - Mostrar documentação
- `<F2>` - Renomear símbolo
- `<leader>ca` - Ações de código
- `[d` / `]d` - Próximo/anterior diagnóstico

### Git
- `<leader>gs` - Status do git
- `<leader>gd` - Diff view
- `]c` / `[c` - Próxima/anterior mudança
- `<leader>gb` - Blame line

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