local neotest = function()
  return require 'neotest'
end

local set = vim.keymap.set

local neotest_dap = function()
  -- if vim.bo.filetype == "cs" then
  -- neotest().run.run({ strategy = require("neotest-dotnet.strategies.netcoredbg"), is_custom_dotnet_debug = true })
  -- else
  neotest().run.run { strategy = 'dap' }
  -- end
end

local function get_nearest_class_name()
  local ts_utils = require 'nvim-treesitter.ts_utils'
  local node = ts_utils.get_node_at_cursor()

  while node do
    if node:type() == 'class_declaration' then
      local classNameNode = node:field 'name'
      return vim.treesitter.get_node_text(classNameNode[1], vim.api.nvim_get_current_buf())
    end
    node = node:parent()
  end
end

set('n', '<leader>ud', neotest_dap, { desc = '[U]nit test [D]ebug' })
set('n', '<leader>ur', function()
  neotest().run.run()
end, { desc = '[U]nit test [R]un closest' })
set('n', '<leader>ua', function()
  neotest().run.stop()
end, { desc = '[U]nit test [A]bort' })
set('n', '<leader>uw', function()
  neotest().run.attach()
end, { desc = '[U]nit test [W]atch' })
set('n', '<leader>uf', function()
  local className = get_nearest_class_name()
  if not className then
    return
  end
  print(className)
  neotest().run.run { vim.fn.expand '%', dotnet_additional_args = { '--filter FullyQualifiedName~' .. className } }
end, { desc = '[U]nit test run [F]ile' })
set('n', '<leader>up', function()
  neotest().run.run(vim.fn.getcwd())
end, { desc = '[U]nit test run [P]roject' })

set('n', '<leader>uo', function()
  neotest().output_panel.toggle()
end, { desc = '[U]nit test [O]utput' })
set('n', '<leader>ut', function()
  neotest().output.open { enter = true }
end, { desc = '[U]nit test [T]oggle' })
set('n', '<leader>us', function()
  neotest().summary.toggle()
end, { desc = '[U]nit test [S]ummary' })
set('n', '<silent>[n', function()
  neotest().jump.prev { status = 'failed' }
end, { desc = '[N]avigate to previous failed test' })
set('n', '<silent>]n', function()
  neotest().jump.next { status = 'failed' }
end, { desc = '[N]avigate to next failed test' })
