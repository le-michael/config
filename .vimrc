set nocompatible
filetype plugin on
syntax on

call plug#begin('~/.vim/plugged')
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'honza/vim-snippets'

    Plug 'vim-airline/vim-airline'
    Plug 'mhinz/vim-signify'
   
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'

	Plug 'preservim/nerdtree'

	Plug 'vimwiki/vimwiki'

	Plug 'rust-lang/rust.vim'

	Plug 'ryanoasis/vim-devicons'
call plug#end()

" Options
set mouse=a
set encoding=UTF-8

set wildmenu
set wildmode=longest:list,full

set tabstop=4
set shiftwidth=4

set signcolumn=yes
set number relativenumber

let g:NERDTreeWinPos = "right"

autocmd FileType vimwiki set tabstop=2
autocmd FileType vimwiki set shiftwidth=2

let wiki = {}
let wiki.path = '~/notes'
let wiki.nested_syntaxes = {'python': 'python'}
let g:vimwiki_list = [wiki]

" Maps 
nmap <leader>no :tabe ~/notes/index.wiki<CR>

nmap <leader>rn <Plug>(coc-rename)
nmap <leader>f  <Plug>(coc-format) :w<CR>
vmap <leader>f  <Plug>(coc-format-selected) 

map <C-e> :NERDTreeToggle <Esc>

map <Leader>pp :Files <Esc>
map <Leader>p :GFiles <Esc>
map <Leader>rs :source ~/.vimrc<Esc>

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gf <Plug>(coc-references)

" Hilights      
hi SignColumn ctermbg=0
hi DiffAdd ctermbg=0 ctermfg=2
hi DiffChange ctermbg=0 ctermfg=4
hi DiffDelete ctermbg=0 ctermfg=1

hi VimwikiHeader1 ctermfg=3 cterm=bold gui=bold
hi VimwikiHeader2 ctermfg=5 cterm=bold gui=bold
hi VimwikiHeader3 ctermfg=6 cterm=bold gui=bold

hi NERDTreeFlags ctermfg=7

hi Pmenu ctermbg=236 ctermfg=8
