-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.hl.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})

-- Resize splits if the window gets resized.
vim.api.nvim_create_autocmd('VimResized', {
  group = vim.api.nvim_create_augroup('ResizeSplits', { clear = true }),
  callback = function()
    vim.cmd 'tabdo wincmd ='
  end,
})

-- Utility command for clearing macros.
vim.api.nvim_create_user_command('ClearRegisters', function()
  for r in ('abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ'):gmatch '%a' do
    vim.fn.setreg(r, '')
  end
  vim.cmd 'wshada'
end, { desc = 'Clear registers' })
