" Cecil Montemayors Vim RC 
" Setup normal human tabs to remember how these work :help 'name' all pulled
" from :options
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
"set sidebar numbers, and current number
set relativenumber
set nu
"remove highlight after search complete
set nohlsearch
"leave all buffers open in background by default
set hidden
"this one is obvious lol
set noerrorbells
"keeping history stuff
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
"special search sauce, just does simple search
set incsearch

"THE MEAT AND POTATOES (color schemes)
set termguicolors


"how far away to begin view scrowling
set scrolloff=8

"helpful insert mode helper
set noshowmode
"set completeopt=menuone,noinser,noselect
set signcolumn=yes "adds extra column off to the left


"Begin the thick sauce Plugin section! (fyi, use :PlugInstall)
call plug#begin('~/.vim/plugged')
"Telescope, for fuzzy finding and more!
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
"Theme! (set with :colorscheme gruvbox and background transparent with
":highlight Normal guibg=none)
Plug 'gruvbox-community/gruvbox'

"Setup LSP
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
"autocompletion
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'

call plug#end()

"Set default color scheme and background transparent
colorscheme gruvbox
highlight Normal guibg=none

"Set leader key
let mapleader = " "
"Remaps
nnoremap <leader>ps :lua require('telescope.builtin').grep_string({ search = vim.fn.input("Grep For >")}) <CR>
" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
"Exit insert
inoremap jj <ESC>
"Auto Format Document with LSP
nnoremap <leader>fd <cmd>LspDocumentFormat<cr>

"Setup Itegrated terminal
" open new split panes to right and below
set splitright
set splitbelow
" turn terminal to normal mode with escape
tnoremap <Esc> <C-\><C-n>
" start terminal in insert mode
au BufEnter * if &buftype == 'terminal' | :startinsert | endif
" open terminal on ctrl+n
function! OpenTerminal()
  split term://bash
  resize 10
endfunction
nnoremap <leader>nn :call OpenTerminal()<CR>t

"configure telescope to ignore node_modules from search
lua << EOF
require('telescope').setup{
defaults = { file_ignore_patterns = {"node_modules"} }
}
EOF
