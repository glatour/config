return {
  -- },
  {
    'mfussenegger/nvim-dap',
    dependencies = {
      'rcarriga/nvim-dap-ui',
      'nvim-neotest/nvim-nio',

      -- Installs the debug adapters for you
      'williamboman/mason.nvim',
      'jay-babu/mason-nvim-dap.nvim',
    },
    keys = function(_, keys)
      local dap = require 'dap'
      local dapui = require 'dapui'
      return {
        -- Basic debugging keymaps, feel free to change to your liking!
        { '<F5>', dap.continue, desc = 'Debug: Start/Continue' },
        { '<F11>', dap.step_into, desc = 'Debug: Step Into' },
        { '<F10>', dap.step_over, desc = 'Debug: Step Over' },
        { '<Shift><F11>', dap.step_out, desc = 'Debug: Step Out' },
        { '<leader>b', dap.toggle_breakpoint, desc = 'Debug: Toggle Breakpoint' },
        { '<leader>cb', dap.clear_breakpoints, desc = 'Debug: Clear Breakpoints' },
        {
          '<leader>B',
          function()
            dap.set_breakpoint(vim.fn.input 'Breakpoint condition: ')
          end,
          desc = 'Debug: Set Breakpoint',
        },
        {
          '<F3>',
          function()
            dapui.eval()
          end,
          desc = 'Debug: Float Element',
        },
        {
          '<F2>',
          function()
            dapui.float_element 'stacks'
          end,
          desc = 'Debug: Float Element',
        },

        -- Toggle to see last session result. Without this, you can't see session output in case of unhandled exception.
        { '<F7>', dapui.toggle, desc = 'Debug: See last session result.' },
        unpack(keys),
      }
    end,
    config = function()
      local dap = require 'dap'
      local dapui = require 'dapui'
      local sign = vim.fn.sign_define

      -- require('netcoredbg-macOS-arm64').setup(require 'dap')
      require('mason-nvim-dap').setup {
        ensure_installed = {
          'netcoredbg',
        },

        -- Makes a best effort to setup the various debuggers with
        -- reasonable debug configurations
        automatic_installation = true,
      }

      sign('DapBreakpoint', { text = '●', texthl = 'DapBreakpoint', linehl = '', numhl = '' })
      sign('DapBreakpointCondition', { text = '●', texthl = 'DapBreakpointCondition', linehl = '', numhl = '' })
      sign('DapLogPoint', { text = '◆', texthl = 'DapLogPoint', linehl = '', numhl = '' })
      sign('DapStopped', { text = '', texthl = 'DapStopped', linehl = 'DapStopped', numhl = 'DapStopped' })

      local netcoredbgPath = '/usr/local/netcoredbg'
      if vim.fn.has 'win32' == 1 then
        netcoredbgPath = vim.fs.normalize(vim.fn.stdpath 'data' .. '/mason/packages/netcoredbg/netcoredbg')
      end

      -- used by nvim-dap
      dap.adapters.coreclr = {
        type = 'executable',
        command = netcoredbgPath,
        args = { '--interpreter=vscode' },
        options = {
          detached = false,
        },
      }

      -- neotest test runner looks at this table
      dap.adapters.netcoredbg = vim.deepcopy(dap.adapters.coreclr)

      -- useful for debugging issues with dap
      -- Logs are written to :lua print(vim.fn.stdpath('cache'))
      dap.set_log_level 'TRACE' -- or `TRACE` for more logs

      -- used by nvim-dap
      dap.configurations.cs = {
        {
          type = 'netcoredbg',
          name = 'launch - netcoredbg',
          request = 'launch',
          program = function()
            return vim.fn.input('Path to dll: ', vim.fn.getcwd() .. '/bin/Debug/', 'file')
          end,
          cwd = '${workspaceFolder}',
        },
      }

      -- Dap UI setup
      -- For more information, see |:help nvim-dap-ui|
      dapui.setup {
        -- Set icons to characters that are more likely to work in every terminal.
        --    Feel free to remove or use ones that you like more! :)
        --    Don't feel like these are good choices.
        icons = { expanded = '▾', collapsed = '▸', current_frame = '*' },
        controls = {
          icons = {
            pause = '⏸',
            play = '▶',
            step_into = '⏎',
            step_over = '⏭',
            step_out = '⏮',
            step_back = 'b',
            run_last = '▶▶',
            terminate = '⏹',
            disconnect = '⏏',
          },
        },

        layouts = {
          {
            elements = {
              {
                id = 'scopes',
                size = 0.5,
              },
              -- {
              --   id = 'breakpoints',
              --   size = 0.25,
              -- },
              {
                id = 'watches',
                size = 0.5,
              },
              -- {
              --   id = 'stacks',
              --   size = 0.25,
              -- },
            },
            position = 'left',
            size = 30,
          },
          {
            elements = {
              {
                id = 'repl',
                size = 0.7,
              },
              {
                id = 'console',
                size = 0.3,
              },
            },
            position = 'bottom',
            size = 10,
          },
        },
        mappings = {
          edit = 'e',
          expand = { '<CR>', '<2-LeftMouse>' },
          open = 'o',
          remove = 'd',
          repl = 'r',
          toggle = 't',
        },
      }
      dap.listeners.after.event_initialized['dapui_config'] = dapui.open
      dap.listeners.before.event_terminated['dapui_config'] = dapui.close
      dap.listeners.before.event_exited['dapui_config'] = dapui.close
    end,
  },
}
