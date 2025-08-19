return {
  -- Highlight todo, notes, etc in comments
  {
    'folke/todo-comments.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    cmd = { 'TodoTrouble', 'TodoTelescope' },
    event = { 'BufReadPost', 'BufNewFile' },
    opts = {
      signs = false,
      search = {
        pattern = [[\b(KEYWORDS)(:|!?\(.*\))]],
      },
      highlight = {
        pattern = {
          [[.*(KEYWORDS):]],
          [[.*(KEYWORDS)!?\(.*\)]],
        },
        after = '',
        -- For also highlighting Rust todo macros.
        comments_only = false,
      },
      keywords = {
        FIX = { icon = ' ', color = 'error', alt = { 'FIXME', 'BUG', 'ISSUE' } },
        TODO = { icon = ' ', color = 'info', alt = { 'todo' } },
        WARN = { icon = ' ', color = 'warning', alt = { 'WARNING', 'XXX' } },
        NOTE = { icon = ' ', color = 'hint', alt = { 'INFO' } },
      },
      -- Just use the keywords defined above
      merge_keywords = false,
    },
  },
}

-- Examples:
-- aoeu aoeu TODO: aoeusnthoaeu
-- TODO: standard usage with colon
-- TODO(withparens): with parens and colon
-- TODO!(with parens) bang parens
-- TODO!(with parens): bang parens colon
-- TODO!: no parens
-- TODO! no parens
-- todo: aoesnuthaoeu
--
-- TODO? aoesnuthaoeu
-- FIXME: aoeusnth
-- FIXME! needs parens
-- FIXME!(has parens) aoeusnth
-- FIXME? aoeusnth
-- FIX: aoeusnth
-- BUG: aoeusnth
-- WARN: aoeusnth
-- WARNING: aoeusnth
-- XXX aoeusnth
-- XXX: aoeusnth
-- XXX!(has parens) aoeusnth
-- NOTE: aoeu
-- INFO: aoeu
