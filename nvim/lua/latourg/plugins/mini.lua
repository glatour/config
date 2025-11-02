return {
  { -- Collection of various small independent plugins/modules
    'echasnovski/mini.nvim',
    config = function()
      require('mini.ai').setup {
        n_lines = 500,
      }

      -- Add/delete/replace surroundings (brackets, quotes, etc.)
      --
      -- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
      -- - sd'   - [S]urround [D]elete [']quotes
      -- - sr)'  - [S]urround [R]eplace [)] [']
      require('mini.surround').setup {
        mappings = {
          add = 'za', -- Add surrounding in Normal and Visual modes
          delete = 'zd', -- Delete surrounding
          find = 'zf', -- Find surrounding (to the right)
          find_left = 'zF', -- Find surrounding (to the left)
          highlight = 'zh', -- Highlight surrounding
          replace = 'zr', -- Replace surrounding
          update_n_lines = 'zn', -- Update `n_lines`

          suffix_last = 'l', -- Suffix to search with "prev" method
          suffix_next = 'n', -- Suffix to search with "next" method
        },
      }
      --
      -- https://github.com/echasnovski/mini.nvim/blob/main/readmes/mini-move.md
      --
      -- Visual mode. Select text (charwise with v, linewise with V, and blockwise with CTRL-V) and press customizable
      -- mapping to move in all four directions (left, right, down, up). It keeps Visual mode.
      -- Normal mode. Press customizable mapping to move current line in all four directions (left, right, down, up).
      require('mini.move').setup()

      require('mini.pairs').setup()

      require('mini.files').setup {
        windows = {
          preview = true,
          width_focus = 60,
          width_preview = 75,
        },
      }

      require('mini.statusline').setup()
      -- Simple and easy statusline.

      -- ... and there is more!
      --  Check out: https://github.com/echasnovski/mini.nvim
    end,
  },
}
