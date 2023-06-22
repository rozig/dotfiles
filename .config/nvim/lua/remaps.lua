require('helpers/globals')

local builtin = require('telescope.builtin')

keymap.set('n', '<leader>ff', builtin.find_files, {})
keymap.set('n', '<leader>fg', builtin.live_grep, {})
keymap.set('n', '<leader>fb', builtin.buffers, {})
keymap.set('n', '<leader>fh', builtin.help_tags, {})

keymap.set('n', 'H', ':bprev<CR>')
keymap.set('n', 'L', ':bnext<CR>')
