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
Plug 'dominikduda/vim_current_word'

if has('nvim')
  Plug 'Shougo/denite.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/denite.nvim'
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
" highlight Visual guibg=244

hi CurrentWordTwins guibg=#00405A

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

" Define mappings
autocmd FileType denite call s:denite_my_settings()
function! s:denite_my_settings() abort
  nnoremap <silent><buffer><expr> <CR>
  \ denite#do_map('do_action')
  nnoremap <silent><buffer><expr> d
  \ denite#do_map('do_action', 'delete')
  nnoremap <silent><buffer><expr> p
  \ denite#do_map('do_action', 'preview')
  nnoremap <silent><buffer><expr> q
  \ denite#do_map('quit')
  nnoremap <silent><buffer><expr> i
  \ denite#do_map('open_filter_buffer')
  nnoremap <silent><buffer><expr> <Space>
  \ denite#do_map('toggle_select').'j'
endfunction

" Change default action. use floating
let s:denite_win_width_percent = 0.85
let s:denite_win_height_percent = 0.7
let s:denite_default_options = {
    \ 'split': 'floating',
    \ 'winwidth': float2nr(&columns * s:denite_win_width_percent),
    \ 'wincol': float2nr((&columns - (&columns * s:denite_win_width_percent)) / 2),
    \ 'winheight': float2nr(&lines * s:denite_win_height_percent),
    \ 'winrow': float2nr((&lines - (&lines * s:denite_win_height_percent)) / 2),
    \ 'highlight_filter_background': 'DeniteFilter',
    \ 'prompt': '$ ',
    \ 'start_filter': v:true,
    \ }
call denite#custom#option('default', s:denite_default_options)

let mapleader = "\<Space>"

let NERDTreeShowHidden=1

nmap <silent> bn <Plug>AirlineSelectPrevTab
nmap <silent> bp <Plug>AirlineSelectNextTab
nmap <silent> <Esc><Esc> :<C-u>noh<CR><Esc>
nmap <silent> <C-e> :NERDTreeToggle<CR>
tnoremap <silent> <ESC> <C-\><C-n>

" FZF
fun! FzfOmniFiles()
  let is_git = system('git status')
  if v:shell_error
    :Files
  else
    :GitFiles
  endif
endfun

let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6 } }

nnoremap <leader>o :call FzfOmniFiles()<CR>
nnoremap <leader>f :BLines<CR>
nnoremap <leader>b :Buffers<CR>
nnoremap <leader>F :Lines<CR>
nnoremap <leader>g :Rg<Space>


nnoremap <C-g> :Rg<Space>
nnoremap <leader><leader> :Commands<CR>

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

inoremap <silent> jj <ESC>

