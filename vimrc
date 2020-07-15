" An example for a vimrc file.
"   Mainteiner: lynch513@yandex.ru
"

" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
" call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
" Example: Plugin 'tpope/vim-fugitive'
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Main plugins
"
Plugin 'jiangmiao/auto-pairs'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'Yggdroot/indentLine'
Plugin 'tmhedberg/matchit'
Plugin 'scrooloose/nerdtree'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'tpope/vim-commentary'
Plugin 'elzr/vim-json'
Plugin 'tpope/vim-surround'
Plugin 'Shougo/vimproc.vim'
Plugin 'damage220/solas.vim'
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Secondary plugins
"
Plugin 'ervandew/supertab'
Plugin 'vim-syntastic/syntastic'
Plugin 'godlygeek/tabular'
Plugin 'jpalardy/vim-slime'
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Language plugins
"
" Haskell
"
" Plugin 'eagletmt/neco-ghc'
" Plugin 'eagletmt/ghcmod-vim'
" Plugin 'raichoo/purescript-vim'
" Plugin 'pbrisbin/vim-syntax-shakespeare'
" Plugin 'itchyny/vim-haskell-indent'
"
" Elm
"
" Plugin 'elmcast/elm-vim'
"
" JavaScript
"
Plugin 'ternjs/tern_for_vim'  " npm install in ternjs/tern_for_vim
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
"
" TypeScript
"
Plugin 'Quramy/tsuquyomi'
Plugin 'leafgarland/typescript-vim'
Plugin 'ianks/vim-tsx.git'
"
" Clojure
"
" Plugin 'tpope/vim-salve'
" Plugin 'tpope/vim-classpath'
Plugin 'tpope/vim-fireplace'
"
" Elixir
"
" Plugin 'elixir-lang/vim-elixir'
"
" Python
"
Plugin 'klen/python-mode'
Plugin 'davidhalter/jedi-vim'
Plugin 'mitsuhiko/vim-jinja'
Plugin 'mitsuhiko/vim-python-combined'
"
" Go
"
" Plugin 'fatih/vim-go'
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Various file formats
"
Plugin 'mattn/emmet-vim'
Plugin 'digitaltoad/vim-pug'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal

" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

"if has("vms")
"  set nobackup		" do not keep a backup file, use versions instead
"else
"  set backup		" keep a backup file (restore to previous version)
"  set undofile		" keep an undo file (undo changes after closing)
"endif
"set history=50		" keep 50 lines of command line history
"set ruler		" show the cursor position all the time
"set showcmd		" display incomplete commands
"set incsearch		" do incremental searching

" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
" let &guioptions = substitute(&guioptions, "t", "", "g")

" Don't use Ex mode, use Q for formatting
map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")
  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on
  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!
  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78
  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if line("'\"") >= 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif
  augroup END
else
  set autoindent		" always set autoindenting on
endif " has("autocmd")

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif

if has('langmap') && exists('+langnoremap')
  " Prevent that the langmap option applies to characters that result from a
  " mapping.  If unset (default), this may break plugins (but it's backward
  " compatible).
  set langnoremap
endif

filetype plugin indent on

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" My keymap settings

" show existing tab with 4 spaces width
set tabstop=2
" when indenting with '>', use 4 spaces width
set shiftwidth=2
" On pressing tab, insert 4 spaces
set expandtab

" Live reload (then file a externally changed)
set autoread
au CursorHold,CursorHoldI * checktime

" Set line numbers
set number
" Colors of the line numbers 
highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE

map <C-N> :NERDTreeToggle<CR>

" move among buffers
" move among tabs
"
nnoremap <silent> [b :bprevious<CR>
nnoremap <silent> ]b :bnext<CR>
nnoremap <silent> ]t :tabnext<CR>
nnoremap <silent> [t :tabprevious<CR>

" Add empty lines
nnoremap ]<Space> m`o<Esc>``
nnoremap [<Space> m`O<Esc>``

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" My settings

" Search parameters
set is hls

" Десятичный формат по умолчанию
set nrformats=

" Всегда показывать строку состояния
set laststatus=2

" Выделять строку в которой находится курсор
set cursorline

" Цветовая тема
colorscheme solas
" colorscheme jellybeans
 
" Включить wildmenu
" set wildmenu
" set wildmode=list:longest,full

" Turn off automatic visual mode on mouse select
set mouse-=a

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Подсветка отступов и переносов строк

" ALL unvisible chars: eol:¬,tab:>·,trail:~,extends:>,precedes:<,space:␣
set listchars=tab:▸\·,eol:¬,space:·
nmap <leader>l :set list!<CR>

"Invisible character colors 
highlight NonText ctermfg=darkgrey
highlight SpecialKey ctermfg=darkgrey

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Вкл/выкл номера строк

nmap <leader>n :set invnumber<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Настройки Tabular

" Выравнивание по первой кавычке 
vmap <leader>"  :'<,'>Tabularize /^[^"]*\zs"/l1r0<CR>
vmap <leader>=  :'<,'>Tabularize /=<CR>
vmap <leader>-> :'<,'>Tabularize /-><CR>
" выравнивание по первому двоеточию 
vmap <leader>:  :'<,'>Tabularize /^[^:]*\zs:/l1r0<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Настройки AirLine

" let g:airline_powerline_fonts=1
let g:airline_theme='solarized'

" включить управление табами
let g:airline#extensions#tabline#enabled = 1

" такое же поведение, как и в sublime: если файл с уникальным именем - показывается только имя, если встречается файл с таким же именем, отображается также и директория
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#fnamecollapse = 0
let g:airline#extensions#tabline#fnametruncate = 0

" скрыть буферы
let g:airline#extensions#tabline#show_buffers = 0

" имя файла + расширение :help filename-modifiers
let g:airline#extensions#tabline#fnamemod = ':t'

" убираем раздражающие ненужные красные панели с предупреждениями или ошибками. 
let g:airline_section_warning = ''
let g:airline_section_error = ''

" убираем "X" для закрытия вкладки мышью 
let g:airline#extensions#tabline#show_close_button = 0

" убираем разделитель для вкладок
let g:airline#extensions#tabline#left_alt_sep = ''

" отключаем tagbar
let g:airline#extensions#tagbar#enabled = 0

" показывать номер вкладки
let g:airline#extensions#tabline#show_tab_nr = 1

" показывать только номер вкладки
let g:airline#extensions#tabline#tab_nr_type = 1

" Не показывать метки [tabs] и [buffers]
let airline#extensions#tabline#tabs_label = ''
let airline#extensions#tabline#buffers_label = ''

" Не показывать список буферов
" let airline#extensions#tabline#show_splits = 0

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Настройки для Clojure

" настройки комментариев vim-commenter
autocmd FileType clojure setlocal commentstring=;;\ %s

" настройки работы с скобками auto-pairs
" au Filetype clojure let b:AutoPairs = {'(':')', '[':']', '{':'}','"':'"', '`':'`'}
au Filetype clojure let b:AutoPairs = {'(':')', '[':']', '{':'}','"':'"'}

" добавить поддержку boot
augroup filetypedetect
  au BufRead,BufNewFile *.boot setfiletype clojure
  " associate *.boot with clojure filetype
augroup END

" Добавить поддержку edn
augroup filetypedetect
  au BufRead,BufNewFile *.edn set filetype=clojure
augroup END

" Поддержка tmux
let g:slime_target = "tmux"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Настройки для JavaScript

" Поддержка jsx для файлов *.js
let g:jsx_ext_required = 0

" Показать документацию, требуется плагин tern_for_vim
autocmd FileType javascript map <buffer> <S-k> :TernDoc <CR>

" Настройки линтера, требуется плагин syntastic
let g:syntastic_javascript_checkers = ['eslint']

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Настройки подключения к REPL 

set wildmenu
set wcm=<Tab>
menu Repl.ClojureScript :Piggieback (adzerk.boot-cljs-repl/repl-env)<CR> 
map <F5> :emenu Repl.<Tab>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Проверка орфографии

set wildmenu
set wcm=<Tab>
menu Spell.No\ Spell :set nospell<CR>
menu Spell.Russian&English :setlocal spell spelllang=ru,en<CR>
menu Spell.English :setlocal spell spelllang=en<CR>
menu Spell.Russian :setlocal spell spelllang=ru<CR>
map <F7> :emenu Spell.<Tab>
imap <F7> <C-o>:emenu Spell.<Tab>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Локализация

set langmap=ёйцукенгшщзхъфывапролджэячсмитьбюЁЙЦУКЕHГШЩЗХЪФЫВАПРОЛДЖЭЯЧСМИТЬБЮ;`qwertyuiop[]asdfghjkl\\;'zxcvbnm\\,.~QWERTYUIOP{}ASDFGHJKL:\\"ZXCVBNM<>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Настройки emmet

let g:user_emmet_install_global = 0
autocmd FileType html,css,javascript.jsx,eelixir,htmljinja,htmldjango EmmetInstall
let g:user_emmet_leader_key="<leader>"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Настройки syntastic

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Настройки tern_for_vim

let g:tern_show_argument_hints = 'on_hold'
let g:tern_show_signature_in_pum = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Настройки ctrl_p

let g:ctrlp_custom_ignore = 'node_modules\|git'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Настройки supertab

let g:SuperTabDefaultCompletionType = '<c-x><c-o>'

if has("gui_running")
  imap <c-space> <c-r>=SuperTabAlternateCompletion("<c-x><c-o>")<cr>
else " no gui
  if has("unix")
    inoremap <Nul> <c-r>=SuperTabAlternateCompletion("<c-x><c-o>")<cr>
  endif
endif

" Отключение всплывающего окна Completion Menu
" set completeopt-=preview

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Настройки Haskell

" " Автокомплит
" let g:haskellmode_completion_ghc = 1 
" autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc

" " Настройки Tabular
" " let g:haskell_tabular = 1

" " Настройки для Hamlet
" let g:hamlet_prevent_invalid_nesting = 0
" let g:hamlet_highlight_trailing_space = 0

" " Настройки для ghc-mod
" hi ghcmodType ctermbg=yellow
" let g:ghcmod_type_highlight = 'ghcmodType'

" autocmd FileType haskell map <buffer> tw :GhcModTypeInsert<CR>
" autocmd FileType haskell map <buffer> tq :GhcModType<CR>
" autocmd FileType haskell map <buffer> te :GhcModTypeClear<CR>
" autocmd FileType haskell map <buffer> <S-k> :GhcModInfoPreview<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Настройки indentLine

" let g:indentLine_char = '┆'
let g:vim_json_syntax_conceal = 0
let g:indentLine_noConcealCursor=""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Настройки wildignore

set wildignore+=./node_modules/**

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Настройки для typescript

" let g:typescript_compiler_binary = 'tsc'
" let g:typescript_compiler_options = '--jsx react'
" let g:syntastic_typescript_tsc_fname = ''
" autocmd QuickFixCmdPost [^l]* nested cwindow
" autocmd QuickFixCmdPost    l* nested lwindow

" Настройки для syntastic
let g:syntastic_typescript_checkers = ['tslint']

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Настройки для purescript

" let g:psc_ide_syntastic_mode = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Настройки для python

" отключаем автокомплит по коду (у нас вместо него используется jedi-vim)
let g:pymode_rope = 0
let g:pymode_rope_completion = 0
let g:pymode_rope_complete_on_dot = 0

" документация
let g:pymode_doc = 0
let g:pymode_doc_key = 'K'

" проверка кода
let g:syntastic_ignore_files = ['\.py$']
let g:pymode_lint = 1
let g:pymode_lint_checker = "pyflakes,pep8,pylint"
let g:pymode_lint_ignore="E501,W601,C0110"
" провека кода после сохранения
let g:pymode_lint_write = 1

" поддержка virtualenv
let g:pymode_virtualenv = 1

" установка breakpoints
" let g:pymode_breakpoint = 1
" let g:pymode_breakpoint_key = '<leader>b'

" подстветка синтаксиса
let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
let g:pymode_syntax_space_errors = g:pymode_syntax_all

" отключить autofold по коду
let g:pymode_folding = 0

" возможность запускать код
let g:pymode_run = 0



