"...........................................................................................................
"...............................................................................................................
"................................_..............................................................................
"                         __   _(_)_ __ ___  _ __ ___ 
"                         \ \ / / | '_ ` _ \| '__/ :__|
"                          \ V /| | | | | | | | | (__ 
"                         (_)_/ |_|_| |_| |_|_|  \___|
"...............................................................................................................
"...............................................................................................................
"...............................................................................................................
"...............................................................................................................
"...............................................................................................................
"...............................................................................................................
"===============================================================================================================
""General
"{{{
" Indent
set list
set listchars=tab:»-
set number             "行番号を表示
set autoindent         "改行時に自動でインデントする
set tabstop=4          "タブを何文字の空白に変換するか
set shiftwidth=4       "自動インデント時に入力する空白の数
set expandtab          "タブ入力を空白に変換
set splitright         "画面を縦分割する際に右に開く
set clipboard=unnamed  "yank した文字列をクリップボードにコピー
set hls                "検索した文字をハイライトする
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
"runtime! plugins/dein.rc.vim
"===============================================================================================================

"===============================================================================================================
"dein.rc.vim
let s:plugin = '~/.config/nvim/plugins/config/dein.toml'
let s:plugin_lazy = '~/.config/nvim/plugins/config/dein_lazy.toml'

let NERDTreeIgnore = ['\.DAT$', '\.LOG1$', '\.LOG1$']
let NERDTreeIgnore += ['\.png$','\.jpg$','\.gif$','\.mp3$','\.flac$', '\.ogg$', '\.mp4$','\.avi$','.webm$','.mkv$','\.pdf$', '\.zip$', '\.tar.gz$', '\.rar$']
let NERDTreeIgnore +=['\c^ntuser\..*']

if &compatible
  set nocompatible
endif

set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.cache/dein')

  call dein#begin('~/.cache/dein')
  call dein#load_toml(s:plugin, {'lazy': 0})
  call dein#load_toml(s:plugin_lazy, {'lazy': 1})
  call dein#add('vim-airline/vim-airline')
  call dein#add('fatih/molokai')
  call dein#add('scrooloose/nerdtree')
  call dein#add('vim-airline/vim-airline-themes')
  call dein#add('ryanoasis/vim-devicons')
  call dein#end()
  call dein#save_state()
endif

if dein#check_install()
  call dein#install()
endif

filetype plugin indent on
autocmd VimEnter * execute 'NERDTree'

let g:airline_theme = 'molokai'
"===============================================================================================================

"===============================================================================================================
"defx-git.rc.vim
let g:defx_git#indicators = {
      \ 'Modified'  : '+',
      \ 'Staged'    : '●',
      \ 'Untracked' : '?',
      \ 'Renamed'   : '➜',
      \ 'Unmerged'  : '═',
      \ 'Deleted'   : 'x',
      \ 'Unknown'   : '?'
      \ }
"===============================================================================================================

"===============================================================================================================
"defx.rc.vim
" 【Ctrl + f】 defx.nvimを起動
nnoremap <silent><C-f> :<C-u>Defx<CR>
call defx#custom#option('_', {
    \ 'columns': 'indent:git:icons:filename',
    \ 'show_ignored_files': 1,
    \ })

let g:defx_icons_enable_syntax_highlight = 1
let g:defx_icons_column_length = 2

autocmd FileType defx call s:defx_my_settings()
    function! s:defx_my_settings() abort
      nnoremap <silent><buffer><expr> <CR>
     \ defx#do_action('open')
      " 【o】 ファイルを開く
      nnoremap <silent><buffer><expr> o
      \ defx#do_action('open')
      " 【s】 ウィンドウを水平分割してファイルを開く
      nnoremap <silent><buffer><expr> s
      \ defx#do_action('open', 'split')
      " 【v】 ウィンドウを垂直分割してファイルを開く
      nnoremap <silent><buffer><expr> v
      \ defx#do_action('open', 'vsplit')
      " 【c】 ファイルをコピーする
      nnoremap <silent><buffer><expr> c
      \ defx#do_action('copy')
      " 【m】 ファイルを移動する
      nnoremap <silent><buffer><expr> m
      \ defx#do_action('move')
      " 【p】 ファイルを貼り付ける
      nnoremap <silent><buffer><expr> p
      \ defx#do_action('paste')
      " 【n】 新しいファイルを作成する
      nnoremap <silent><buffer><expr> n
      \ defx#do_action('new_file')
      " 【N】 新しいディレクトリを作成する
      nnoremap <silent><buffer><expr> N
      \ defx#do_action('new_directory')
      " 【d】 ファイルを削除する
      nnoremap <silent><buffer><expr> d
      \ defx#do_action('remove')
      " 【r】 ファイル名を変更する
      nnoremap <silent><buffer><expr> r
      \ defx#do_action('rename')
      " 【t】 ツリーを表示/非表示する
      nnoremap <silent><buffer><expr> t
      \ defx#do_action('open_or_close_tree')
      " 【x】 ファイルを実行する
      nnoremap <silent><buffer><expr> x
      \ defx#do_action('execute_system')
      " 【yy】 ファイル/ディレクトリのパスをコピーする
      nnoremap <silent><buffer><expr> yy
      \ defx#do_action('yank_path')
      nnoremap <silent><buffer><expr> .
      " 【.】 隠しファイルを表示/非表示する
      \ defx#do_action('toggle_ignored_files')
      nnoremap <silent><buffer><expr> ..
      " 【..】 親ディレクトリに移動する
      \ defx#do_action('cd', ['..'])
      nnoremap <silent><buffer><expr> ~
      " 【~】 ホームディレクトリに移動する
      \ defx#do_action('cd')
      " 【ESC】 / 【q】 defx.nvimを終了する
      nnoremap <silent><buffer><expr> <Esc> 
      \ defx#do_action('quit')
      nnoremap <silent><buffer><expr> q
      \ defx#do_action('quit')
      " 【j】 カーソルを下に移動する
      nnoremap <silent><buffer><expr> j
      \ line('.') == line('$') ? 'gg' : 'j'
      " 【k】 カーソルを上に移動する
      nnoremap <silent><buffer><expr> k
      \ line('.') == 1 ? 'G' : 'k'
      " 【cd】 Neovim上のカレントディレクトリを変更する
      nnoremap <silent><buffer><expr> cd
      \ defx#do_action('change_vim_cwd')
endfunction
"===============================================================================================================

"===============================================================================================================
"denite.rc.vim
" 【Ctrl + d + a】 カレントディレクトリとバッファを表示
nnoremap <silent><C-d>a :<C-u>Denite file buffer -split=floating file:new<CR>
" 【Ctrl + d + b】 バッファを表示
nnoremap <silent><C-d>b :<C-u>Denite buffer -split=floating file:new<CR>
" 【Ctrl + d + f】 カレントディレクトリを表示
nnoremap <silent><C-d>f :<C-u>Denite file -split=floating file:new<CR>
" 【Ctrl + d + r】 カレントディレクトリ以下を再帰的に表示
nnoremap <silent><C-d>r :<C-u>Denite file/rec -split=floating file:new<CR>
" 【Ctrl + d + gr】 カレントディレクトリ以下のファイルから指定した文字列を検索
nnoremap <silent><C-d>gr :<C-u>Denite grep -buffer-name=search<CR>
" 【Ctrl + d + ,】 カレントディレクトリ以下のファイルからカーソル下の文字列を検索
nnoremap <silent><C-d>, :<C-u>DeniteCursorWord grep -buffer-name=search line<CR>
" 【Ctrl + d + gs】 grepした結果を再表示
nnoremap <silent><C-d>gs :<C-u>Denite -resume -buffer-name=search<CR>
" 【Ctrl + d + c】 Neovim内で実行したコマンドを表示
nnoremap <silent><C-d>c :<C-u>Denite command_history -split=floating<CR>

autocmd FileType denite call s:denite_my_settings()
function! s:denite_my_settings() abort
  nnoremap <silent><buffer><expr> <CR>
  \ denite#do_map('do_action')
  " 【o】 ファイルを開く
  nnoremap <silent><buffer><expr> o
  \ denite#do_map('do_action')
  " 【s】 ウィンドウを水平分割してファイルを開く
  nnoremap <silent><buffer><expr> s
  \ denite#do_map('do_action', 'split')
  " 【v】 ウィンドウを垂直分割してファイルを開く
  nnoremap <silent><buffer><expr> v
  \ denite#do_map('do_action', 'vsplit')
  " 【d】 ファイルを削除する
  nnoremap <silent><buffer><expr> d
  \ denite#do_map('do_action', 'delete')
  " 【p】 ファイルをプレビュー画面で開く
  nnoremap <silent><buffer><expr> p
  \ denite#do_map('do_action', 'preview')
  " 【ESC】 / 【q】 denite.nvimを終了する
  nnoremap <silent><buffer><expr> <Esc>
  \ denite#do_map('quit')
  nnoremap <silent><buffer><expr> q
  \ denite#do_map('quit')
  " 【i】 ファイル名で検索する
  nnoremap <silent><buffer><expr> i
  \ denite#do_map('open_filter_buffer')
  " 【SPACE】 ファイルを複数選択する
  nnoremap <silent><buffer><expr> <Space>
  \ denite#do_map('toggle_select').'j'
endfunction

autocmd FileType denite-filter call s:denite_filter_my_settings()
function! s:denite_filter_my_settings() abort
  imap <silent><buffer> <C-o> <Plug>(denite_filter_quit)
endfunction
"===============================================================================================================

"===============================================================================================================
"deol.rc.vim
nnoremap <silent><C-o> :<C-u>Deol fish -split=floating<CR>
tnoremap <ESC>   <C-\><C-n>
"===============================================================================================================

"===============================================================================================================
"deplete.rc.vim
" FILE: deoplete.vim
" AUTHOR:  Shougo Matsushita <Shougo.Matsu at gmail.com>
" License: MIT license
if exists('g:loaded_deoplete')
  finish
endif
let g:loaded_deoplete = 1

" Global options definition.
if get(g:, 'deoplete#enable_at_startup', 0)
  call deoplete#enable()
endif
"===============================================================================================================

"===============================================================================================================
"aitline.rc.vim
" Powerline系フォントを利用する
set laststatus=2
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline#extensions#whitespace#mixed_indent_algo = 1
let g:airline_theme = 'tomorrow'
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.crypt = '🔒'
let g:airline_symbols.linenr = '☰'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.maxlinenr = '㏑'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.spell = 'Ꞩ'
let g:airline_symbols.notexists = '∄'
let g:airline_symbols.whitespace = 'Ξ'

" powerline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = '☰'
let g:airline_symbols.maxlinenr = ''
"===============================================================================================================

"===============================================================================================================
"ale.rc.vim
" 保存時のみ実行する
let g:ale_lint_on_text_changed = 0
" 表示に関する設定
let g:ale_sign_error = ''
let g:ale_sign_warning = ''
let g:airline#extensions#ale#open_lnum_symbol = '('
let g:airline#extensions#ale#close_lnum_symbol = ')'
let g:ale_echo_msg_format = '[%linter%]%code: %%s'
highlight link ALEErrorSign Tag
highlight link ALEWarningSign StorageClass
" Ctrl + kで次の指摘へ、Ctrl + jで前の指摘へ移動
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)" Powerline系フォントを利用する
set laststatus=2
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline#extensions#whitespace#mixed_indent_algo = 1
let g:airline_theme = 'tomorrow'
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.crypt = '🔒'
let g:airline_symbols.linenr = '☰'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.maxlinenr = '㏑'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.spell = 'Ꞩ'
let g:airline_symbols.notexists = '∄'
let g:airline_symbols.whitespace = 'Ξ'
" powerline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = '☰'
let g:airline_symbols.maxlinenr = ''
"===============================================================================================================

"===============================================================================================================
"coc.rc.vim
" if hidden is not set, TextEdit might fail.
set hidden

" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Better display for messages
set cmdheight=2

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=100

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

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

" Use `Ctrl + c` to trigger completion.
inoremap <silent><expr> <C-c> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `Ctrl + [` and `Ctrl + ]` to navigate diagnostics
nmap <silent> <C-[> <Plug>(coc-diagnostic-prev)
nmap <silent> <C-]> <Plug>(coc-diagnostic-next)

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
"autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <silent><F2> <Plug>(coc-rename)
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
nmap <silent><F3> <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <silent><F4> <Plug>(coc-fix-current)
" Use <tab> for select selections ranges, needs server support, like: coc-tsserver, coc-python
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <S-TAB> <Plug>(coc-range-select-backword)
" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')
" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)
" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')
" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>
"===============================================================================================================

if dein#load_state('/home/hayato/.cache/dein')
  call dein#begin('/home/hayato/.cache/dein')

  " Let dein manage dein
  " Required:
  call dein#add('/home/hayato/.cache/dein/repos/github.com/Shougo/dein.vim')

  " Add or rvemove your plugins here like this:
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

"NERDTreeをトグルで表示、非表示
map <C-l> :NERDTreeToggle<CR>

"マウス有効化
set mouse=a 
