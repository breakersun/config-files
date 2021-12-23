set number
set mouse=a
set clipboard+=unnamedplus
set encoding=UTF-8

call plug#begin('~/AppData/Local/nvim/plugged')

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'preservim/nerdtree'

Plug 'tpope/vim-fugitive'

"Plug 'itchyny/lightline.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'luochen1990/rainbow'

Plug 'prettier/vim-prettier', { 'do': 'yarn install --frozen-lockfile --production' }

Plug 'preservim/nerdcommenter'

Plug 'ryanoasis/vim-devicons'
Plug 'ggandor/lightspeed.nvim'

call plug#end()

let mapleader = " "
nnoremap <leader>pv :Vex<CR>
nnoremap <leader>pf :Files<CR>
inoremap jk <esc>:w<CR>
nnoremap <C-p> :GFiles<CR>

"enable luochen1990/rainbow
let g:rainbow_active = 1
let g:airline_powerline_fonts = 1
