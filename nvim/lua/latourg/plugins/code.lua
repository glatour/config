return {
  -- { 'kevinhwang91/promise-async' },
  -- {
  --   'kevinhwang91/nvim-ufo',
  --   config = function()
  --     -- use { 'kevinhwang91/nvim-ufo', requires = 'kevinhwang91/promise-async' }
  --
  --     vim.o.foldcolumn = '1' -- '0' is not bad
  --     vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
  --     vim.o.foldlevelstart = 99
  --     vim.o.foldenable = true
  --
  --     -- Using ufo provider need remap `zR` and `zM`. If Neovim is 0.6.1, remap yourself
  --     vim.keymap.set('n', 'mR', require('ufo').openAllFolds)
  --     vim.keymap.set('n', 'mM', require('ufo').closeAllFolds)
  --
  --     -- -- Option 1: coc.nvim as LSP client
  --     -- use { 'neoclide/coc.nvim', branch = 'master', run = 'yarn install --frozen-lockfile' }
  --     -- require('ufo').setup()
  --     -- --
  --
  --     -- Option 2: nvim lsp as LSP client
  --     -- Tell the server the capability of foldingRange,
  --     -- Neovim hasn't added foldingRange to default capabilities, users must add it manually
  --     -- local capabilities = vim.lsp.protocol.make_client_capabilities()
  --     -- capabilities.textDocument.foldingRange = {
  --     --   dynamicRegistration = false,
  --     --   lineFoldingOnly = true,
  --     -- }
  --     -- local language_servers = require('lspconfig').util.available_servers() -- or list servers manually like {'gopls', 'clangd'}
  --     -- for _, ls in ipairs(language_servers) do
  --     --   require('lspconfig')[ls].setup {
  --     --     capabilities = capabilities,
  --     --     -- you can add other fields for setting up lsp server in this table
  --     --   }
  --     -- end
  --     -- require('ufo').setup()
  --
  --     --
  --
  --     -- Option 3: treesitter as a main provider instead
  --     -- (Note: the `nvim-treesitter` plugin is *not* needed.)
  --     -- ufo uses the same query files for folding (queries/<lang>/folds.scm)
  --     -- performance and stability are better than `foldmethod=nvim_treesitter#foldexpr()`
  --     require('ufo').setup {
  --       provider_selector = function(bufnr, filetype, buftype)
  --         return { 'treesitter', 'indent' }
  --       end,
  --     }
  --     --
  --
  --     -- -- Option 4: disable all providers for all buffers
  --     -- -- Not recommend, AFAIK, the ufo's providers are the best performance in Neovim
  --     -- require('ufo').setup {
  --     --   provider_selector = function(bufnr, filetype, buftype)
  --     --     return ''
  --     --   end,
  --     -- }
  --   end,
  -- },
  {
    'dense-analysis/ale',
    config = function()
      -- Configuration goes here.
      local g = vim.g

      g.ale_ruby_rubocop_auto_correct_all = 1

      -- g.ale_linters = {
      --   ruby = { 'rubocop', 'ruby' },
      --   lua = { 'lua_language_server' },
      -- }
    end,
  },
  {
    'folke/todo-comments.nvim',
    event = 'VimEnter',
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = {
      signs = false,
    },
  },
  { --https://github.com/hedyhli/outline.nvim
    'hedyhli/outline.nvim',
    config = function()
      -- Example mapping to toggle outline
      vim.keymap.set('n', '<leader>o', '<cmd>Outline<CR>', { desc = 'Toggle Outline' })

      require('outline').setup {
        -- Your setup opts here (leave empty to use defaults)
        outline_window = {
          auto_jump = true,
        },
      }
    end,
  },
  { 'jose-elias-alvarez/typescript.nvim', lazy = true }, -- add lsp plugin
  {
    'hedyhli/outline.nvim',
    config = function()
      -- Example mapping to toggle outline
      vim.keymap.set('n', '<leader>o', '<cmd>Outline<CR>', { desc = 'Toggle Outline' })

      require('outline').setup {
        -- Your setup opts here (leave empty to use defaults)
        outline_window = {
          auto_jump = true,
        },
      }
    end,
  },
  { 'RRethy/vim-illuminate' },
  {
    'elixir-tools/elixir-tools.nvim',
    version = '*',
    event = { 'BufReadPre', 'BufNewFile' },
    config = function()
      local elixir = require 'elixir'
      local elixirls = require 'elixir.elixirls'

      elixir.setup {
        nextls = {
          enable = true,
        },
        elixirls = {
          enable = true,
          settings = elixirls.settings {
            dialyzerEnabled = false,
            enableTestLenses = false,
          },
          on_attach = function(client, bufnr)
            vim.keymap.set('n', '<space>fp', ':ElixirFromPipe<cr>', {
              buffer = true,
              noremap = true,
            })
            vim.keymap.set('n', '<space>tp', ':ElixirToPipe<cr>', {
              buffer = true,
              noremap = true,
            })
            vim.keymap.set('v', '<space>em', ':ElixirExpandMacro<cr>', {
              buffer = true,
              noremap = true,
            })
          end,
        },
        projectionist = {
          enable = true,
        },
      }
    end,
    dependencies = { 'nvim-lua/plenary.nvim' },
  },
  -- https://github.com/rmagatti/goto-preview
  {
    'rmagatti/goto-preview',
    event = 'BufEnter',
    config = function()
      require('goto-preview').setup {
        default_mappings = true,
      }
    end,
  },
  {
    'folke/trouble.nvim',
    opts = {}, -- for default options, refer to the configuration section for custom setup.
    cmd = 'Trouble',
    keys = {
      {
        '<leader>xx',
        '<cmd>Trouble diagnostics toggle<cr>',
        desc = 'Diagnostics (Trouble)',
      },
      {
        '<leader>xX',
        '<cmd>Trouble diagnostics toggle filter.buf=0<cr>',
        desc = 'Buffer Diagnostics (Trouble)',
      },
      {
        '<leader>cs',
        '<cmd>Trouble symbols toggle focus=false<cr>',
        desc = 'Symbols (Trouble)',
      },
      {
        '<leader>cl',
        '<cmd>Trouble lsp toggle focus=false win.position=right<cr>',
        desc = 'LSP Definitions / references / ... (Trouble)',
      },
      {
        '<leader>xL',
        '<cmd>Trouble loclist toggle<cr>',
        desc = 'Location List (Trouble)',
      },
      {
        '<leader>xQ',
        '<cmd>Trouble qflist toggle<cr>',
        desc = 'Quickfix List (Trouble)',
      },
    },
  },
}
