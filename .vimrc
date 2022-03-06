filetype plugin indent on

call plug#begin('~/.vim/plugged')
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'honza/vim-snippets'

    Plug 'vim-airline/vim-airline'
    Plug 'mhinz/vim-signify'
   
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'

	Plug 'preservim/nerdtree'

	Plug 'vimwiki/vimwiki'
call plug#end()

set wildmenu
set wildmode=longest:list,full

set tabstop=4
set shiftwidth=4

"fzf Hotkeys
map <Leader>pp :Files <Esc>
map <Leader>p :GFiles <Esc>
map <Leader>rs :source ~/.vimrc<Esc>

" Autocomplete Menu
hi Pmenu ctermbg=0 ctermfg=8

" Signify (git gutter) colors
hi SignColumn ctermbg=0
hi DiffAdd ctermbg=0 ctermfg=2
hi DiffChange ctermbg=0 ctermfg=4
hi DiffDelete ctermbg=0 ctermfg=1

" Gutter config
set signcolumn=yes
set number

" Go Hotkeys
autocmd FileType go map <Leader>br :!go run % <Esc>
autocmd FileType go map <Leader>f :!go fmt % <Esc>

" NERDtree 
let g:NERDTreeWinPos = "right"
map <C-e> :NERDTreeFocus <Esc>

" CoC Hotkeys
nmap <leader>rn <Plug>(coc-rename)

" Inu files
autocmd BufNewFile,BufRead *.inu set syntax=yaml
autocmd BufNewFile,BufRead *.inu set filetype=yaml

" Vimwiki
hi VimwikiHeader1 ctermfg=3 cterm=bold gui=bold
hi VimwikiHeader2 ctermfg=5 cterm=bold gui=bold
hi VimwikiHeader3 ctermfg=6 cterm=bold gui=bold
