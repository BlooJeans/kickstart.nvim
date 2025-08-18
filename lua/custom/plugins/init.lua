-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  {
    'nvim-web-devicons',
    opts = {
      -- globally enable default icons (default to false)
      -- will get overriden by `get_icons` option
      default = true,
    },
  },
  { 'lewis6991/gitsigns.nvim' },
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

  -- { 'JoosepAlviste/nvim-ts-context-commentstring', desc = 'Context aware commenting (e.g. JSX commenting vs javascript)' },

  {
    'ray-x/lsp_signature.nvim',
    event = 'BufRead',
    desc = 'Show function signatures as you type',
    config = function()
      require('lsp_signature').setup()
    end,
  },

  {
    'tpope/vim-abolish',
    desc = 'Adds stuff like crs/crc/cr-/cr. to change snake_case (s) to camelCase (c) kebab-case (-), also adds Subvert. example :Subvert/child{,ren}/adult{,s}/g',
  },

  { 'tpope/vim-repeat' },
  { 'tpope/vim-surround', dependencies = { 'vim-repeat' } },
  {
    'tpope/vim-unimpaired',
    desc = [[
adds a bunch of helpers, notably:
[n and ]n to jump between SCM conflicts
[q and ]q for :cprev and :cnext
[<Space> and ]<Space> to add newlines before/after the cursor
[e and ]e to exchange the current line with above/below
[os ]os yos to do :set spell, :set nospell, toggle spell
[ol ]ol yol to do :set list, :set nolist, toggle list
[on ]on yon to do :set number, :set nonumber, toggle number
[ow ]ow yow to do :set wrap, :set nowrap, toggle wrap
[u and ]u to encode/decode URLs
[x and ]x to encode/decode XML
[y and ]y to do C string style escaping]],
  },

  {
    'catgoose/nvim-colorizer.lua',
    event = 'BufReadPre',
    opts = {
      user_default_options = {
        names = true,
        names_opts = {
          lowercase = true,
          camelcase = false,
          uppercase = false,
        },
        rgb_fn = true,
        hsl_fn = true,
        css = true,
        css_fn = true,
        tailwind = true,
        tailwind_opts = {
          update_names = true, -- When using tailwind = 'both', update tailwind names from LSP results.  See tailwind section
        },
        virtualtext_inline = true,
      },
    },
  },
  {
    'themaxmarchuk/tailwindcss-colors.nvim',
    config = function()
      local nvim_lsp = require 'lspconfig'

      local on_attach = function(client, bufnr)
        -- other stuff --
        require('tailwindcss-colors').buf_attach(bufnr)
      end

      nvim_lsp['tailwindcss'].setup {
        -- other settings --
        on_attach = on_attach,
      }
    end,
  },

  -- {
  --   'onsails/lspkind.nvim',
  --   opts = function(_, opts)
  --     -- use codicons preset
  --     opts.preset = 'codicons'
  --     -- set some missing symbol types
  --     opts.symbol_map = {
  --       Array = '',
  --       Boolean = '',
  --       Key = '',
  --       Namespace = '',
  --       Null = '',
  --       Number = '',
  --       Object = '',
  --       Package = '',
  --       String = '',
  --     }
  --   end,
  -- },

  { 'vuki656/package-info.nvim', opts = {}, event = 'BufRead package.json' },
}
