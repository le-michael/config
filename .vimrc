set nocompatible
filetype plugin on
syntax on

call plug#begin('~/.vim/plugged')
	Plug 'neoclide/coc.nvim', {'branch': 'release'}

	Plug 'vim-airline/vim-airline'
	Plug 'vim-airline/vim-airline-themes'

	Plug 'mhinz/vim-signify'

	Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
	Plug 'junegunn/fzf.vim'

	Plug 'preservim/nerdtree'

	Plug 'nvim-lua/plenary.nvim'

	Plug 'le-michael/flatbuffer.vim'

	Plug 'jbyuki/venn.nvim'
	Plug 'vimwiki/vimwiki'
call plug#end()

" Options
set mouse=a
set encoding=UTF-8

set wildmenu wildoptions=pum

set tabstop=4
set shiftwidth=4

set signcolumn=yes
set number relativenumber

let g:NERDTreeWinPos = "right"

autocmd VimEnter * AirlineTheme serene

set fillchars+=vert:\│

let NERDTreeMinimalUI=1

set showtabline=2

au InsertEnter * set cursorline
au InsertLeave * set nocursorline

autocmd FileType vimwiki set virtualedit=all

set autoread

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
vmap <silent>vb :VBox<CR>

" Highlights
hi SignColumn ctermbg=none
hi DiffAdd ctermbg=none ctermfg=2
hi DiffChange ctermbg=none ctermfg=4
hi DiffDelete ctermbg=none ctermfg=1

hi VimwikiHeader1 ctermfg=3 cterm=bold gui=bold
hi VimwikiHeader2 ctermfg=5 cterm=bold gui=bold
hi VimwikiHeader3 ctermfg=6 cterm=bold gui=bold

hi NERDTreeFlags ctermfg=7
hi Search ctermbg=14

hi Pmenu ctermbg=233 ctermfg=8
hi PmenuSel ctermbg=236 ctermfg=6

hi VertSplit ctermfg=234

hi TablineSel cterm=underline ctermfg=6 ctermbg=none
hi TablineFill cterm=underline ctermfg=234 ctermbg=none
hi Tabline cterm=underline ctermfg=240 ctermbg=none

hi EndOfBuffer ctermfg=236

hi StatusLine cterm=bold ctermbg=234
hi ColorColumn ctermbg=232

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

nmap <silent> sg :call ToggleColGuide()<CR>
function! ToggleColGuide()
	if &colorcolumn == ""
        set colorcolumn=80
	else
        set colorcolumn=""
	endif
endfunction
