return {
  {
    'mbbill/undotree',
    setup = function()
      require('undotree').setup()

      vim.keymap.set('n', '<leader><F5>', vim.cmd.UndotreeToggle)
    end,
  },
}
