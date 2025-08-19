return {
  {
    'ray-x/lsp_signature.nvim',
    event = 'BufRead',
    desc = 'Show function signatures as you type',
    config = function()
      require('lsp_signature').setup()
    end,
  },
}
