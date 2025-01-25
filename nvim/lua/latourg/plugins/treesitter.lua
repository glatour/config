return {
  {
    'nvim-treesitter/nvim-treesitter',
    -- Load on event or cmd
    build = ':TSUpdate',
    event = { 'BufReadPost', 'BufNewFile' },
    lazy = vim.fn.argc(-1) == 0, -- load treesitter early when opening a file from the cmdline
    init = function(plugin)
      -- PERF: add nvim-treesitter queries to the rtp and it's custom query predicates early
      -- This is needed because a bunch of plugins no longer `require("nvim-treesitter")`, which
      -- no longer trigger the **nvim-treesitter** module to be loaded in time.
      -- Luckily, the only things that those plugins need are the custom queries, which we make available
      -- during startup.
      require('lazy.core.loader').add_to_rtp(plugin)
      require 'nvim-treesitter.query_predicates'
    end,
    cmd = {
      'TSInstall',
      'TSInstallSync',
      'TSUpdate',
      'TSUpdateSync',
    },
    keys = {
      { '<c-g>', desc = 'Increment selection' },
      { '<bs>', desc = 'Decrement selection', mode = 'x' },
    },
    opts = {
      ensure_installed = {
        'c',
        'c_sharp',
        'css',
        'json',
        'bash',
        'diff',
        'html',
        'go',
        'lua',
        'luadoc',
        'markdown',
        'markdown_inline',
        'printf',
        'query',
        'typescript',
        'vim',
        'vimdoc',
        'yaml',
        'regex',
      },
      auto_install = true,
      highlight = { enable = true },
      indent = { enable = true },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = '<C-g>',
          node_incremental = '<C-g>',
          scope_incremental = false,
          node_decremental = '<bs>',
        },
      },
      textobjects = {
        select = {
          enable = true,
          lookahead = true,
          keymaps = {
            ['am'] = { query = '@function.outer', desc = 'Method' },
            ['im'] = { query = '@function.inner', desc = 'Method definition' },
            ['ac'] = { query = '@class.outer', desc = 'Class' },
            ['ic'] = { query = '@class.inner', desc = 'Class definition' },
            ['ap'] = { query = '@parameter.outer', desc = 'Parameter' },
            ['ip'] = { query = '@parameter.inner', desc = 'Parameter only' },
            ['al'] = { query = '@loop.outer', desc = 'Loop' },
            ['il'] = { query = '@loop.inner', desc = 'Loop definition' },
          },
          include_surrounding_whitespace = true,
        },
        move = {
          enable = true,
          set_jumps = true,
          goto_next_start = {
            [']m'] = { query = '@function.outer', desc = 'Next method start' },
            [']]'] = { query = '@class.outer', desc = 'Next class start' },
            [']p'] = { query = '@parameter.inner', desc = 'Next parameter start' },
          },
          goto_next_end = {
            [']M'] = { query = '@function.outer', desc = 'Next method end' },
            [']['] = { query = '@class.outer', desc = 'Next class end' },
            [']P'] = { query = '@parameter.outer', desc = 'Next parameter end' },
          },
          goto_previous_start = {
            ['[m'] = { query = '@function.outer', desc = 'Previous method start' },
            ['[['] = { query = '@class.outer', desc = 'Previous class start' },
            ['[p'] = { query = '@parameter.inner', desc = 'Previous parameter start' },
          },
          goto_previous_end = {
            ['[M'] = { query = '@function.outer', desc = 'Previous method end' },
            ['[]'] = { query = '@class.outer', desc = 'Previous class end' },
            ['[P'] = { query = '@parameter.outer', desc = 'Previous parameter end' },
          },
        },
      },
    },
    config = function(_, opts)
      require('nvim-treesitter.configs').setup(opts)
    end,
  },
}
