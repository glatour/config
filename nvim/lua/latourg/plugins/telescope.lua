return {
  { -- Fuzzy Finder (files, lsp, etc)
    'nvim-telescope/telescope.nvim',
    event = 'VimEnter',
    branch = '0.1.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      { -- If encountering errors, see telescope-fzf-native README for installation instructions
        'nvim-telescope/telescope-fzf-native.nvim',

        -- `build` is used to run some command when the plugin is installed/updated.
        -- This is only run then, not every time Neovim starts up.
        build = 'make',

        -- `cond` is a condition used to determine whether this plugin should be
        -- installed and loaded.
        cond = function()
          return vim.fn.executable 'make' == 1
        end,
      },
      { 'nvim-telescope/telescope-ui-select.nvim' }, -- Useful for getting pretty icons, but requires a Nerd Font.
      {
        'nvim-tree/nvim-web-devicons',
        enabled = vim.g.have_nerd_font,
      },
    },
    config = function()
      -- Telescope is a fuzzy finder that comes with a lot of different things that
      -- it can fuzzy find! It's more than just a "file finder", it can search
      -- many different aspects of Neovim, your workspace, LSP, and more!
      --
      -- The easiest way to use Telescope, is to start by doing something like:
      --  :Telescope help_tags
      --
      -- After running this command, a window will open up and you're able to
      -- type in the prompt window. You'll see a list of `help_tags` options and
      -- a corresponding preview of the help.
      --
      -- Two important keymaps to use while in Telescope are:
      --  - Insert mode: <c-/>
      --  - Normal mode: ?
      --
      -- This opens a window that shows you all of the keymaps for the current
      -- Telescope picker. This is really useful to discover what Telescope can
      -- do as well as how to actually do it!

      -- [[ Configure Telescope ]]
      -- See `:help telescope` and `:help telescope.setup()`
      require('telescope').setup {
        -- You can put your default mappings / updates / etc. in here
        --  All the info you're looking for is in `:help telescope.setup()`
        --
        defaults = {
          path_display = {
            'truncate',
          },
          layout_config = {
            horizontal = {
              prompt_position = 'top',
              preview_width = 0.55,
            },
            width = 0.90,
            height = 0.85,
          },
          mappings = {
            i = {
              ['<c-enter>'] = 'to_fuzzy_refine',
              ['<C-é>'] = 'which_key',
              -- ['<c-d>'] = require('telescope.actions').delete_buffer,
              ['<C-b>'] = function(...)
                return require('telescope.actions').delete_buffer(...)
              end,
            },
            n = {
              ['<C-b>'] = function(...)
                return require('telescope.actions').delete_buffer(...)
              end,
            },
          },
        },
        pickers = {
          -- find_files = {
          --     theme = "ivy",
          -- }
        },
        -- pickers = {
        --   find_files = {
        --     hidden = true,
        --     no_ignore = true,
        --   },
        -- },
        extensions = {
          ['ui-select'] = { require('telescope.themes').get_dropdown() },
          -- resession = {
          --   prompt_title = 'Find Sessions', -- telescope prompt title
          --   dir = 'session', -- directory where resession stores sessions
          -- },
        },
      }

      -- Enable Telescope extensions if they are installed
      pcall(require('telescope').load_extension, 'fzf')
      pcall(require('telescope').load_extension, 'ui-select')
      pcall(require('telescope').load_extension, 'persisted')

      -- See `:help telescope.builtin`
      local builtin = require 'telescope.builtin'
      -- builtin.find_files { path_display = { 'truncate' } }
      -- vim.keymap.set('n', '<leader>sh', builtin.help_tags, {
      --   desc = '[S]earch [H]elp',
      -- })
      -- vim.keymap.set('n', '<leader>sk', builtin.keymaps, {
      --   desc = '[S]earch [K]eymaps',
      -- })
      -- vim.keymap.set('n', '<leader>sf', builtin.find_files, {
      --   desc = '[S]earch [F]iles',
      -- })
      -- vim.keymap.set('n', '<leader>ss', builtin.builtin, {
      --   desc = '[S]earch [S]elect Telescope',
      -- })
      -- vim.keymap.set('n', '<leader>sw', builtin.grep_string, {
      --   desc = '[S]earch current [W]ord',
      -- })
      -- vim.keymap.set('n', '<leader>sg', builtin.live_grep, {
      --   desc = '[S]earch by [G]rep',
      -- })
      -- vim.keymap.set('n', '<leader>sd', builtin.diagnostics, {
      --   desc = '[S]earch [D]iagnostics',
      -- })
      vim.keymap.set('n', '<leader>sde', function()
        require('telescope.builtin').diagnostics { severity = 'error' }
      end, { desc = '[S]earch [D]iagnostics [E]rror' })
      -- vim.keymap.set('n', '<leader>st', builtin.treesitter, {
      --   desc = '[S]earch [T]reesitter',
      -- })
      -- vim.keymap.set('n', '<leader>sr', builtin.resume, {
      --   desc = '[S]earch [R]esume',
      -- })
      -- vim.keymap.set('n', '<leader>s.', builtin.oldfiles, {
      --   desc = '[S]earch Recent Files ("." for repeat)',
      -- })
      -- vim.keymap.set('n', '<leader><leader>', builtin.buffers, {
      --   desc = '[ ] Find existing buffers',
      -- })
      vim.keymap.set('n', '<leader>gs', builtin.git_status, {
        desc = '[G]it [s]tatus',
      })
      vim.keymap.set('n', '<leader>js', builtin.lsp_document_symbols, { desc = '[J]ump to a [s]ymbols in active buffer' })
      vim.keymap.set('n', '<leader>jwc', function()
        builtin.lsp_workspace_symbols { symbols = { 'class' } }
      end, {
        desc = '[J]ump to [w]orkspace [c]lass',
      })
      vim.keymap.set('n', '<leader>jwm', function()
        builtin.lsp_workspace_symbols { symbols = { 'method', 'function', 'constructor' } }
      end, {
        desc = '[J]ump to [w]orkspace [m]ethod',
      })
      vim.keymap.set('n', '<leader>jt', function()
        builtin.lsp_document_symbols { symbols = { 'method', 'constructor', 'constant', 'function', 'property' } }
      end, {
        desc = '[j]ump [t]o file symbols',
      })

      -- vim.keymap.set('n', '<leader>si', function()
      --   builtin.live_grep {
      --     additional_args = function()
      --       return { '--ignore', '--hidden' }
      --     end,
      --   }
      -- end, { desc = 'Live grep for all files' })
      -- vim.keymap.set('n', '<leader>fi', function()
      --   builtin.find_files {
      --     no_ignore = true, -- Include ignored files
      --     hidden = true, -- Optionally include hidden files
      --   }
      -- end, { desc = 'Find all files' })

      -- Slightly advanced example of overriding default behavior and theme
      vim.keymap.set('n', '<leader>é', function()
        -- You can pass additional configuration to Telescope to change the theme, layout, etc.
        builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
          winblend = 30,
          previewer = false,
        })
      end, {
        desc = '[/] Fuzzily search in current buffer',
      })

      -- It's also possible to pass additional configuration options.
      --  See `:help telescope.builtin.live_grep()` for information about particular keys
      -- vim.keymap.set('n', '<leader>sé', function()
      --   builtin.live_grep {
      --     grep_open_files = true,
      --     prompt_title = 'Live Grep in Open Files',
      --   }
      -- end, {
      --   desc = '[S]earch [é] in Open Files',
      -- })

      -- Shortcut for searching your Neovim configuration files
      vim.keymap.set('n', '<leader>sn', function()
        builtin.find_files {
          cwd = vim.fn.stdpath 'config',
        }
      end, {
        desc = '[S]earch [N]eovim files',
      })
    end,
  },
}
