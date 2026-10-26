return {
  "nvim-treesitter/nvim-treesitter",
  branch = "main",
  lazy = false,
  build = ":TSUpdate",
  dependencies = {
    "nvim-treesitter/nvim-treesitter-textobjects",
  },
  config = function()
    local ts = require("nvim-treesitter")
    ts.setup({})

    local parsers = {
      "c",
      "go",
      "lua",
      "vim",
      "css",
      "sql",
      "tsx",
      "diff",
      "fish",
      "bash",
      "html",
      "json",
      "toml",
      "yaml",
      "latex",
      "jsdoc",
      "regex",
      "astro",
      "gomod",
      "gosum",
      "query",
      "gotmpl",
      "vimdoc",
      "python",
      "markdown",
      "gitignore",
      "typescript",
      "javascript",
      "markdown_inline",
    }
    -- instala de forma assíncrona só o que ainda falta
    local missing = vim.tbl_filter(function(lang)
      return not vim.list_contains(ts.get_installed("parsers"), lang)
    end, parsers)
    if #missing > 0 then
      ts.install(missing)
    end

    -- a branch main não tem mais highlight/indent/auto_install integrados:
    -- ativa highlight e indent por filetype e instala o parser sob demanda
    local function start(buf, lang)
      if not vim.api.nvim_buf_is_valid(buf) then
        return
      end
      if pcall(vim.treesitter.start, buf, lang) then
        vim.bo[buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
      end
    end

    vim.api.nvim_create_autocmd("FileType", {
      group = vim.api.nvim_create_augroup("treesitter_start", { clear = true }),
      callback = function(args)
        local lang = vim.treesitter.language.get_lang(args.match)
        if not lang then
          return
        end
        if vim.list_contains(ts.get_installed("parsers"), lang) then
          start(args.buf, lang)
        elseif vim.list_contains(ts.get_available(), lang) then
          ts.install(lang):await(function()
            vim.schedule(function()
              start(args.buf, lang)
            end)
          end)
        end
      end,
    })

    -- nvim-treesitter-textobjects foi reescrito e não usa mais nvim-treesitter.configs
    -- setup próprio com keymaps manuais
    require("nvim-treesitter-textobjects").setup({
      select = { lookahead = true },
      move = { set_jumps = true },
    })

    local select = require("nvim-treesitter-textobjects.select")
    local move = require("nvim-treesitter-textobjects.move")
    local swap = require("nvim-treesitter-textobjects.swap")

    -- Select
    local select_maps = {
      ["af"] = "@function.outer",
      ["if"] = "@function.inner",
      ["ac"] = "@class.outer",
      ["ic"] = "@class.inner",
      ["aa"] = "@parameter.outer",
      ["ia"] = "@parameter.inner",
    }
    for key, query in pairs(select_maps) do
      vim.keymap.set({ "x", "o" }, key, function()
        select.select_textobject(query, "textobjects")
      end)
    end

    -- Move
    vim.keymap.set("n", "]f", function() move.goto_next_start("@function.outer", "textobjects") end)
    vim.keymap.set("n", "]c", function() move.goto_next_start("@class.outer", "textobjects") end)
    vim.keymap.set("n", "]F", function() move.goto_next_end("@function.outer", "textobjects") end)
    vim.keymap.set("n", "]C", function() move.goto_next_end("@class.outer", "textobjects") end)
    vim.keymap.set("n", "[f", function() move.goto_previous_start("@function.outer", "textobjects") end)
    vim.keymap.set("n", "[c", function() move.goto_previous_start("@class.outer", "textobjects") end)
    vim.keymap.set("n", "[F", function() move.goto_previous_end("@function.outer", "textobjects") end)
    vim.keymap.set("n", "[C", function() move.goto_previous_end("@class.outer", "textobjects") end)

    -- Swap
    vim.keymap.set("n", "<leader>sa", function()
      swap.swap_next("@parameter.inner", "textobjects")
    end)
    vim.keymap.set("n", "<leader>sA", function()
      swap.swap_previous("@parameter.inner", "textobjects")
    end)
  end,
}
