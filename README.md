# nvim config

Minha config pessoal do Neovim. Construída em cima do [lazy.nvim](https://github.com/folke/lazy.nvim), usando a API nativa de LSP do Neovim 0.11+.

## Instalação

Precisa ter instalado: `ripgrep`, `fd`, `lazygit` e Node.js 18+. Uma Nerd Font no terminal também.

```bash
mv ~/.config/nvim ~/.config/nvim.bak
git clone https://github.com/the-spanish-guy/nvim-config.git ~/.config/nvim
nvim
```

O lazy.nvim instala tudo na primeira abertura.

## Temas

`<leader>th` abre o picker do **themery** com preview ao vivo — navegue com `j/k` e veja o tema aplicado em tempo real. Confirmar com Enter salva a escolha entre sessões.

Temas disponíveis: **abyss** (void/dusk/dawn/ember), **catppuccin**, **rose-pine**, **tokyonight**, **kanagawa**, **vague**.

### Adicionando um novo tema

1. Instale o plugin em `lua/plugins/nome.lua`
2. Adicione as entradas no picker em `lua/plugins/themery.lua`:

```lua
{ name = "Nome · Variante", colorscheme = "nome-variante" },
```

O themery salva a escolha automaticamente em `lua/theme.lua`.

## LSP

Servidores gerenciados pelo Mason — para adicionar um novo, basta incluir em `lua/plugins/lsp/servers.lua`. O Mason instala e o LSP conecta automaticamente.

Formatters e linters ficam centralizados em `lua/plugins/lsp/tools.lua`. Adicionar lá já resolve instalação (Mason), configuração (conform/nvim-lint) e filetypes.

**`<leader>ft`** abre um picker para trocar o filetype do buffer atual, igual ao seletor de linguagem do VSCode. Funciona em arquivos dentro de projetos e em buffers sem nome — em ambos os casos o LSP inicia automaticamente.

## Autocompletação

Usa **blink.cmp** como engine de completion. Sources base (LSP, snippets, path, buffer, calc) disponíveis em qualquer filetype. SQL e LaTeX têm sources dedicados que só aparecem nos filetypes corretos.

Snippets carregados nativamente do `friendly-snippets`.

Para adicionar um source específico de linguagem, edite `lua/plugins/completions.lua`:

```lua
-- 1. adicione o plugin como dependência
dependencies = { "autor/cmp-nome" }

-- 2. registre o provider via blink.compat
providers = {
  nome = {
    name = "nome",
    module = "blink.compat.source",
  },
}

-- 3. adicione ao filetype desejado usando o helper sources_with()
-- isso insere o source na posição 2 (logo após o LSP)
-- "nome" aqui é o nome do provider registrado acima, não o filetype
per_filetype = {
  python = sources_with("nome"),
}
```

Se o source faz sentido em qualquer arquivo, adicione em `sources.default` no lugar do `per_filetype`.

## Atalhos

### Geral
| Atalho | Ação |
|--------|------|
| `<Space>` | Leader |
| `<C-s>` | Salvar |
| `<leader>x` | Fechar buffer |
| `<S-h>` / `<S-l>` | Buffer anterior / próximo |
| `<C-h/j/k/l>` | Navegar entre janelas |

### Edição
| Atalho | Ação |
|--------|------|
| `<C-a>` | Selecionar tudo |
| `<C-S-k>` | Deletar linha sem copiar |
| `<A-j>` / `<A-k>` | Mover linha/seleção |
| `<C-g>` | Ir para linha |

### LSP & Código
| Atalho | Ação |
|--------|------|
| `gd` / `gi` / `gr` | Definição / implementação / referências |
| `K` | Documentação |
| `<F2>` | Renomear símbolo |
| `<leader>ca` | Code actions |
| `<leader>gf` | Formatar |
| `[d` / `]d` | Diagnóstico anterior / próximo |
| `<leader>d` | Mostrar diagnóstico |

### Treesitter Textobjects
| Atalho | Ação |
|--------|------|
| `vaf` / `vif` | Selecionar função outer / inner |
| `vac` / `vic` | Selecionar classe outer / inner |
| `vaa` / `via` | Selecionar argumento outer / inner |
| `]f` / `[f` | Próxima / anterior função (início) |
| `]F` / `[F` | Próxima / anterior função (fim) |
| `]c` / `[c` | Próxima / anterior classe (início) |
| `]C` / `[C` | Próxima / anterior classe (fim) |
| `<leader>sa` / `<leader>sA` | Swap argumento com próximo / anterior |

### Telescope
| Atalho | Ação |
|--------|------|
| `<C-p>` | Buscar arquivos |
| `<leader>fg` | Grep |
| `<leader>fb` | Buffers abertos |
| `<leader>fs` | Palavra sob cursor |
| `<leader>th` | Seletor de temas |
| `<leader>ft` | Seletor de filetype |

### Git
| Atalho | Ação |
|--------|------|
| `<leader>lg` | Lazygit |
| `<leader>df` | Diff do arquivo |
| `<leader>dfh` | Histórico do arquivo |
| `<leader>gs` / `<leader>gr` / `<leader>gp` | Stage / reset / preview hunk |

### Misc
| Atalho | Ação |
|--------|------|
| `<C-b>` | Neo-tree |
| `<leader>sv` / `<leader>sh` | Split vertical / horizontal |
| `<C-j>` | Executar requisição HTTP (Kulala) |
| `<leader>bd` | Fechar buffer sem fechar o split |

## Troubleshooting

- **LSP não conecta** → `:Mason` pra ver se o servidor está instalado, `:LspLog` pra ver erros
- **Sem highlight** → `:TSInstall <linguagem>`
- **Telescope lento** → confirma que `ripgrep` e `fd` estão no PATH
- **Sem ícones** → Nerd Font não configurada no terminal
- **Fórmulas LaTeX não renderizam (render-markdown)** → É necessário ter ao menos uma das seguintes dependências instaladas para converter strings LaTeX em unicode:
  - **libtexprintf** (usa `utftex`) — `brew install libtexprintf`
  - **pylatexenc** (usa `latex2text`) — `pip install pylatexenc`

  Mais detalhes na [documentação do render-markdown.nvim](https://github.com/MeanderingProgrammer/render-markdown.nvim?tab=readme-ov-file#user-content-fnref-3-f67c77c602e1e31fcd6a932611f5402c).

- **Erro no tree-sitter-cli (`--no-binding` não suportado)** → A versão 0.26+ do `tree-sitter-cli` removeu o parâmetro `--no-binding`, quebrando a instalação de alguns parsers (ex: `latex`). Use a versão 0.25.10:
  ```bash
  # Via npm
  npm install -g tree-sitter-cli@0.25.10

  # Via Homebrew
  brew install tree-sitter@0.22
  brew link --force tree-sitter@0.22
  ```

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
