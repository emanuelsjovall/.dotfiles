-- Set highlight on search, but clear on pressing <Esc> in normal mode
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '[d', function() vim.diagnostic.jump({ count = 1, float = true }) end, { desc = 'Go to previous [D]iagnostic message' })
vim.keymap.set('n', ']d', function() vim.diagnostic.jump({ count = -1, float = true }) end, { desc = 'Go to next [D]iagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

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

-- Resize splits
vim.keymap.set('n', '<M-<>', '<c-w>5<', { desc = 'Increase size of vertical split'})
vim.keymap.set('n', '<M->>', '<c-w>5>', { desc = 'Decrease size of vertical split'})
vim.keymap.set('n', '<M-u>', '<c-W>+', { desc = 'Increase height of horizontal split'})
vim.keymap.set('n', '<M-d>', '<c-W>-', { desc = 'Decrease height of horizontal split'})

-- Jumping half page and center cursor after
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')

-- Searching and center
vim.keymap.set('n', 'n', 'nzz')
vim.keymap.set('n', 'N', 'Nzz')

vim.keymap.set("i", "<C-s>", "<ESC>:w<CR>", { desc = "[C]trl [s]ave"})
vim.keymap.set('n', '<C-s>', ':w<CR>', { desc = '[C]trl [s]ave' })
vim.keymap.set('i', '<C-q>', '<ESC>', { desc = '[E]sc' })
vim.keymap.set('n', '<C-q>', ':q<CR>', { desc = '[C]trl [q]uit' })

vim.keymap.set('v', '<S-Tab>', '<gv', { desc = '[I]ndent selected text to the left' })
vim.keymap.set('v', '<Tab>', '>gv', { desc = '[I]ndent selected text to the right' })
vim.keymap.set('v', '<BS>', 'd', { desc = '[B]ackspace selected text' })

vim.keymap.set('v', '<leader>y', '"+y', { desc = '[C]opy selected text to system clipboard' })
vim.keymap.set('i', '<C-x>', '<ESC>ddA', { desc = '[C]ut selected text to system clipboard' })
--vim.keymap.set('i', '<C-v>p', '<ESC>"+pa', { desc = '[P]aste text from system clipboard' })
vim.keymap.set('n', '<leader>p', '"+p', { desc = '[P]aste text from system clipboard' })
vim.keymap.set('v', '<leader>p', '"+p', { desc = '[P]aste text from system clipboard'})
vim.keymap.set('i', '<C-z>', '<ESC>ua', { desc = '[U]ndo' })
vim.keymap.set('n', '<C-z>', 'u', { desc = '[U]ndo' })

vim.keymap.set('n', '<leader>o', ':Ex<CR>', { desc = '[O]pen file browser'})

-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})
