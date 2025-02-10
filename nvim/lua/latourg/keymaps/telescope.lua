vim.api.nvim_set_keymap('n', '<C-p>', ":lua require'telescope'.extensions.project.project{}<CR>", { noremap = true, silent = true })
vim.keymap.set('n', '<C-s>', ':Telescope persisted<cr>')
