return {
  {
    'miversen33/sunglasses.nvim',
    config = function()
      require('sunglasses').setup {
        filter_percent = 0.2,
        filter_type = 'SHADE',
      }
    end,
  },
  {
    'j-hui/fidget.nvim',
    tag = 'v1.4.5',
    opts = {},
  },
  {
    'nvim-neo-tree/neo-tree.nvim',
    version = '*',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-tree/nvim-web-devicons',
      'MunifTanjim/nui.nvim',
    },
    cmd = 'Neotree',
    keys = {
      {
        '<leader>n',
        -- Close git_status source before opening filesystem so navigation is smoother
        function()
          local neotree = require 'neo-tree.command'
          neotree.execute {
            action = 'close',
            source = 'git_status',
          }
          neotree.execute {
            action = 'focus',
            source = 'filesystem',
            reveal = true,
          }
        end,
        -- Close git_status source before opening filesystem so navigation is smoother
        desc = 'NeoTree reveal',
        silent = true,
      },
      -- NOTE : caveat here is when using WSLv2 the cross-os file performance is bad so repos should be cloned in the wsl environment
      {
        '<leader>g',
        -- Close filesystem source before opening git_status so navigation is smoother
        function()
          local neotree = require 'neo-tree.command'
          neotree.execute {
            action = 'close',
            source = 'filesystem',
          }
          neotree.execute {
            action = 'focus',
            source = 'git_status',
          }
        end,
        desc = 'NeoTree show git status',
        silent = true,
      },
    },
    opts = {
      close_if_last_window = true,
      enable_git_status = true,
      open_file_do_not_replace_types = { 'terminal' },
      filesystem = {
        window = {
          mappings = {
            ['\\'] = 'close_window',
          },
        },
        follow_current_file = { enabled = true },
      },
    },
  },
  { 'mrbjarksen/neo-tree-diagnostics.nvim' },
  { 'ChristianChiarulli/neovim-codicons' },
}
