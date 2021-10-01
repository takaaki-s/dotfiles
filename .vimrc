call plug#begin('~/.vim/plugged')

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'
Plug 'bronson/vim-trailing-whitespace'
Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'tomasr/molokai'
Plug 'w0ng/vim-hybrid'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'peitalin/vim-jsx-typescript'
Plug 'leafgarland/typescript-vim'


call plug#end()

"let g:deoplete#enable_at_startup = 1
"call deoplete#custom#option('auto_complete_delay', 200)

let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 0

let g:airline_theme = 'dark'

" true color表示設定
set termguicolors
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

let &t_SI .= "\e[5 q"
let &t_EI .= "\e[1 q"
set backspace=indent,eol,start

syntax on
colorscheme molokai
hi Normal ctermbg=none
"hi Normal guibg=none
"hi Comment ctermfg=Gray
"hi Comment guifg=Gray
" highlight Visual ctermbg=244
" highlight Visual guibg=244

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

" 不可視文字を可視化(タブが「▸-」と表示される)
set list listchars=tab:\▸\-,trail:-,eol:↲
" カーソルの左右移動で行末から次の行の行頭への移動が可能になる
set whichwrap=b,s,h,l,<,>,[,],~

" カーソルラインをハイライト"
set cursorline

set wildmenu wildmode=list:full


" Define mappings

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

nnoremap <C-b> :Buffers<CR>
nnoremap <C-g> :Rg<Space>
nnoremap <leader><leader> :Commands<CR>
nnoremap <C-p> :call FzfOmniFiles()<CR>

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

