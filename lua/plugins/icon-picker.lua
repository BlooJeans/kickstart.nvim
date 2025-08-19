-- Icon picker.
return {
  {
    'ziontee113/icon-picker.nvim',
    dependencies = 'dressing.nvim',
    cmd = 'IconPickerNormal',
    opts = { disable_legacy_commands = true },
    keys = {
      { '<leader>ti', '<cmd>IconPickerNormal<cr>', desc = 'Icon picker' },
    },
  },
}
