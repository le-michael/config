-- Ensure lazy.nvim is installed
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Set up lazy.nvim
require("lazy").setup({
  { 'neoclide/coc.nvim', branch = 'release' },
  'vim-airline/vim-airline',
  'vim-airline/vim-airline-themes',
  'mhinz/vim-signify',
  { 'junegunn/fzf', build = function() vim.fn['fzf#install']() end },
  'junegunn/fzf.vim',
  'preservim/nerdtree',
  'nvim-lua/plenary.nvim',
  {
    'EdenEast/nightfox.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd.colorscheme 'carbonfox'
    end
  },
  'le-michael/flatbuffer.vim',
  'ron-rs/ron.vim',
  'folke/tokyonight.nvim',
  { 'nvim-treesitter/nvim-treesitter', build = ':TSUpdate' },
})

-- Options
vim.opt.mouse = 'a'
vim.opt.encoding = 'UTF-8'
vim.opt.wildmenu = true
vim.opt.wildoptions = 'pum'
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.signcolumn = 'yes'
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.showtabline = 1
vim.opt.autoread = true
vim.opt.fillchars:append({ vert = '│' })
vim.opt.laststatus = 3

-- Global Variables for plugins
vim.g.NERDTreeWinPos = "right"
vim.g.NERDTreeMinimalUI = 1

-- Autocmds
vim.api.nvim_create_autocmd('VimEnter', { pattern = '*', command = 'AirlineTheme monochrome' })
vim.api.nvim_create_autocmd('InsertEnter', { pattern = '*', command = 'set cursorline' })
vim.api.nvim_create_autocmd('InsertLeave', { pattern = '*', command = 'set nocursorline' })

-- Custom Commands
vim.cmd([[
  if exists(":DiffOrig") != 2
    command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis | wincmd p | diffthis
  endif
  command! -nargs=0 Prettier :CocCommand prettier.forceFormatDocument
]])

-- Key Mappings
vim.keymap.set('n', '<leader>q', ':q<CR>')
vim.keymap.set('n', '<leader>qa', ':qa<CR>')
vim.keymap.set('n', '<leader>wa', ':wa<CR>') -- As per original file
vim.keymap.set('n', '<leader>rn', '<Plug>(coc-rename)')
vim.keymap.set('n', '<leader>f', '<Plug>(coc-format) :w<CR>')
vim.keymap.set('v', '<leader>f', '<Plug>(coc-format-selected)')
vim.keymap.set({ 'x', 'n' }, '<leader>a', '<Plug>(coc-codeaction-selected)')

vim.keymap.set({ 'n', 'v' }, '<C-e>', ':NERDTreeToggle<CR>', { noremap = true, silent = true })

-- CoC Mappings
vim.keymap.set('n', 'gd', '<Plug>(coc-definition)', { silent = true })
vim.keymap.set('n', 'gf', '<Plug>(coc-references)', { silent = true })
vim.keymap.set('i', '<TAB>', [[coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<TAB>"]], { expr = true, silent = true, noremap = true })
vim.keymap.set('n', 'K', ':call ShowDocumentation()<CR>', { silent = true, noremap = true })

-- Vimscript functions for CoC and UI
vim.cmd([[
  function! ShowDocumentation()
    if CocAction('hasProvider', 'hover')
      call CocActionAsync('doHover')
    else
      call feedkeys('K', 'in')
    endif
  endfunction

  function! ToggleColGuide()
    if &colorcolumn == ""
      set colorcolumn=80
    else
      set colorcolumn=""
    endif
  endfunction
]])
vim.keymap.set('n', 'sg', ':call ToggleColGuide()<CR>', { silent = true })


-- Markdown specific settings
local markdown_group = vim.api.nvim_create_augroup("MarkdownWrap", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
  group = markdown_group,
  pattern = "markdown",
  callback = function()
    vim.opt_local.textwidth = 80
    vim.opt_local.formatoptions = "tcqnj"
    vim.opt_local.colorcolumn = "80"
  end,
})
