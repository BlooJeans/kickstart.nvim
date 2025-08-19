return {
  'NMAC427/guess-indent.nvim', -- Detect tabstop and shiftwidth automatically

  -- NOTE: Plugins can also be configured to run Lua code when they are loaded.
  --
  -- This is often very useful to both group configuration, as well as handle
  -- lazy loading plugins that don't need to be loaded immediately at startup.
  --
  -- For example, in the following configuration, we use:
  --  event = 'VimEnter'
  --
  -- which loads which-key before all the UI elements are loaded. Events can be
  -- normal autocommands events (`:help autocmd-events`).
  --
  -- Then, because we use the `opts` key (recommended), the configuration runs
  -- after the plugin has been loaded as `require(MODULE).setup(opts)`.

  -- LSP Plugins
  {
    -- `lazydev` configures Lua LSP for your Neovim config, runtime and plugins
    -- used for completion, annotations and signatures of Neovim apis
    'folke/lazydev.nvim',
    ft = 'lua',
    opts = {
      library = {
        -- Load luvit types when the `vim.uv` word is found
        { path = '${3rd}/luv/library', words = { 'vim%.uv' } },
      },
    },
  },

  { -- Collection of various small independent plugins/modules
    'echasnovski/mini.nvim',
    config = function()
      -- Better Around/Inside textobjects
      --
      -- Examples:
      --  - va)  - [V]isually select [A]round [)]paren
      --  - yinq - [Y]ank [I]nside [N]ext [Q]uote
      --  - ci'  - [C]hange [I]nside [']quote
      require('mini.ai').setup { n_lines = 500 }

      require('mini.trailspace').setup()

      -- Add/delete/replace surroundings (brackets, quotes, etc.)
      --
      -- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
      -- - sd'   - [S]urround [D]elete [']quotes
      -- - sr)'  - [S]urround [R]eplace [)] [']
      -- require('mini.surround').setup()

      -- ... and there is more!
      --  Check out: https://github.com/echasnovski/mini.nvim
    end,
  },

  {
    'nvim-web-devicons',
    opts = {
      -- globally enable default icons (default to false)
      -- will get overriden by `get_icons` option
      default = true,
    },
  },

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

  { 'vim-airline/vim-airline' },
  { 'vim-airline/vim-airline-themes' },

  -- The following comments only work if you have downloaded the kickstart repo, not just copy pasted the
  -- init.lua. If you want these files, they are in the repository, so you can just download them and
  -- place them in the correct locations.

  -- require 'kickstart.plugins.debug',
  -- require 'kickstart.plugins.autopairs',
  --
  -- For additional information with loading, sourcing and examples see `:help lazy.nvim-🔌-plugin-spec`
  -- Or use telescope!
  -- In normal mode type `<space>sh` then write `lazy.nvim-plugin`
  -- you can continue same window with `<space>sr` which resumes last telescope search
}
