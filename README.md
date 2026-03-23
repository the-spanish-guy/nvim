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

`<leader>th` abre um picker com preview ao vivo — navegue com `j/k` e veja o tema aplicado em tempo real. Confirmar com Enter salva a escolha entre sessões.

Temas disponíveis: **vague**, **catppuccin**, **rosepine**, **tokyonight**, **kanagawa**.

### Adicionando um novo tema

Crie `lua/themes/nome.lua`:

```lua
local flavor = "variante-padrao"

return {
  name = "nome",
  variants = { "a", "b" }, -- opcional
  lualine = "nome-lualine",
  colors = function()
    local colors = require("tema.colors").setup({ style = flavor })
    return { updates = colors.alguma_cor }
  end,
  setup = function()
    require("tema").setup({ style = flavor })
    vim.o.background = "dark"
    vim.cmd.colorscheme("nome-" .. flavor)
  end,
}
```

E crie `lua/plugins/nome.lua`:

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

O picker detecta automaticamente.

## LSP

Servidores gerenciados pelo Mason — para adicionar um novo, basta incluir em `lua/plugins/lsp/servers.lua`. O Mason instala e o LSP conecta automaticamente.

Formatters e linters ficam centralizados em `lua/plugins/lsp/tools.lua`. Adicionar lá já resolve instalação (Mason), configuração (conform/nvim-lint) e filetypes.

**`<leader>ft`** abre um picker para trocar o filetype do buffer atual, igual ao seletor de linguagem do VSCode. Funciona em arquivos dentro de projetos e em buffers sem nome — em ambos os casos o LSP inicia automaticamente.

## Autocompletação

As sources do nvim-cmp são divididas em base (LSP, snippets, path, buffer, calc — disponíveis em tudo) e específicas por filetype. SQL e LaTeX já têm sources dedicados configurados e só aparecem nos filetypes corretos.

Para adicionar um source específico de linguagem, edite `lua/plugins/completions.lua`:

```lua
cmp.setup.filetype({ "python" }, {
  sources = cmp.config.sources(vim.list_extend(
    vim.deepcopy(base_sources),
    { { name = "nome_do_source" } }
  )),
})
```

Se o source faz sentido em qualquer arquivo, vai em `base_sources` mesmo.

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

## Troubleshooting

- **LSP não conecta** → `:Mason` pra ver se o servidor está instalado, `:LspLog` pra ver erros
- **Sem highlight** → `:TSInstall <linguagem>`
- **Telescope lento** → confirma que `ripgrep` e `fd` estão no PATH
- **Sem ícones** → Nerd Font não configurada no terminal

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
