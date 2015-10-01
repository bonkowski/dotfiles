set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
Plugin 'gmarik/Vundle.vim'

Bundle 'pyp/vim-sparkup'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-surround'

" Clojure stuff
Bundle 'tpope/vim-classpath'  
Bundle 'guns/vim-clojure-static'  
Bundle 'kien/rainbow_parentheses.vim'  
Bundle 'tpope/vim-fireplace' 
Bundle 'vim-scripts/paredit.vim'

Plugin 'fatih/vim-go'
Plugin 'elzr/vim-json'
Bundle 'kien/ctrlp.vim'
Bundle 'tpope/vim-commentary'
Plugin 'scrooloose/nerdtree'
Plugin 'NLKNguyen/papercolor-theme'
Plugin 'elmcast/elm-vim'

"Status bar
Bundle 'bling/vim-airline'

" Snippets
"Plugin 'SirVer/ultisnips'
"Plugin 'honza/vim-snippets'

Bundle 'sjl/gundo.vim'

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
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
let mapleader = ","
" Gundo oppsett
" Vil ha den på høyre side
let g:gundo_right = 1
nnoremap <F5> :GundoToggle<CR>


" Dersom man kjører vim i iTerm2, så husk å bruke en Powerlinemodifisert font
" både som vanlig og non-ascii font for å få pene statuslinjer.
"
let g:airline_powerline_fonts = 1
"set showmode " Show current mode in the status line.
"set showcmd " Show the command in the status line.
set guifont=Meslo\ LG\ S\ DZ\ for\ Powerline:h12

syntax enable
set background=dark
colorscheme PaperColor

let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"


map <C-n> :NERDTreeToggle<CR>

" Enable rainbow parentheses for all buffers
augroup rainbow_parentheses
  au!
  au VimEnter * RainbowParenthesesActivate
  au BufEnter * RainbowParenthesesLoadRound
  au BufEnter * RainbowParenthesesLoadSquare
  au BufEnter * RainbowParenthesesLoadBraces
augroup END

let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

" Krever TComment
map <leader>/ <c-_><c-_>
nmap <space> :

nnoremap <esc> :noh<return><esc>

set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set encoding=utf-8
set laststatus=2
set number
set relativenumber
set completeopt=menuone,longest,preview
set splitbelow
set autoindent
set hls
set showmatch
set listchars=tab:→\ ,trail:·
set list
set showbreak=↪
set noshowmode
set showcmd
set hidden
set wildmenu
set wildmode=list:longest
set visualbell
set cursorline
set ttyfast
set ruler
set backspace=indent,eol,start
set history=1000
set cursorline
set scrolloff=3
set undofile
set undodir=~/.vim/tmp
set clipboard=unnamed
set mouse=a

let g:go_fmt_command = "goimports"

" Simuler TextMate indentation 
nmap <D-[> <<
nmap <D-]> >>
vmap <D-[> <gv
vmap <D-]> >gv

" Tips fra Gary Bernhard via http://vimcasts.org/episodes/the-edit-command/
cnoremap %% <C-R>=fnameescape(expand('%:h')).'/'<cr>
map <leader>ew :e %%
map <leader>es :sp %%
map <leader>ev :vsp %%
map <leader>et :tabe %%

" Flytte mellom split views
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Documentation Settings
" ----------------------
" ,m - view docs for a function
nmap <buffer> ,m <Plug>FireplaceK
" ,M - view source of function
nmap <buffer> ,M <Plug>FireplaceSource

" Eval Settings
" ----------------------
" ,ee - evaluate whole file
nmap <buffer> ,ee :%Eval<CR>
" ,ef - evaluates top level form
nmap <buffer> ,ef :Eval<CR>
" ,el - evaluates local form (nested part of function)
exe 'nmap <buffer> ,el <Plug>FireplaceEditab' . &cedit . 'i<CR>'
" ,tt - run clojure test
nmap <buffer> ,tt :Eval (clojure.test/run-tests)<CR>

" 'Require' Settings
" ----------------------
" ,rr -  require, reload
nmap <buffer> ,rr :Require<CR>
" ,R  -  require, reload-all
nmap <buffer> ,R :Require!<CR>

" Quasi-REPL Settings
" ----------------------
" ,qr - one-line repl (to quickly evaluate an expression)
nmap <buffer> ,qr <Plug>FireplacePrompt
" ,Q ten-line repl (to see previously evaluated expressions)
exe 'nmap <buffer> ,Q <Plug>FireplacePrompt' . &cedit . 'i'

" Søk etter ord under cursor
map <F4> :execute "vimgrep /" . expand("<cword>") . "/j **" <Bar> cw<CR>
nmap <Leader><Leader> V




au FileType elm nmap <leader>b <Plug>(elm-make)
au FileType elm nmap <leader>m <Plug>(elm-make-main)
au FileType elm nmap <leader>t <Plug>(elm-test)
au FileType elm nmap <leader>r <Plug>(elm-repl)
au FileType elm nmap <leader>e <Plug>(elm-error-detail)
au FileType elm nmap <leader>d <Plug>(elm-show-docs)
au FileType elm nmap <leader>w <Plug>(elm-browse-docs)
