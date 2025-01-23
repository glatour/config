return {
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
  { --https://github.com/hedyhli/outline.nvim
    'hedyhli/outline.nvim',
    config = function()
      -- Example mapping to toggle outline
      vim.keymap.set('n', '<leader>oo', '<cmd>Outline<CR>', { desc = 'Toggle Outline' })

      require('outline').setup {
        -- Your setup opts here (leave empty to use defaults)
        outline_window = {
          auto_jump = true,
        },
      }
    end,
  },
  { 'jose-elias-alvarez/typescript.nvim', lazy = true }, -- add lsp plugin
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
