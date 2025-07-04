return {
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.6",
    -- cmd = "Telescope", -- se a linha for descomentada o telescope nao funcionara ao startar o nvim
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope-ui-select.nvim",
      -- FZF é opcional, só será carregado se compilar com sucesso
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
        enabled = function()
          return vim.fn.executable("make") == 1 and vim.fn.executable("gcc") == 1
        end,
      },
      "nvim-telescope/telescope-file-browser.nvim",
    },
    config = function()
      local telescope = require("telescope")
      local actions = require("telescope.actions")
      local telescopeBuiltin = require("telescope.builtin")
      local icons = require("utils.icons")
      local fb_actions = require("telescope._extensions.file_browser.actions")

      local function formattedName(_, path)
        local tail = vim.fs.basename(path)
        local parent = vim.fs.dirname(path)
        if parent == "." then
          return tail
        end
        return string.format("%s\t\t%s", tail, parent)
      end

      telescope.setup({
        defaults = {
          mappings = {
            i = {
              ["<esc>"] = actions.close,                    -- Fecha o Telescope
              ["<C-j>"] = actions.move_selection_next,      -- Próximo item
              ["<C-k>"] = actions.move_selection_previous,  -- Item anterior
              ["<C-u>"] = actions.preview_scrolling_up,     -- Rola preview para cima
              ["<C-d>"] = actions.preview_scrolling_down,   -- Rola preview para baixo
              ["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,  -- Envia para quickfix
              ["<C-l>"] = actions.complete_tag,            -- Completa tag
              ["<C-/>"] = actions.which_key,               -- Mostra atalhos disponíveis
              ["<C-w>"] = { "<c-s-w>", type = "command" }, -- Permite deletar palavra no prompt
            },
            n = {
              ["q"] = actions.close,                       -- Fecha com 'q'
              ["<C-c>"] = actions.close,                   -- Fecha com Ctrl-c
              ["<C-u>"] = actions.preview_scrolling_up,    -- Rola preview para cima
              ["<C-d>"] = actions.preview_scrolling_down,  -- Rola preview para baixo
              ["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,  -- Envia para quickfix
            },
          },
          file_ignore_patterns = { "node_modules/", "*-lock.json", ".git/" },  -- Ignora estes padrões
          selection_caret = icons.ui.DoubleChevronRight .. " ",                -- Indicador de seleção
          prompt_prefix = " " .. icons.ui.Telescope .. " ",                    -- Ícone do prompt
          color_devicons = true,                                               -- Ícones coloridos
          set_env = { ["COLORTERM"] = "truecolor" },
          layout_config = {
            horizontal = {
              preview_width = 0.55,    -- Preview ocupa 55% da largura
              results_width = 0.8,     -- Lista de resultados ocupa 80% da largura
            },
            vertical = {
              mirror = false,          -- Não inverte a posição do preview
            },
            width = 0.87,             -- Janela do Telescope ocupa 87% da tela
            height = 0.80,            -- Janela do Telescope ocupa 80% da altura
            preview_cutoff = 120,     -- Largura mínima para mostrar preview
          },
          vimgrep_arguments = {
            "rg",                     -- Usa ripgrep para busca
            "--color=never",          -- Sem cores na saída
            "--no-heading",           -- Sem cabeçalhos
            "--with-filename",        -- Mostra nome do arquivo
            "--line-number",          -- Mostra número da linha
            "--column",               -- Mostra número da coluna
            "--smart-case",           -- Ignora case se busca for minúscula
            "--trim",                 -- Remove espaços em branco
          },
        },
        pickers = {
          find_files = {
            previewer = true,           -- Mostra preview do arquivo
            path_display = formattedName, -- Formato personalizado do nome
            hidden = true,              -- Inclui arquivos ocultos
            layout_config = {
              height = 0.4,
              prompt_position = "bottom",
              preview_cutoff = 120,
            },
          },
          live_grep = {
            only_sort_text = true,      -- Ordena apenas pelo texto
            previewer = true,           -- Mostra preview do arquivo
          },
          treesitter = {
            show_line = true,
            previewer = true,
          },
          grep_string = {
            only_sort_text = true,      -- Ordena apenas pelo texto
            previewer = true,           -- Mostra preview do arquivo
          },
          buffers = {
            previewer = false,          -- Sem preview para buffers
            initial_mode = "normal",    -- Começa em modo normal
            mappings = {
              i = {
                ["<C-d>"] = actions.delete_buffer,  -- Ctrl-d deleta buffer
              },
              n = {
                ["dd"] = actions.delete_buffer,     -- dd deleta buffer
              },
            },
          },
          lsp_references = {
            show_line = true,              -- Mostra linha no resultado
            previewer = true,              -- Mostra preview
            include_declaration = true,     -- Inclui declaração original
            include_current_line = true,    -- Inclui linha atual
            jump_type = "never",           -- Não pula automaticamente
            fname_width = 60,              -- Largura do nome do arquivo
            trim_text = true,              -- Remove espaços extras
          },
          lsp_definitions = {
            show_line = true,              -- Mostra linha no resultado
            previewer = true,              -- Mostra preview
            jump_type = "never",           -- Não pula automaticamente
            fname_width = 60,              -- Largura do nome do arquivo
          },
          lsp_implementations = {
            show_line = true,              -- Mostra linha no resultado
            previewer = true,              -- Mostra preview
            jump_type = "never",           -- Não pula automaticamente
            fname_width = 60,              -- Largura do nome do arquivo
          },
          colorscheme = {
            enable_preview = true,
          },
        },
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown({
              previewer = true,                    -- Mostra preview
              prompt_prefix = " " .. icons.ui.Search .. " ",  -- Ícone de busca
              initial_mode = "insert",             -- Começa em modo insert
              sorting_strategy = "ascending",      -- Ordem ascendente
              layout_strategy = "horizontal",      -- Layout horizontal
              layout_config = {
                prompt_position = "top",           -- Prompt no topo
                horizontal = {
                  width = 0.5,                    -- Largura da janela
                  preview_width = 0.6,            -- Largura do preview
                },
              },
            }),
          },
          file_browser = {
            theme = "ivy",
            path = vim.loop.cwd(),
            cwd = vim.loop.cwd(),
            cwd_to_path = false,
            grouped = false,
            files = true,
            add_dirs = true,
            depth = 1,
            auto_depth = false,
            select_buffer = true,
            hidden = { file_browser = false, folder_browser = false },
            respect_gitignore = vim.fn.executable("fd") == 1,
            no_ignore = false,
            follow_symlinks = false,
            browse_files = require(
              "telescope._extensions.file_browser.finders"
            ).browse_files,
            browse_folders = require(
              "telescope._extensions.file_browser.finders"
            ).browse_folders,
            hide_parent_dir = false,
            collapse_dirs = false,
            prompt_path = false,
            quiet = false,
            dir_icon = "",
            dir_icon_hl = "Default",
            display_stat = { date = true, size = true, mode = true },
            hijack_netrw = false,
            use_fd = true,
            git_status = true,
            mappings = {
              ["i"] = {
                ["<A-c>"] = fb_actions.create,
                ["<S-CR>"] = fb_actions.create_from_prompt,
                ["<A-r>"] = fb_actions.rename,
                ["<A-m>"] = fb_actions.move,
                ["<A-y>"] = fb_actions.copy,
                ["<A-d>"] = fb_actions.remove,
                ["<C-o>"] = fb_actions.open,
                ["<C-g>"] = fb_actions.goto_parent_dir,
                ["<C-e>"] = fb_actions.goto_home_dir,
                ["<C-w>"] = fb_actions.goto_cwd,
                ["<C-t>"] = fb_actions.change_cwd,
                ["<C-f>"] = fb_actions.toggle_browser,
                ["<C-h>"] = fb_actions.toggle_hidden,
                ["<C-s>"] = fb_actions.toggle_all,
                ["<bs>"] = fb_actions.backspace,
              },
              ["n"] = {
                ["c"] = fb_actions.create,
                ["r"] = fb_actions.rename,
                ["m"] = fb_actions.move,
                ["y"] = fb_actions.copy,
                ["d"] = fb_actions.remove,
                ["o"] = fb_actions.open,
                ["g"] = fb_actions.goto_parent_dir,
                ["e"] = fb_actions.goto_home_dir,
                ["w"] = fb_actions.goto_cwd,
                ["t"] = fb_actions.change_cwd,
                ["f"] = fb_actions.toggle_browser,
                ["h"] = fb_actions.toggle_hidden,
                ["s"] = fb_actions.toggle_all,
              },
            },
          },
        },
      })

      -- Tenta carregar e configurar o FZF apenas se estiver disponível
      local has_fzf, _ = pcall(require, "telescope._extensions.fzf")
      if has_fzf then
        telescope.setup({
          extensions = {
            fzf = {
              -- Habilita busca fuzzy
              -- Se true, pesquisa não precisa ser exata e ordem não importa
              -- Ex: 'abc' encontrará 'app/backend/controller'
              fuzzy = true,

              -- Substitui o algoritmo de ordenação padrão do Telescope
              -- Usa o algoritmo nativo em C do fzf para melhor performance
              override_generic_sorter = true,

              -- Substitui o algoritmo de busca de arquivos
              -- Muito mais rápido para projetos grandes
              override_file_sorter = true,

              -- Define como maiúsculas/minúsculas são tratadas
              -- "smart_case": ignora maiúsculas/minúsculas se busca for toda minúscula
              -- "ignore_case": sempre ignora maiúsculas/minúsculas
              -- "respect_case": sempre considera maiúsculas/minúsculas
              case_mode = "smart_case",
            },
          },
        })
      end

      -- Carrega as extensões
      telescope.load_extension("ui-select")
      
      -- Tenta carregar o FZF
      if has_fzf then
        local ok, err = pcall(telescope.load_extension, "fzf")
        if not ok then
          vim.notify("Erro ao carregar telescope-fzf: " .. err, vim.log.levels.WARN)
        end
      end

      -- Keymaps globais do Telescope
      -- Ctrl-p para busca rápida de arquivos (estilo VSCode/Sublime)
      vim.keymap.set("n", "<C-p>", telescopeBuiltin.find_files, { desc = "Buscar arquivos (ctrl-p)" })
      -- Keymaps com leader para consistência
      -- vim.keymap.set("n", "<leader>ff", telescopeBuiltin.find_files, { desc = "Buscar arquivos" })
      vim.keymap.set("n", "<leader>fg", telescopeBuiltin.live_grep, { desc = "Buscar texto" })
      vim.keymap.set("n", "<leader>fb", telescopeBuiltin.buffers, { desc = "Listar buffers" })
      vim.keymap.set("n", "<leader>fh", telescopeBuiltin.help_tags, { desc = "Buscar na ajuda" })
      vim.keymap.set("n", "<leader>fs", telescopeBuiltin.grep_string, { desc = "Buscar palavra sob cursor" })
      vim.keymap.set("n", "<leader>fr", telescopeBuiltin.resume, { desc = "Retomar última busca" })
    end,
  },
}
