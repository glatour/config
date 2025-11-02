return {
  -- https://github.com/folke/flash.nvim
  {
    'folke/flash.nvim',
    event = 'VeryLazy',
    ---@type Flash.Config
    opts = {},
    keys = {
      {
        's',
        mode = { 'n', 'x', 'o' },
        function()
          require('flash').jump()
        end,
        desc = 'Flash',
      },
      {
        'S',
        mode = { 'n', 'x', 'o' },
        function()
          require('flash').treesitter()
        end,
        desc = 'Flash Treesitter',
      },
      {
        'r',
        mode = 'o',
        function()
          require('flash').remote()
        end,
        desc = 'Remote Flash',
      },
      {
        'R',
        mode = { 'o', 'x' },
        function()
          require('flash').treesitter_search()
        end,
        desc = 'Treesitter Search',
      },
      {
        '<c-s>',
        mode = { 'c' },
        function()
          require('flash').toggle()
        end,
        desc = 'Toggle Flash Search',
      },
    },
  },
  -- https://github.com/andymass/vim-matchup?tab=readme-ov-file#detailed-feature-documentation
  { 'andymass/vim-matchup' },
  {
    'christoomey/vim-tmux-navigator',
    cmd = {
      'TmuxNavigateLeft',
      'TmuxNavigateDown',
      'TmuxNavigateUp',
      'TmuxNavigateRight',
      'TmuxNavigatePrevious',
    },
    keys = {
      { '<c-h>', '<cmd><C-U>TmuxNavigateLeft<cr>' },
      { '<c-j>', '<cmd><C-U>TmuxNavigateDown<cr>' },
      { '<c-k>', '<cmd><C-U>TmuxNavigateUp<cr>' },
      { '<c-l>', '<cmd><C-U>TmuxNavigateRight<cr>' },
      { '<c-\\>', '<cmd><C-U>TmuxNavigatePrevious<cr>' },
    },
  },
  {
    'cbochs/grapple.nvim',
    dependencies = {
      { 'nvim-tree/nvim-web-devicons' },
    },
    opts = {
      scope = 'git_branch',
      icons = true,
      quick_select = '123456789',
    },
    keys = {
      { ';', '<cmd>Grapple toggle_tags<cr>', desc = 'Toggle tags menu' },

      { '<c-s>', '<cmd>Grapple toggle<cr>', desc = 'Toggle tag' },
      { 'H', '<cmd>Grapple cycle_tags next<cr>', desc = 'Go to next tag' },
      { 'L', '<cmd>Grapple cycle_tags prev<cr>', desc = 'Go to previous tag' },
    },
  },
}
