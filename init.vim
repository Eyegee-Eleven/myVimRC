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
set completeopt=menuone,noinsert,noselect
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

"TODO Setup LSP
"
"Setup for intellisense
Plug 'neoclide/coc.nvim', {'branch': 'release'}
let g:coc_global_extensions = ['coc-emmet', 'coc-css', 'coc-html', 'coc-json', 'coc-prettier', 'coc-tsserver']
call plug#end()

"Set default color scheme and background transparent
colorscheme gruvbox
highlight Normal guibg=none

"Set leader key
let mapleader = " "
"Remaps
nnoremap <leader>ps :lua require('telescope.builtin').grep_string({ search = vim.fn.input("Grep For >")}) <CR>
"Exit insert
inoremap jj <ESC>

"Moving between panes remap
" use alt+hjkl to move between split/vsplit panels
tnoremap <A-h> <C-\><C-n><C-w>h
tnoremap <A-j> <C-\><C-n><C-w>j
tnoremap <A-k> <C-\><C-n><C-w>k
tnoremap <A-l> <C-\><C-n><C-w>l
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l



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
nnoremap <leader>nn :call OpenTerminal()<CR>
