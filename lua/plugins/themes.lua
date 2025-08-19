return {
  -- Themes
  -- {
  --   'folke/tokyonight.nvim',
  --   config = function()
  --     ---@diagnostic disable-next-line: missing-fields
  --     require('tokyonight').setup {
  --       styles = {
  --         comments = { italic = false }, -- Disable italics in comments
  --       },
  --     }
  --   end,
  -- },
  -- { 'sainnhe/sonokai' },
  -- { 'sainnhe/edge' },
  -- { 'romgrk/doom-one.vim' },
  -- { -- You can easily change to a different colorscheme.
  --   -- Change the name of the colorscheme plugin below, and then
  --   -- change the command in the config to whatever the name of that colorscheme is.
  --   --
  --   -- If you want to see what colorschemes are already installed, you can use `:Telescope colorscheme`.
  --   -- Included themes: nvcode (basically just dark+), onedark, nord, aurora (more colorful nord), gruvbox, palenight, snazzy (Based on hyper-snazzy by Sindre Sorhus)
  --   'christianchiarulli/nvcode-color-schemes.vim',
  --   dependencies = { 'nvim-treesitter/nvim-treesitter' },
  --   priority = 1000, -- Make sure to load this before all the other start plugins.
  --   config = function()
  --     -- vim.cmd.colorscheme 'onedark'
  --     -- vim.cmd.colorscheme 'nvcode'
  --   end,
  -- },
  {
    'lunarvim/onedarker',
    priority = 1000,
    config = function()
      vim.cmd.colorscheme 'onedarker'
    end,
  },
}
