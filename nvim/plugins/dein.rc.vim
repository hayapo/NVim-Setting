
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