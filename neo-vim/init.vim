set number
set mouse=a
set clipboard+=unnamedplus

call plug#begin('~/AppData/Local/nvim/plugged')

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'preservim/nerdtree'

call plug#end()

let mapleader = " "
nnoremap <leader>pv :Vex<CR>
nnoremap <leader>pf :Files<CR>
inoremap jk <esc>:w<CR>
nnoremap <C-p> :GFiles<CR>
