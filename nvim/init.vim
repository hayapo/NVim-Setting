" dein.vim {{{
"  directory configuration
"let s:config_home = empty($XDG_CONFIG_HOME) ? expand('~/.config') : $XDG_CONFIG_HOME
"let s:dein_config_dir = s:config_home . '/nvim/plugins'
"let s:toml_file = s:dein_config_dir . '/config/dein.toml'
"let s:cache_home = empty($XDG_CACHE_HOME) ? expand('~/.cache') : $XDG_CACHE_HOME
"let s:dein_dir = s:cache_home . '/dein'
"let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'"
"  dein installation
"if !isdirectory(s:dein_repo_dir)
""    call system('git clone https://github.com/Shougo/dein.vim ' . shellescape(s:dein_repo_dir))
"endif
"  path
"let &runtimepath = s:dein_repo_dir . "," . &runtimepath
"if dein#load_state(s:dein_dir)
"    call dein#begin(s:dein_dir)
"    call dein#load_toml(s:toml_file, {'lazy': 0})
"    call dein#end()
"    call dein#save_state()
"endif
"  install new plugins
"if has('vim_starting') && dein#check_install()
"    call dein#install()
"endif
" dein.vim }}}

"                                _                    
"                         __   _(_)_ __ ___  _ __ ___ 
"                         \ \ / / | '_ ` _ \| '__/ __|
"                          \ V /| | | | | | | | | (__ 
"                         (_)_/ |_|_| |_| |_|_|  \___|
"

" General {{{
" Indent
set tabstop=4
set shiftwidth=4
set expandtab
set list
set listchars=tab:»-

" Fold
set foldlevel=100

" Encoding
set encoding=utf-8
scriptencoding utf-8
set fileencodings=utf-8,ucs-bom,iso-2022-jp-3,iso-2022-jp,eucjp-ms,euc-jisx0213,euc-jp,sjis,cp932

" Font
set guifont=Ricty-Regular-nerd-Powerline\ 11

" Search
if has('nvim')
    set inccommand=split
endif

" Python 3.x系のPathを設定
let g:python3_host_prog = '/home/hayato/.pyenv/shims/python3'

" dein.vim を使うために以下を記述
runtime! plugins/dein.rc.vim

set number             "行番号を表示
set autoindent         "改行時に自動でインデントする
set tabstop=2          "タブを何文字の空白に変換するか
set shiftwidth=2       "自動インデント時に入力する空白の数
set expandtab          "タブ入力を空白に変換
set splitright         "画面を縦分割する際に右に開く
set clipboard=unnamed  "yank した文字列をクリップボードにコピー
set hls                "検索した文字をハイライトする

if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=/home/hayato/.cache/dein/repos/github.com/Shougo/dein.vim

let NERDTreeIgnore = ['\.DAT$', '\.LOG1$', '\.LOG1$']
let NERDTreeIgnore += ['\.png$','\.jpg$','\.gif$','\.mp3$','\.flac$', '\.ogg$', '\.mp4$','\.avi$','.webm$','.mkv$','\.pdf$', '\.zip$', '\.tar.gz$', '\.rar$']
let NERDTreeIgnore +=['\c^ntuser\..*']
" Required:
if dein#load_state('/home/hayato/.cache/dein')
  call dein#begin('/home/hayato/.cache/dein')

  " Let dein manage dein
  " Required:
  call dein#add('/home/hayato/.cache/dein/repos/github.com/Shougo/dein.vim')

  " Add or remove your plugins here like this:
  "call dein#add('Shougo/neosnippet.vim')
  "call dein#add('Shougo/neosnippet-snippets')

  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
"if dein#check_install()
"  call dein#install()
"endif

" Color {{{
" Custom
augroup color_scheme
  autocmd!
  " change list symbol color
  autocmd ColorScheme * highlight link mkdListItem Statement
  " change header color
  autocmd ColorScheme * highlight link htmlH1 PreProc
  " change search result color
  autocmd ColorScheme * highlight Search ctermfg=255 ctermbg=24
augroup END

" Color Scheme
colorscheme molokai
let g:rehash256 = 1

" finally
syntax on
" }}}

let g:airline_theme = 'molokai'
set guifont=RobotoMono\ Nerd\ Font\ 11

let g:airline_powerline_fonts = 1
set laststatus=2

let g:airline_theme = 'tomorrow'

nmap <C-p> <Plug>AirlineSelectPrevTab
nmap <C-n> <Plug>AirlineSelectNextTab
let g:airline#extensions#tabline#buffer_idx_format = {
	\ '0': '0 ',
	\ '1': '1 ',
	\ '2': '2 ',
	\ '3': '3 ',
	\ '4': '4 ',
	\ '5': '5 ',
	\ '6': '6 ',
	\ '7': '7 ',
	\ '8': '8 ',
	\ '9': '9 '
	\}

if !exists('g:airline_symbols')
	let g:airline_symbols = {}
endif
 
"左側に使用されるセパレータ
let g:airline_left_sep = '⮀'
let g:airline_left_alt_sep = '⮁'
"右側に使用されるセパレータ
let g:airline_right_sep = '⮂'
let g:airline_right_alt_sep = '⮃'
let g:airline_symbols.crypt = '🔒'		"暗号化されたファイル
let g:airline_symbols.linenr = '¶'			"行
let g:airline_symbols.maxlinenr = '㏑'		"最大行
let g:airline_symbols.branch = '⭠'		"gitブランチ
let g:airline_symbols.paste = 'ρ'			"ペーストモード
let g:airline_symbols.spell = 'Ꞩ'			"スペルチェック
let g:airline_symbols.notexists = '∄'		"gitで管理されていない場合
let g:airline_symbols.whitespace = 'Ξ'	"空白の警告(余分な空白など)

let g:airline#extensions#default#layout = [
	\ [ 'a', 'b', 'c' ],
	\ [ 'x', 'y', 'z', 'error', 'warning']
	\ ]

" インクリメンタルサーチ. １文字入力毎に検索を行う
set incsearch
" 検索パターンに大文字小文字を区別しない
set ignorecase
" 検索パターンに大文字を含んでいたら大文字小文字を区別する
set smartcase
" 検索結果をハイライト"
set hlsearch

" カーソルラインをハイライト"
set cursorline

map <C-l> :NERDTreeToggle<CR>