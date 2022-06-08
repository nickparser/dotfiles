" set internal encoding of vim
set encoding=utf-8
scriptencoding utf-8

" lines number
set number

" incremental search 
set incsearch

" no backup
set nobackup
set nowritebackup

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=30

" default split
set splitright

" pluggins section
call plug#begin()

" coc.vim
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" rust.vim 
Plug 'rust-lang/rust.vim'

" dirvish.vim
Plug 'justinmk/vim-dirvish'
Plug 'roginfarrer/vim-dirvish-dovish', {'branch': 'main'}

" fzf.vim
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

call plug#end()

" Important!!
if has('termguicolors')
  set termguicolors
endif

" For dark version.
set background=dark

" Set contrast.
" This configuration option should be placed before `colorscheme everforest`.
" Available values: 'hard', 'medium'(default), 'soft'
let g:everforest_background = 'hard'

" For better performance
let g:everforest_better_performance = 1
colorscheme everforest

" displaying tabs as characters
set list
set listchars=space:·

" enable syntax
syntax enable
filetype plugin indent on

" show existing tab with 4 spaces width
set tabstop=4

" when indenting with '>', use 4 spaces width
set shiftwidth=4

" On pressing tab, insert 4 spaces
set expandtab

" enable formating rust code
let g:rustfmt_autosave=1

" give more space for displaying messages
set cmdheight=2

" show the signcolumn
set signcolumn=yes

" coc configurations
" Use tab for trigger completion with characters ahead and navigate.
inoremap <silent><expr> <TAB>
  \ pumvisible() ? "\<C-n>" :
  \ CheckBackspace() ? "\<TAB>" :
  \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" applying codeAction to the selected region
nmap <Space>a <Plug>(coc-codeaction-selected)
" open diagnostics window
nmap <silent><Space><Space>f :<C-u>CocList diagnostics<cr>

" vim mapping
:imap jj <Esc>
nnoremap <Space>h <C-w>h
nnoremap <Space>l <C-w>l
nnoremap <Space>k <C-w>k
nnoremap <Space>j <C-w>j

" dirvish configurations 
let g:dirvish_mode=':sort ,^.*[\/],'
nnoremap <Space>d :Dirvish<CR>

" netrw configurations
let g:netrw_liststyle=3
let g:netrw_banner=0
let g:netrw_browse_split=4
let g:netrw_winsize=30
let g:netrw_keepdir=0

" keymap in netrw
nnoremap <Space>e :Lexplore<CR>
function! s:netrw_key_mapping()
  nmap <buffer>o <CR>
  nmap <buffer>u -<CR>
endfunction

" calls it everytime vim opens a netrw
augroup netrw_mapping
  autocmd!
  autocmd filetype netrw call s:netrw_key_mapping()
augroup END

" fzf configurations
nnoremap <silent><C-p> :GFiles --cached --others --exclude-standard<CR>
nnoremap <silent><C-f> :Ag<CR>
