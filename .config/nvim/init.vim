call plug#begin('~/.vim/plugged')

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'
Plug 'bronson/vim-trailing-whitespace'
"Plug 'ctrlpvim/ctrlp.vim'
Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'tomasr/molokai'
Plug 'w0ng/vim-hybrid'
Plug 'nanotech/jellybeans.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'peitalin/vim-jsx-typescript'
Plug 'leafgarland/typescript-vim'
Plug 'Yggdroot/indentLine'
"Plug 'nathanaelkane/vim-indent-guides'

if has('nvim-0.5')
  Plug 'folke/which-key.nvim', { 'branch': 'main' }
endif

if has('nvim')
  Plug 'tversteeg/registers.nvim', { 'branch': 'main' }
else
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif

call plug#end()

let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 0

let g:airline_theme = 'dark'

if has("autocmd")
  filetype plugin on
  filetype indent on
  autocmd FileType yaml setlocal et ts=2 sts=-1 sw=0
endif

" true color表示設定
set termguicolors

let &t_SI .= "\e[5 q"
let &t_EI .= "\e[1 q"
set backspace=indent,eol,start

syntax on
colorscheme jellybeans
highlight Normal ctermbg=NONE guibg=NONE
highlight NonText ctermbg=NONE guibg=NONE
highlight LineNr ctermbg=NONE guibg=NONE
highlight Folded ctermbg=NONE guibg=NONE
highlight EndOfBuffer ctermbg=NONE guibg=NONE
"hi Comment ctermfg=Gray
"hi Comment guifg=Gray
" highlight Visual ctermbg=244
hi Visual guibg=#A04000
hi CocHighlightText guibg=#00506A
hi CursorLine guibg=#00304A

set ttimeoutlen=50
set clipboard+=unnamed
set hidden

" 行番号表示
set number

" インクリメンタルサーチ. １文字入力毎に検索を行う
set incsearch
" 検索パターンに大文字小文字を区別しない
set ignorecase
" 検索パターンに大文字を含んでいたら大文字小文字を区別する
set smartcase
" 検索結果をハイライト"
set hlsearch

" 行を折り返さない
set nowrap

" 不可視文字を可視化(タブが「▸-」と表示される)
"set list listchars=tab:\▸\-,trail:-,eol:↲
" カーソルの左右移動で行末から次の行の行頭への移動が可能になる
set whichwrap=b,s,h,l,<,>,[,],~

" カーソルラインをハイライト"
set cursorline

set wildmenu wildmode=list:full

set inccommand=split

let mapleader = "\<Space>"

let NERDTreeShowHidden=1

nmap <silent> bn <Plug>AirlineSelectPrevTab
nmap <silent> bp <Plug>AirlineSelectNextTab
nmap <silent> <Esc><Esc> :<C-u>noh<CR><Esc>
nmap <silent> <C-e> :NERDTreeToggle<CR>
tnoremap <silent> <ESC> <C-\><C-n>

" FZF
fun! FzfOmniFiles()
  :Files
"  let is_git = system('git status')
"  if v:shell_error
"    :Files
"  else
"    :GitFiles
"  endif
endfun

let g:fzf_layout = { 'down': '~40%' }

nnoremap <leader>o :call FzfOmniFiles()<CR>
nnoremap <leader>f :BLines<CR>
nnoremap <leader>b :Buffers<CR>
nnoremap <leader>F :Lines<CR>
nnoremap <leader>g :Rg<Space>


nnoremap <leader><leader> :Commands<CR>

" coc setting
set encoding=utf-8

" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("nvim-0.5.0") || has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

inoremap <silent> jj <ESC>

