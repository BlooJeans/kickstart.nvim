return {
  {
    'romgrk/barbar.nvim',
    dependencies = { 'lewis6991/gitsigns.nvim', 'nvim-web-devicons' },
    opts = {},
    config = function()
      vim.cmd [[highlight BufferCurrent guibg='#003e7f']]
      vim.cmd [[highlight BufferCurrentSign guibg='#003e7f']]
      vim.cmd [[highlight BufferCurrentMod guifg='#E5AB0E' guibg='#003e7f']]
    end,
  },
}
