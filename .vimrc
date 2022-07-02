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
map <C-e> :NERDTreeToggle <Esc>
hi NERDTreeFlags ctermfg=7

" CoC Hotkeys
nmap <leader>rn <Plug>(coc-rename)
nmap <leader>f  <Plug>(coc-format) :w<CR>
vmap <leader>f  <Plug>(coc-format-selecteaz) 

" Inu files
autocmd BufNewFile,BufRead *.inu set syntax=yaml
autocmd BufNewFile,BufRead *.inu set filetype=yaml

" Vimwiki
hi VimwikiHeader1 ctermfg=3 cterm=bold gui=bold
hi VimwikiHeader2 ctermfg=5 cterm=bold gui=bold
hi VimwikiHeader3 ctermfg=6 cterm=bold gui=bold

autocmd FileType vimwiki set tabstop=2
autocmd FileType vimwiki set shiftwidth=2

let wiki = {}
let wiki.path = '~/notes'
let wiki.nested_syntaxes = {'python': 'python'}
let g:vimwiki_list = [wiki]

function! VimwikiLinkHandler(link)
	" Use Vim to open external files with the 'vfile:' scheme.  E.g.:
	"   1) [[vfile:~/Code/PythonProject/abc123.py]]
	"   2) [[vfile:./|Wiki Home]]
	let link = a:link
	if link =~# '^vfile:'
		let link = link[1:]
	else
		return 0
	endif
	let link_infos = vimwiki#base#resolve_link(link)
	if link_infos.filename == ''
		echomsg 'Vimwiki Error: Unable to resolve link!'
		return 0
	else
		exe 'e ' . fnameescape(link_infos.filename)
		return 1
	endif
endfunction

" Enable mouse
set mouse=a

set encoding=UTF-8

command! -nargs=0 Prettier :CocCommand prettier.forceFormatDocument
