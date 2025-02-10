return {
  { 'RRethy/vim-illuminate' },
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
  -- {
  --   'nvim-neo-tree/neo-tree.nvim',
  --   version = '*',
  --   dependencies = {
  --     'nvim-lua/plenary.nvim',
  --     'nvim-tree/nvim-web-devicons',
  --     'MunifTanjim/nui.nvim',
  --   },
  --   cmd = 'Neotree',
  --   keys = {
  --     {
  --       '<leader>n',
  --       -- Close git_status source before opening filesystem so navigation is smoother
  --       function()
  --         local neotree = require 'neo-tree.command'
  --         neotree.execute {
  --           action = 'close',
  --           source = 'git_status',
  --         }
  --         neotree.execute {
  --           action = 'focus',
  --           source = 'filesystem',
  --           reveal = true,
  --         }
  --       end,
  --       -- Close git_status source before opening filesystem so navigation is smoother
  --       desc = 'NeoTree reveal',
  --       silent = true,
  --     },
  --     -- NOTE : caveat here is when using WSLv2 the cross-os file performance is bad so repos should be cloned in the wsl environment
  --     {
  --       '<leader>g',
  --       -- Close filesystem source before opening git_status so navigation is smoother
  --       function()
  --         local neotree = require 'neo-tree.command'
  --         neotree.execute {
  --           action = 'close',
  --           source = 'filesystem',
  --         }
  --         neotree.execute {
  --           action = 'focus',
  --           source = 'git_status',
  --         }
  --       end,
  --       desc = 'NeoTree show git status',
  --       silent = true,
  --     },
  --   },
  --   opts = {
  --     close_if_last_window = true,
  --     enable_git_status = true,
  --     open_file_do_not_replace_types = { 'terminal' },
  --     filesystem = {
  --       window = {
  --         mappings = {
  --           ['\\'] = 'close_window',
  --         },
  --       },
  --       follow_current_file = { enabled = true },
  --     },
  --   },
  --   config = function()
  --     require('neo-tree').setup {
  --       default_component_configs = {
  --         git_status = {
  --           symbols = {
  --             -- Change type
  --             added = '✚',
  --             deleted = '✖',
  --             modified = '',
  --             renamed = '󰁕',
  --             -- Status type
  --             untracked = '',
  --             ignored = '',
  --             unstaged = '󰄱',
  --             staged = '',
  --             conflict = '',
  --           },
  --         },
  --       },
  --     }
  --   end,
  -- },
  -- { 'mrbjarksen/neo-tree-diagnostics.nvim' },
  { 'ChristianChiarulli/neovim-codicons' },
  {
    'folke/edgy.nvim',
    ---@module 'edgy'
    ---@param opts Edgy.Config
    opts = function(_, opts)
      for _, pos in ipairs { 'top', 'bottom', 'left', 'right' } do
        opts[pos] = opts[pos] or {}
        table.insert(opts[pos], {
          ft = 'snacks_terminal',
          size = { height = 0.4 },
          title = '%{b:snacks_terminal.id}: %{b:term_title}',
          filter = function(_buf, win)
            return vim.w[win].snacks_win
              and vim.w[win].snacks_win.position == pos
              and vim.w[win].snacks_win.relative == 'editor'
              and not vim.w[win].trouble_preview
          end,
        })
      end
    end,
  },
  -- {
  --   'nvim-lualine/lualine.nvim',
  --   dependencies = { 'nvim-tree/nvim-web-devicons' },
  --   setup = function()
  --     require('lualine').setup {
  --       options = {
  --         icons_enabled = true,
  --         theme = 'auto',
  --         component_separators = { left = '', right = '' },
  --         section_separators = { left = '', right = '' },
  --         disabled_filetypes = {
  --           statusline = {},
  --           winbar = {},
  --         },
  --         ignore_focus = {},
  --         always_divide_middle = true,
  --         always_show_tabline = true,
  --         globalstatus = false,
  --         refresh = {
  --           statusline = 100,
  --           tabline = 100,
  --           winbar = 100,
  --         },
  --       },
  --       sections = {
  --         lualine_a = { 'mode' },
  --         lualine_b = { 'branch', 'diff', 'diagnostics' },
  --         lualine_c = { 'filename' },
  --         lualine_x = { 'encoding', 'fileformat', 'filetype' },
  --         lualine_y = { 'progress' },
  --         lualine_z = { 'location' },
  --       },
  --       inactive_sections = {
  --         lualine_a = {},
  --         lualine_b = {},
  --         lualine_c = { 'filename' },
  --         lualine_x = { 'location' },
  --         lualine_y = {},
  --         lualine_z = {},
  --       },
  --       tabline = {},
  --       winbar = {},
  --       inactive_winbar = {},
  --       extensions = {},
  --     }
  --   end,
  -- },
}
