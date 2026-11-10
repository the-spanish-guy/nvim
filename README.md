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

`<leader>th` abre um picker do Telescope com preview ao vivo — navegue e veja o tema aplicado em tempo real. Confirmar com Enter salva a escolha em `lua/theme.lua`, carregado no boot pelo `init.lua`.

Temas disponíveis: **catppuccin**, **rose-pine**, **tokyonight**, **kanagawa**, **vague**.

### Adicionando um novo tema

Instale o plugin em `lua/plugins/nome.lua`. O picker lista automaticamente todos os colorschemes instalados.

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

## Opções do editor

Definidas em `lua/settings/config.lua` (e `autocmds.lua`):

- **Folds por Treesitter**: o Treesitter calcula as dobras a partir da estrutura do código, e todas começam abertas. `za` alterna a dobra sob o cursor, `zc` fecha, `zo` abre, `zM` fecha todas e `zR` abre todas.
- **`winborder = "rounded"`**: borda arredondada padrão nas janelas flutuantes que não definem a própria.
- **`laststatus = 3`**: uma única barra de status global, em vez de uma por janela.
- **`ttimeoutlen = 0`**: o `Esc` sai do modo insert sem atraso. Em conexões lentas (SSH) isso pode confundir o `Esc` com sequências de teclas especiais.
- **`fillchars` com `diff:╱`**: as linhas de preenchimento do diff nativo (`:diffthis`, Diffview) saem hachuradas.
- **`cursorline` só na janela ativa**: o destaque da linha acompanha o foco entre os splits.
- **`iskeyword` com `-`**: o hífen conta como parte da palavra em qualquer arquivo, então `margin-left` é uma palavra só para `w`, `b`, `*` e `ciw`. Em código como `a-b` (sem espaços), a expressão inteira vira uma palavra; para desfazer, remova a linha `vim.opt.iskeyword:append("-")` do `config.lua`.

## Atalhos

### Geral
| Atalho | Ação |
|--------|------|
| `<Space>` | Leader |
| `<C-s>` | Salvar |
| `<leader>x` | Fechar buffer |
| `<S-h>` / `<S-l>` | Buffer anterior / próximo |

### Janelas
| Atalho | Ação |
|--------|------|
| `ss` / `sv` | Dividir na horizontal / vertical |
| `sh` `sj` `sk` `sl` | Navegar entre janelas |
| `sq` | Fechar a janela (nunca sai do Neovim na última) |
| `so` | Fechar as outras janelas |

O prefixo `s` ocupa o `s` nativo (substituir); use `cl` no lugar.

### Edição
| Atalho | Ação |
|--------|------|
| `<C-a>` | Selecionar o arquivo todo (linha a linha, bom para copiar) |
| `x` | Apagar caractere sem copiar |
| `<leader>dd` | Apagar a linha sem copiar |
| `<leader>p` | Colar o último yank, mesmo depois de apagar outra coisa (só o que foi copiado no Neovim) |
| `<leader>o` / `<leader>O` | Nova linha abaixo / acima sem continuar o comentário |
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
| `<leader>df` | Diffview: diff do repositório |
| `<leader>dfh` | Diffview: histórico do arquivo |
| `<leader>db` | DiffBandit: arquivos alterados do repositório |
| `<leader>dB` | DiffBandit: arquivo atual |
| `<leader>gs` / `<leader>gr` / `<leader>gp` | Stage / reset / preview hunk |
| `<leader>gb` | Histórico da linha atual (picker do snacks, com preview do diff de cada commit) |
| `<leader>gl` | Blame da linha atual (float do snacks com `git log -L`) |
| `<leader>gB` | Blame do arquivo inteiro (coluna lateral do gitsigns) |

Os atalhos de hunk e de blame só existem em arquivos rastreados pelo git. O float do `<leader>gl` termina com `[Process exited 0]`, que é a mensagem padrão do Neovim para buffers de terminal e não indica erro.

O [`delta`](https://github.com/dandavison/delta) é opcional: com ele instalado (`brew install git-delta`) e configurado como `core.pager` no `~/.gitconfig`, o float do `<leader>gl` e o `git diff`/`git log` do terminal saem coloridos, com realce de sintaxe. O Diffview, o DiffBandit e o gitsigns usam o diff nativo do Neovim e não dependem dele.

### Misc
| Atalho | Ação |
|--------|------|
| `<C-b>` | Neo-tree |
| `<C-j>` | Executar requisição HTTP (Kulala) |
| `<leader>bd` | Fechar buffer sem fechar o split |

Renomear ou mover um arquivo pelo Neo-tree avisa o LSP (via `snacks.rename`), que corrige os `import`s de quem o usa. Isso depende de o servidor suportar `workspace/willRenameFiles`: foi testado com o `ts_ls` (TypeScript/JavaScript); nos demais servidores o arquivo só é movido. Cada renomeação mostra o aviso `client.supports_method is deprecated`, vindo da versão atual do snacks com o Neovim 0.12; é inofensivo. Para renomear um **símbolo** (variável, função), use o `<F2>` (inc-rename).

## Troubleshooting

- **LSP não conecta** → `:Mason` pra ver se o servidor está instalado, `:LspLog` pra ver erros
- **Sem highlight** → `:TSInstall <linguagem>`
- **Telescope lento** → confirma que `ripgrep` e `fd` estão no PATH
- **Sem ícones** → Nerd Font não configurada no terminal
- **`stylua .` não funciona no terminal** → O `stylua` que o Neovim usa vem do Mason e fica dentro da pasta do próprio editor, então o terminal não o enxerga. Dentro do Neovim isso não atrapalha: `<leader>gf` formata normalmente. Só se você quiser rodar `stylua .` direto no terminal (ou em um hook/CI), instale uma cópia no sistema:
  ```bash
  # Via mise
  mise use -g stylua

  # Via Homebrew
  brew install stylua
  ```
  As duas cópias convivem sem problema: o Neovim continua usando a do Mason e o terminal passa a usar a que você instalou.
- **Fórmulas LaTeX não renderizam (render-markdown)** → É necessário ter ao menos uma das seguintes dependências instaladas para converter strings LaTeX em unicode:
  - **libtexprintf** (usa `utftex`) — `brew install libtexprintf`
  - **pylatexenc** (usa `latex2text`) — `pip install pylatexenc`

  Mais detalhes na [documentação do render-markdown.nvim](https://github.com/MeanderingProgrammer/render-markdown.nvim?tab=readme-ov-file#user-content-fnref-3-f67c77c602e1e31fcd6a932611f5402c).

- **Parser não instala (erro no `tree-sitter-cli`)** → O nvim-treesitter (branch `main`) compila os parsers localmente e precisa do `tree-sitter-cli` na versão **0.26.1 ou superior**, instalado pelo gerenciador de pacotes do sistema, **não pelo npm**. Versões anteriores não são suportadas por essa branch, e a cópia do npm fica presa à versão do Node ativa, o que pode deixar o comando quebrado quando o Node muda.
  ```bash
  # Via Homebrew
  brew install tree-sitter-cli

  # Se tiver uma cópia antiga pelo npm, remova para ela não esconder a do Homebrew
  npm uninstall -g tree-sitter-cli
  ```
  Para conferir qual está sendo usada: `which -a tree-sitter` e `tree-sitter --version`.

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
