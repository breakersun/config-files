set number
set mouse=a

call plug#begin('~/AppData/Local/nvim/plugged')

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'preservim/nerdtree'

call plug#end()
