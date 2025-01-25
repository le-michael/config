vim.cmd [[
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

		Plug 'EdenEast/nightfox.nvim'

		Plug 'le-michael/flatbuffer.vim'
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

	autocmd VimEnter * AirlineTheme monochrome

	set fillchars+=vert:\│

	let NERDTreeMinimalUI=1

	set showtabline=1

	au InsertEnter * set cursorline
	au InsertLeave * set nocursorline

	set autoread

	if exists(":DiffOrig") != 2
	  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_
			\ | diffthis | wincmd p | diffthis
	endif

	" Maps
	nmap <leader>x :x<CR>
	nmap <leader>q :qa<CR>
	nmap <leader>s :wa<CR>
	nmap <leader>rn <Plug>(coc-rename)

	nmap <leader>f  <Plug>(coc-format) :w<CR>
	vmap <leader>f  <Plug>(coc-format-selected)
	xmap <leader>a  <Plug>(coc-codeaction-selected)
	nmap <leader>a  <Plug>(coc-codeaction-selected)
	command! -nargs=0 Prettier :CocCommand prettier.forceFormatDocument
	nmap <leader>wa  :wa<CR>
	nmap <leader>q  :q<CR>
	nmap <leader>qa  :qa<CR>

	map <C-e> :NERDTree %<Esc>

	nmap <silent> gd <Plug>(coc-definition)
	nmap <silent> gf <Plug>(coc-references)

	colorscheme terafox

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
]]
