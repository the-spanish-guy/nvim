# NEOVIM Configs

> Minhas configurações personalizadas para o Neovim, focadas em produtividade e uma experiência moderna de desenvolvimento.

## ⚡ Requisitos

- Neovim >= 0.11
- Git >= 2.19.0
- Um terminal com suporte a true colors e fonte Nerd Font
- Node.js >= 18 (para alguns LSP servers)
- [ripgrep](https://github.com/BurntSushi/ripgrep) (para busca de texto)
- [fd](https://github.com/sharkdp/fd) (para busca de arquivos)
- [lazygit](https://github.com/jesseduffield/lazygit) (para a TUI git)

## 📦 Instalação

1. Faça backup da sua configuração atual:
```bash
mv ~/.config/nvim ~/.config/nvim.bak
```

2. Clone este repositório:
```bash
git clone https://github.com/the-spanish-guy/nvim-config.git ~/.config/nvim
```

3. Inicie o Neovim:
```bash
nvim
```

O [Lazy.nvim](https://github.com/folke/lazy.nvim) irá automaticamente instalar todos os plugins na primeira inicialização.

## 🎨 Temas

Temas disponíveis: **vague**, **catppuccin**, **rosepine**, **tokyonight**, **kanagawa** — cada um com suporte a variantes (ex: catppuccin mocha/latte/frappé/macchiato).

- `<leader>th` — abre o seletor de temas com preview ao vivo de código
- A seleção é persistida automaticamente entre sessões

### Adicionando um novo tema

1. Crie `lua/themes/nome.lua`:
```lua
local flavor = "variante-padrao"

return {
  name = "nome",               -- deve bater com o nome do arquivo
  variants = { "a", "b" },    -- opcional
  lualine = "nome-lualine",
  colors = function()
    local colors = require("tema.colors").setup({ style = flavor })
    return { updates = colors.alguma_cor }
  end,
  setup = function()
    require("tema").setup({ style = flavor })
    vim.o.background = "dark" -- ou "light"
    vim.cmd.colorscheme("nome-" .. flavor)
  end,
}
```

2. Crie `lua/plugins/nome.lua`:
```lua
local theme = require("themes")
return {
  "owner/repo",
  lazy = false,
  priority = 1000,
  config = function()
    if theme.name == "nome" then theme.setup() end
  end,
}
```

O picker (`<leader>th`) detecta automaticamente o novo tema.

## 🛠️ Plugins

### Estilização
- **[vague.nvim](https://github.com/vague-theme/vague.nvim)** / **[catppuccin](https://github.com/catppuccin/nvim)** / **[rose-pine](https://github.com/rose-pine/neovim)** / **[tokyonight](https://github.com/folke/tokyonight.nvim)** / **[kanagawa](https://github.com/rebelot/kanagawa.nvim)** — temas
- **[lualine.nvim](https://github.com/nvim-lualine/lualine.nvim)** — linha de status com integração ao tema ativo e indicador de updates do lazy
- **[alpha.nvim](https://github.com/goolord/alpha-nvim)** — dashboard inicial
- **[dropbar.nvim](https://github.com/Bekaboo/dropbar.nvim)** — barra de navegação estilo VSCode

### Navegação & Busca
- **[telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)** — busca fuzzy para arquivos, texto, buffers, LSP e mais
- **[neo-tree.nvim](https://github.com/nvim-neo-tree/neo-tree.nvim)** — explorador de arquivos com integração git

### LSP & Código
- **[mason.nvim](https://github.com/williamboman/mason.nvim)** — gerenciador de LSP servers, formatters e linters
- **[mason-lspconfig](https://github.com/williamboman/mason-lspconfig.nvim)** — integração mason + LSP nativo do Neovim 0.11+. [Servidores disponíveis](https://github.com/williamboman/mason-lspconfig.nvim?tab=readme-ov-file#available-lsp-servers)
- **[conform.nvim](https://github.com/stevearc/conform.nvim)** — formatação de código
- **[nvim-lint](https://github.com/mfussenegger/nvim-lint)** — linting
- **[nvim-cmp](https://github.com/hrsh7th/nvim-cmp)** — autocompletação
- **[fidget.nvim](https://github.com/j-hui/fidget.nvim)** — feedback visual para operações LSP
- **[treesitter](https://github.com/nvim-treesitter/nvim-treesitter)** — parsing avançado para highlight e navegação

> [!NOTE]
> Se `:checkhealth nvim-treesitter` mostrar `warning tree-sitter executable not found`, instale com `npm install tree-sitter-cli`.

### Git
- **[gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim)** — indicadores de hunk na lateral e blame inline
- **[lazygit.nvim](https://github.com/kdheepak/lazygit.nvim)** — TUI git completa
- **[diffview.nvim](https://github.com/sindrets/diffview.nvim)** — diff lado a lado e histórico de arquivos

### Utilitários
- **[kulala.nvim](https://github.com/mistweaverco/kulala.nvim)** — cliente HTTP integrado
- **[markdown-preview.nvim](https://github.com/iamcco/markdown-preview.nvim)** — preview em tempo real de markdown
- **[render-markdown.nvim](https://github.com/MeanderingProgrammer/render-markdown.nvim)** — renderização de markdown no buffer
- **[todo-comments.nvim](https://github.com/folke/todo-comments.nvim)** — destaque para TODO/FIXME e similares

## ⌨️ Atalhos Principais

### Geral
| Atalho | Ação |
|--------|------|
| `<Space>` | Tecla líder |
| `<C-s>` | Salvar arquivo |
| `<leader>x` | Fechar buffer |
| `<C-h/j/k/l>` | Navegar entre janelas |
| `<S-h>` / `<S-l>` | Buffer anterior / próximo |

### Edição
| Atalho | Ação |
|--------|------|
| `<C-a>` | Selecionar tudo |
| `<C-S-k>` | Deletar linha sem copiar |
| `<A-j>` / `<A-k>` | Mover linha/seleção para baixo/cima |
| `<C-g>` | Ir para linha específica |

### LSP & Código
| Atalho | Ação |
|--------|------|
| `gd` | Ir para definição |
| `gi` | Ir para implementação |
| `gr` | Encontrar referências |
| `go` | Ir para definição de tipo |
| `gD` | Ir para declaração |
| `K` | Mostrar documentação |
| `<F2>` | Renomear símbolo (incremental) |
| `<leader>ca` | Ações de código |
| `<leader>gf` | Formatar arquivo |
| `<leader>v` | Ir para definição em split vertical |
| `[d` / `]d` | Diagnóstico anterior / próximo |
| `<leader>d` | Mostrar diagnóstico inline |

### Telescope
| Atalho | Ação |
|--------|------|
| `<C-p>` | Buscar arquivos |
| `<leader>fg` | Buscar texto (grep) |
| `<leader>fb` | Listar buffers |
| `<leader>fs` | Buscar palavra sob cursor |
| `<leader>fr` | Retomar última busca |
| `<leader>th` | Seletor de temas |

### Git
| Atalho | Ação |
|--------|------|
| `<leader>lg` | Abrir lazygit |
| `<leader>df` | Diff do arquivo atual |
| `<leader>dfh` | Histórico do arquivo atual |
| `<leader>gs` | Stage hunk |
| `<leader>gr` | Reset hunk |
| `<leader>gp` | Preview hunk |

### Janelas & Explorador
| Atalho | Ação |
|--------|------|
| `<C-b>` | Abrir/fechar neo-tree |
| `<leader>sv` | Dividir verticalmente |
| `<leader>sh` | Dividir horizontalmente |

### HTTP (Kulala)
| Atalho | Ação |
|--------|------|
| `<C-j>` | Executar requisição HTTP |

## 🔍 Troubleshooting

1. **LSP não funciona** — verifique `:Mason` e `:LspLog`
2. **Treesitter sem highlight** — `:TSInstall <linguagem>`
3. **Telescope lento** — confirme que `ripgrep` e `fd` estão instalados
4. **Ícones não aparecem** — instale uma Nerd Font e configure o terminal

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
