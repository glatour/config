return {
  {
    'CopilotC-Nvim/CopilotChat.nvim',
    dependencies = {
      { 'github/copilot.vim' }, -- or zbirenbaum/copilot.lua
      { 'nvim-lua/plenary.nvim', branch = 'master' }, -- for curl, log and async functions
    },
    build = 'make tiktoken', -- Only on MacOS or Linux
    opts = {
      model = 'o3-mini',
    },
    -- See Commands section for default commands if you want to lazy load on them
    keys = {
      {
        '<leader>zc',
        ':CopilotChat<CR>',
        mode = 'n',
        desc = 'Copilot Chat',
      },
      {
        '<leader>ze',
        ':CopilotChatExplain<CR>',
        mode = 'n',
        desc = 'Copilot Explain',
      },
      {
        '<leader>zr',
        ':CopilotChatReview<CR>',
        mode = 'n',
        desc = 'Copilot Review',
      },
      {
        '<leader>zf',
        ':CopilotChatFix<CR>',
        mode = 'v',
        desc = 'Copilot Fix',
      },
      {
        '<leader>zo',
        ':CopilotChatOptimize<CR>',
        mode = 'v',
        desc = 'Copilot Optimize',
      },
      {
        '<leader>zd',
        ':CopilotChatDocs<CR>',
        mode = 'v',
        desc = 'Copilot Docs',
      },
      {
        '<leader>zt',
        ':CopilotChatTest<CR>',
        mode = 'v',
        desc = 'Copilot Test',
      },
    },
  },
  {
    'stevearc/overseer.nvim',
    opts = {},
    config = function()
      require('overseer').setup()

      vim.api.nvim_set_keymap('n', '<leader>or', ':OverseerRun<CR>', { noremap = true, silent = true, desc = '[Overseer] [r]un task' })
      vim.api.nvim_set_keymap('n', '<leader>ot', ':OverseerToggle<CR>', { noremap = true, silent = true, desc = '[Overseer] [t]oggle' })
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
  -- { --https://github.com/hedyhli/outline.nvim
  --   'hedyhli/outline.nvim',
  --   config = function()
  --     -- Example mapping to toggle outline
  --     vim.keymap.set('n', '<leader>oo', '<cmd>Outline<CR>', { desc = 'Toggle Outline' })
  --
  --     require('outline').setup {
  --       -- Your setup opts here (leave empty to use defaults)
  --       outline_window = {
  --         auto_jump = true,
  --       },
  --     }
  --   end,
  -- },
  { 'jose-elias-alvarez/typescript.nvim', lazy = true }, -- add lsp plugin
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
    'rachartier/tiny-inline-diagnostic.nvim',
    event = 'VeryLazy', -- Or `LspAttach`
    priority = 1000, -- needs to be loaded in first
    config = function()
      require('tiny-inline-diagnostic').setup()
    end,
  },
  {
    'folke/trouble.nvim',
    opts = {}, -- for default options, refer to the configuration section for custom setup.
    cmd = 'Trouble',
    specs = {
      'folke/snacks.nvim',
      opts = function(_, opts)
        return vim.tbl_deep_extend('force', opts or {}, {
          picker = {
            actions = require('trouble.sources.snacks').actions,
            win = {
              input = {
                keys = {
                  ['<c-t>'] = {
                    'trouble_open',
                    mode = { 'n', 'i' },
                  },
                },
              },
            },
          },
        })
      end,
    },
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
  {
    'NStefan002/speedtyper.nvim',
    branch = 'v2',
    lazy = false,
  },
}
