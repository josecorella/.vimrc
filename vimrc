"packadd! dracula
"syntax enable
"colorscheme dracula

" General
scriptencoding utf-8
set bs=indent,eol,start " Allow backspacing over everything in insert mode
set completeopt=menu,menuone

" Highlight the current line you're on:
set cursorline

" Put all swap files here so they don't clutter your file system:
set directory=${HOME}/.vim/swap/

set hlsearch

" Search case-insensitively
set ignorecase

" Not normally a fan of mouse support, but can't deny the ease of use:
set mouse=a

set nocompatible

" Disables incremental search. You may want this, but I think it's jumpy:
set noincsearch
set hidden

set ruler
set smartcase
set wildmenu
set wildmode=longest,list,full
set wildignore+=*.so,*.class
let g:matchparen_insert_timeout=5
filetype plugin indent on

" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Better display for messages
set cmdheight=2

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes


" To make this work, install vim-plug: https://github.com/junegunn/vim-plug
" Then after that just do a :PlugInstall to install these:
call plug#begin('~/.vim/plugged')
    "Plug 'ctrlpvim/ctrlp.vim' " Fuzzy file menu by pressing Ctrl+P
    Plug 'nanotech/jellybeans.vim'
    Plug 'vim-airline/vim-airline'
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()
" (you don't need to use these, though)

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)


" Tab-related
set expandtab
set tabstop=4
set shiftwidth=4
set smarttab

set number

" Try to stick with an 80-char max line length
set textwidth=88
set colorcolumn=89


" Show tabs and trailing spaces with special characters
if $LANG =~ '\(UTF\|utf\)-\?8' || $LC_CTYPE =~ '\(UTF\|utf\)-\?8'
    set list listchars=tab:»\ ,trail:·
endif


" Folding (collapsing functions, methods, whatever).
" 'zc' = close fold, 'zo' = open fold.
set foldmethod=syntax
" This disables auto-folding:
set foldlevelstart=99


" Syntax Highlighting
set background=dark
if &t_Co >= 17 || has("gui_running")
    colorscheme jellybeans
endif
syntax on


" Open new tabs instead of buffers with CtrlP
let g:ctrlp_prompt_mappings = {
    \ 'AcceptSelection("e")': ['<c-t>'],
    \ 'AcceptSelection("t")': ['<cr>', '<2-LeftMouse>'],
    \ }


" CtrlP: Speed things up by listing the files with git
let g:ctrlp_user_command = ['.git/', 'cd %s && git ls-files --exclude-standard -co']

inoremap <C-E> <End>
inoremap <C-A> <Home>

autocmd FileType make setlocal noexpandtab
