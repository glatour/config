vim.keymap.set('n', '<Leader>tb', function()
  require('nvchad.term').toggle { id = 'tb1', pos = 'sp' }
end, {
  desc = 'toggle terminal bottom',
})

vim.keymap.set('n', '<Leader>tf', function()
  require('nvchad.term').toggle {
    id = 'tb1',
    pos = 'float',
    float_opts = {
      row = 0.1,
      col = 0.1,
      width = 0.8,
      height = 0.65,
    },
  }
end, {
  desc = 'toggle floating terminal',
})

vim.keymap.set('n', '<Leader>tl', function()
  require('nvchad.term').toggle {
    id = 'tl',
    pos = 'float',
    cmd = 'lazygit',
    float_opts = {
      row = 0.1,
      col = 0.1,
      width = 0.8,
      height = 0.65,
    },
  }
end, {
  desc = 'toggle lazygit',
})
