set nocompatible
filetype plugin on
syntax on

call plug#begin('~/.vim/plugged')
    Plug 'neoclide/coc.nvim', {'branch': 'release'}

    Plug 'vim-airline/vim-airline'
    Plug 'mhinz/vim-signify'
   
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'

	Plug 'preservim/nerdtree'

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

nmap <Leader>zf viBhzf

" Highlights      
hi SignColumn ctermbg=None
hi DiffAdd ctermbg=None ctermfg=2
hi DiffChange ctermbg=None ctermfg=4
hi DiffDelete ctermbg=None ctermfg=1

hi VimwikiHeader1 ctermfg=3 cterm=bold gui=bold
hi VimwikiHeader2 ctermfg=5 cterm=bold gui=bold
hi VimwikiHeader3 ctermfg=6 cterm=bold gui=bold

hi NERDTreeFlags ctermfg=7

" hi Pmenu ctermbg=236 ctermfg=8

" Use tab to auto complete instead of <C-y>
inoremap <silent><expr> <TAB> coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<TAB>"

nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction
