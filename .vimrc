" ヘルプドキュメント
helptags ~/.vim/vundle.git/doc

" Vundle
set nocompatible
filetype off

set rtp+=~/.vim/vundle.git/
call vundle#rc()

" 管理したいプラグイン
" (1) gitHubの任意のリポジトリ
Bundle 'mattn/zencoding-vim'
Bundle 'Shougo/unite.vim'
Bundle 'Shougo/neocomplcache'
Bundle 'Shougo/neosnippet'
Bundle 'tpope/vim-fugitive'
Bundle 'hokaccha/vim-css3-syntax'
Bundle 't9md/vim-foldtext'
Bundle 'LeafCage/foldCC'

" (2) vim-scriptsの任意のリポジトリ
Bundle 'snipMate'
Bundle 'Jasmine-snippets-for-snipMate'
Bundle 'surround.vim'
Bundle 'AutoComplPop'
Bundle 'The-NERD-tree'
Bundle 'The-NERD-Commenter'

filetype plugin indent on


" カラーの有効か
syntax on

" [行,列]表示
set ruler

" タイトルをウィンドウに表示
set title

" ステータスラインを常に表示
set laststatus=2

" ステータスライン表示方法
set statusline=%<[%n]%m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).':'.&ff.']'}%y\ %F%=%l,%c%V%8P

" 行番号表示
set number

" カーソル表示(行)
set cursorline

" カーソル表示(列)
"set cursorcolumn

" カレントウィンドウにのみ罫線を引く
augroup cch
  autocmd! cch
  autocmd WinLeave * set nocursorline
  autocmd WinEnter,BufRead * set cursorline
augroup END

hi clear CursorLine
hi CursorLine gui=underline
highlight CursorLine ctermbg=black guibg=black

" 括弧入力時の対応する括弧を表示
set showmatch

" 対応する括弧の表示時間を2にする
set matchtime=2

" 検索結果文字列のハイライトを有効にする
set hlsearch

" esc連打で検索ハイライトを消す
nmap <Esc><Esc> :nohlsearch<CR><Esc>

" タブをスペースに置き換える
set expandtab

" タブを画面で表示する際の幅
set tabstop=4

" インデント時に使用されるスペースの数
set shiftwidth=4

" オートインデント
set autoindent

" コマンド補完を強化
set wildmenu

" 入力中のコマンド表示
set showcmd

" 折り返さない
set nowrap

" 256色に対応させる
set t_Co=256

" プラグインを有効にする
filetype on
filetype indent on
filetype plugin on

" コード折りたたみ
autocmd Filetype php,css,scss,c,cpp,perl :set foldmethod=marker
autocmd Filetype php,css,scss,c,cpp,perl :set foldmarker={,}
autocmd Filetype php,css,scss,c,cpp,perl :set foldtext=FoldCCtext()
autocmd Filetype php,css,scss,c,cpp,perl hi Folded gui=bold term=standout ctermbg=LightGrey ctermfg=DarkBlue guibg=Grey30 guifg=Grey80
autocmd Filetype php,css,scss,c,cpp,perl hi FoldColumn gui=bold term=standout ctermbg=LightGrey ctermfg=DarkBlue guibg=Grey guifg=DarkBlue

" 文字列中のHTMLをハイライトする
let php_htmlInStrings=1

" 文字列中のSQLをハイライトする
let php_sql_query=1

""clang_complete
"let g:clang_complete_auto=1
"let g:clang_use_library=0
"let g:clang_exec="/usr/bin/clang++"
"let g:clang_user_options='2> NUL || exit 0"'

" 辞書ファイルを使用する設定に変更
set complete+=k

" カラースキーマ
colorscheme molokai

" 挿入モードとノーマルモードでステータスラインの色変更
au InsertEnter * hi StatusLine guifg=White guibg=DarkRed gui=none ctermfg=White ctermbg=Red cterm=none
au InsertLeave * hi StatusLine guifg=While guibg=Blue gui=none ctermfg=White ctermbg=Blue cterm=none

" ノーマルモード時
"nnoremap <C-l> zL
"nnoremap <C-h> zH
nnoremap bg gT

" 挿入モード時（emacsキーバインド）
inoremap <C-e> <End>
inoremap <C-a> <Home>
inoremap <C-u> <C-o>d0
inoremap <C-k> <C-o>d$
inoremap <C-d> <C-o>x
inoremap <C-h> <C-o>X
inoremap <C-p> <C-o>k
inoremap <C-n> <C-o>j
inoremap <C-f> <C-o>l
inoremap <C-b> <C-o>h

" 挿入モード時（zen-coding）
nnoremap <C-y>m <Esc>:call zencoding#moveNextPrev(1)<CR>
inoremap <C-y>m <Esc>:call zencoding#moveNextPrev(1)<CR>

" カーソルキー無効
nnoremap <Up> <Nop>
nnoremap <Down> <Nop>
nnoremap <Left> <Nop>
nnoremap <Right> <Nop>
inoremap <Up> <Nop>
inoremap <Down> <Nop>
inoremap <Left> <Nop>
inoremap <Right> <Nop>

" おまけ　キーマップ
inoremap {} {}<LEFT>
inoremap [] []<LEFT>
inoremap () ()<LEFT>
inoremap '' ''<LEFT>
inoremap "" ""<LEFT>
inoremap <> <><LEFT>
inoremap ?? ??<LEFT>
inoremap `` ``<LEFT>
inoremap jj <Esc>

" reload vimic
noremap <C-c><C-c> <C-c>
noremap <C-c><C-e>e :edit $HOME/.vimrc<CR>
noremap <C-c><C-e>s :source $HOME/.vimrc<CR>

" NERDTree切り替え
nnoremap <F9> :NERDTreeToggle<CR>

"タイムスタンプ入力
inoremap <F10> <C-R>=strftime("%Y/%m/%d (%a) %H:%M")<CR>

" pasteモード切り替え
set pastetoggle=<F11>

" 改行時の自動コメント挿入禁止
autocmd Filetype * setlocal formatoptions-=ro

" number / relativenumberの切り替え
if version >= 703
    nnoremap  <silent> ,n :<C-u>ToggleNumber<CR>
    command! -nargs=0 ToggleNumber call ToggleNumberOption()

    function! ToggleNumberOption()
        if &number
            set relativenumber
        else
            set number
        endif
    endfunction
endif


let g:user_zen_complete_tag = 1

" neocomplcache
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Use camel case completion.
let g:neocomplcache_enable_camel_case_completion = 1
" Use underbar completion.
let g:neocomplcache_enable_underbar_completion = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
" buffer file name pattern that locks neocomplcache. e.g. ku.vim or fuzzyfinder 
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

" neocomplcache snippets
" スニペットを展開
imap <C-k> <Plug>(neocomplcache_snippets_expand)
smap <C-k> <Plug>(neocomplcache_snippets_expand)

" スニペットファイルの場所
let g:neocomplcache_snippets_dir = $HOME . '/.vim/bundle/snipMate/snippets'

let g:snippets_dir = $HOME . '/.vim/bundle/snipMate/snippets/'

