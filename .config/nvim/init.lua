-- Globals
require('helpers/globals')

-- Settings
require('sets')
require('remaps')
require('plugins')

require('nvim-treesitter.configs').setup{
  ensure_installed = { 'c', 'lua', 'vim', 'vimdoc', 'query', 'python', 'elixir' },
  sync_install = false,
  highlight = {
    enable = true
  },
  indent = {
    enable = true
  }
}

require('telescope').setup{
  defaults = {
    mappings = {
      i = {
        ["<C-h>"] = "which_key"
      }
    }
  },
  extensions = {
    fzf = {
      fuzzy = true,
      override_generic_sorter = true,
      override_file_sorter = true,
      case_mode = "smart_case"
    }
  }
}

require('nvim-tree').setup{
  filters = {
    dotfiles = true
  }
}

require('telescope').load_extension('fzf')

g.nord_contrast = false
g.nord_borders = false
g.nord_disable_background = false
g.nord_italic = false
g.nord_uniform_diff_background = false
g.nord_bold = false

require('nord').set()

cmd([[colorscheme nord]])

require('lualine').setup{
  options = {
    theme = 'nord',
    component_separators = { left = '', right = '' },
    section_separators = { left = '', right = '' },
  }
}

-- local highlights = require('nord').bufferline.highlights{
--   italic = true,
--   bold = true,
-- }

-- require('bufferline').setup{
--   highlights = highlights
-- }

require('nvim-autopairs').setup{}

require('nvim_comment').setup{
  comment_empty = false,

}

g.vimtex_view_method = 'skim'

