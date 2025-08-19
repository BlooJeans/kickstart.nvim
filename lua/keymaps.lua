-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })
-- vim.keymap.set('n', '<leader>e', vim.lsp.diagnostic.show_line_diagnostics)
vim.keymap.set('n', '<leader>k', vim.lsp.buf.signature_help)

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
--vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- TIP: Disable arrow keys in normal mode
-- vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
-- vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
-- vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
-- vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- don't lose visual selection when doing indents
vim.keymap.set('n', '<', '<gv', { noremap = true })
vim.keymap.set('n', '>', '>gv', { noremap = true })

-- Split line (sister to [J]oin lines)
-- The normal use of S is covered by cc, so don't worry about shadowing it.
vim.keymap.set('n', 'S', 'i<cr><esc>^mwgk:silent! s/\v +$//<cr>:noh<cr>`w')

-- Source
vim.keymap.set('v', '<leader>S', 'y:@"<CR>')
vim.keymap.set('n', '<leader>S', '^vg_y:execute @@<cr>:echo "Sourced line."<cr>')

-- Black hole delete
vim.keymap.set('n', '<Backspace>', '"_d')
vim.keymap.set('v', '<Backspace>', '"_d')

-- Vimrc
vim.keymap.set('n', '<leader>rc', ':tabe ~/.config/nvim/init.lua<cr>')
vim.keymap.set('n', '<leader>so', ':source $MYVIMRC<cr>')

-- Heresy
vim.keymap.set('i', '<c-a>', '<esc>I')
vim.keymap.set('i', '<c-e>', '<esc>A')
vim.keymap.set('c', '<c-a>', '<home>')
vim.keymap.set('c', '<c-a>', '<end>')

-- currently disabled, because I have both <A-,> + <A-.> and <A-h> + <A-l> to switch between buffers. If I used hljk for resizing then I could use these
-- " Alt key window resizing {{{
-- " " Maps Alt-[h,j,k,l] to resizing a window split
-- map <silent> <A-h> <C-w><
-- map <silent> <A-j> <C-W>-
-- map <silent> <A-k> <C-W>+
-- map <silent> <A-l> <C-w>>
--
-- " Maps Alt-[s.v] to horizontal and vertical split respectively
-- map <silent> <A-s> :split<CR>
-- map <silent> <A-v> :vsplit<CR>
--
-- " Maps Alt-[n,p] for moving next and previous window respectively
-- map <silent> <A-n> <C-w><C-w>
-- map <silent> <A-p> <C-w><S-w>
--
-- " }}}

-- let g:interestingWordsGUIColors = ['#A4E57E', '#FF7272', '#FFB3FF', '#9999FF']
-- vim.keymap.set('n', '<leader>k', ':call InterestingWords("n")<cr>', {silent = true})
-- vim.keymap.set('n', '<leader>K',  ':call UncolorAllWords()<cr>', {silent = true})

-- Barbar {{{
-- Magic buffer-picking mode
vim.keymap.set('n', '<C-s>', ':BufferPick<CR>', { silent = true })

-- Sort automatically by...
vim.keymap.set('n', '<leader>bd', ':BufferOrderByDirectory<CR>', { silent = true })
vim.keymap.set('n', '<leader>bl', ':BufferOrderByLanguage<CR>', { silent = true })

-- Switch to previous/next tab
vim.keymap.set('n', '<A-h>', ':BufferPrev<CR>', { desc = 'Move focus to previous buffer', silent = true })
vim.keymap.set('n', '<A-l>', ':BufferNext<CR>', { desc = 'Move focus to next buffer', silent = true })
vim.keymap.set('n', '<A-,>', ':BufferPrev<CR>', { desc = 'Move focus to previous buffer', silent = true })
vim.keymap.set('n', '<A-.>', ':BufferNext<CR>', { desc = 'Move focus to next buffer', silent = true })

-- Move current tab to left/right
vim.keymap.set('n', '<A-H>', ':BufferMovePrevious<CR>', { desc = 'Move buffer to the left', silent = true })
vim.keymap.set('n', '<A-L>', ':BufferMoveNext<CR>', { desc = 'Move buffer to the right', silent = true })
vim.keymap.set('n', '<A-<>', ':BufferMovePrevious<CR>', { desc = 'Move buffer to the left', silent = true })
vim.keymap.set('n', '<A->>', ':BufferMoveNext<CR>', { desc = 'Move buffer to the right', silent = true })

-- Goto buffer in position...
vim.keymap.set('n', '<A-1>', ':BufferGoto 1<CR>', { silent = true })
vim.keymap.set('n', '<A-2>', ':BufferGoto 2<CR>', { silent = true })
vim.keymap.set('n', '<A-3>', ':BufferGoto 3<CR>', { silent = true })
vim.keymap.set('n', '<A-4>', ':BufferGoto 4<CR>', { silent = true })
vim.keymap.set('n', '<A-5>', ':BufferGoto 5<CR>', { silent = true })
vim.keymap.set('n', '<A-6>', ':BufferGoto 6<CR>', { silent = true })
vim.keymap.set('n', '<A-7>', ':BufferGoto 7<CR>', { silent = true })
vim.keymap.set('n', '<A-8>', ':BufferGoto 8<CR>', { silent = true })
vim.keymap.set('n', '<A-9>', ':BufferLast<CR>', { silent = true })

-- Close buffer
vim.keymap.set('n', '<A-c>', ':BufferClose<CR>', { silent = true })
-- }}}

-- Don't move on #, but future 'n' movements behave in the same direction as *
-- I'd use a function for this but Vim clobbers the last search when you're in
-- a function so fuck it, practicality beats purity.
vim.keymap.set('n', '#', ':let stay_star_view = winsaveview()<cr>*:call winrestview(stay_star_view)<cr>', { desc = 'Dont move on # but load the star search' })

vim.keymap.set('n', 'gv', '<Cmd>vs<CR><Cmd>lua vim.lsp.buf.definition()<CR>', { desc = 'Open symbol in a new vertical tab' })

-- NOTE: Some terminals have colliding keymaps or are not able to send distinct keycodes
-- vim.keymap.set("n", "<C-S-h>", "<C-w>H", { desc = "Move window to the left" })
-- vim.keymap.set("n", "<C-S-l>", "<C-w>L", { desc = "Move window to the right" })
-- vim.keymap.set("n", "<C-S-j>", "<C-w>J", { desc = "Move window to the lower" })
-- vim.keymap.set("n", "<C-S-k>", "<C-w>K", { desc = "Move window to the upper" })

-- Floating terminal.
vim.keymap.set('n', '<M-t>', function()
  require('utils.float_term').float_term(nil, {})
end, { desc = 'Open terminal' })
vim.keymap.set('t', '<M-t>', '<cmd>close<cr>', { desc = 'Close terminal' })
