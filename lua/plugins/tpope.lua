return {
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
}
