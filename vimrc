set shell=/bin/zsh

set nocompatible
filetype off


"""" PLUGINS
set rtp+=~/.vim/bundle/Vundle.vim
set rtp+=/usr/local/opt/fzf

call vundle#begin()
  Plugin 'VundleVim/Vundle.vim'                       " best plugin manager

  """ Programming languages support
  Plugin 'vim-ruby/vim-ruby'                          " better ruby support
  Plugin 'pangloss/vim-javascript'                    " better js support

  """ Better productivity
  Plugin 'godlygeek/tabular'                          " aligning assignments
  Plugin 'tpope/vim-endwise'                          " smart do end blocks in ruby
  Plugin 'alvan/vim-closetag'                         " closing html tags
  Plugin 'jiangmiao/auto-pairs'                       " inserting brackets in pairs
  Plugin 'rhysd/clever-f.vim'                         " extended f, F, t and T key mapping

  """ Vim as IDE
  Plugin 'mileszs/ack.vim'                            " integration with ack searching(better grep in vim)
  Plugin 'ervandew/supertab'                          " tab completion in insert mode
  Plugin 'scrooloose/nerdtree'                        " file tree
  Plugin 'kshenoy/vim-signature'                      " showing marks next to line number
  Plugin 'rhysd/reply.vim'                            " REPL inside vim
  """" Plugin 'w0rp/ale'                              " asynchronous linting

  """ Prettier Vim
  Plugin 'nathanaelkane/vim-indent-guides'            " coloring indentations
  Plugin 'vim-airline/vim-airline'                    " airline statusline
  Plugin 'vim-airline/vim-airline-themes'             " themes for airline statusline
  Plugin 'cocopon/iceberg.vim'                        " iceberg colorscheme

  """ Other
  Plugin 'mechatroner/rainbow_csv'                    " betters colors and queries for .csv files
  Plugin 'mhinz/vim-startify'                         " custom start screen
call vundle#end()

syntax on
filetype plugin indent on


set encoding=utf-8                                    " set encoding to UTF-8
set mouse=a                                           " enable mouse

set number                                            " show line number
set relativenumber                                    " relative line numbering for lines other than current
set cursorline                                        " highlight current line
set colorcolumn=120                                   " highlight 120. column
set showmatch                                         " highlight matching parentheses / brackets [{()}]
set lazyredraw                                        " redraw screen only when we need to
set showcmd                                           " show typed keys
set visualbell                                        " blink cursor on error, instead of beeping

set incsearch                                         " search as characters are entered
set hlsearch                                          " highlight matches

set tabstop=2                                         " number of spaces per <TAB>
set expandtab                                         " convert <TAB> key-presses to spaces
set shiftwidth=2                                      " set a <TAB> key-press equal to 4 spaces

set autoindent                                        " copy indent from current line when starting a new line
set smartindent                                       " even better autoindent (e.g. add indent after '{')'}')

set background=dark                                   " configure Vim to use brighter colors
set autoread                                          " autoreload the file in Vim if it has been changed outside of Vim

set splitright                                        " :vs opens new buffer at right
set splitbelow                                        " :sp opens new buffer below

set swapfile
set dir=/tmp                                          " write swp files to /tmp instead of current directory"

set backspace=indent,eol,start
set term=screen-256color

set clipboard=unnamed

if has('unnamedplus')
    set clipboard=unnamed,unnamedplus
endif

" move vertically by visual line (don't skip wrapped lines)
nmap j gj
nmap k gk

let mapleader = ","                                   " , as leader
nmap <Leader>w <ESC>:w<CR>|                           " <Leader>w for file save

""" Colors
silent! colorscheme iceberg                           " other colorschemes: monochrome monokai ubloh railscasts
                                                      " when colorscheme is missing error is silent

""" NERDTree
nmap <F2> :NERDTreeToggle<CR>|                        " F2 shortcut for NERDTree

let NERDTreeShowHidden=1                              " show hidden files in NERDTree
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let g:NERDTreeNodeDelimiter = "\u00a0"
let NERDTreeQuitOnOpen = 1                            " quit nerdtree when opening file
let NERDTreeAutoDeleteBuffer = 1                      " remove buffer with deleted file automaticly

""" vim-indent-guides
let indent_guides_auto_colors=0
let indent_guides_guide_size=1
hi IndentGuidesOdd ctermbg=236
hi IndentGuidesEven ctermbg=237
let g:indent_guides_enable_on_vim_startup=1           " enable indent guides on startup

""" vim-airline
let g:airline#extensions#tabline#enabled=1
let g:airline_theme='iceberg'
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'

""" vim-closetag
let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.erb'
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx,*.js'
let g:closetag_filetypes = 'html,xhtml,phtml'
let g:closetag_xhtml_filetypes = 'xhtml,jsx'
let g:closetag_emptyTags_caseSensitive = 1
let g:closetag_shortcut = '>'
let g:closetag_close_shortcut = '<leader>>'

""" fzf
nmap <c-p> :FZF<CR>|                                  " ctrl-p shortcut for fzf

""" ack.vim
nmap <Leader>a :Ack<Space>|                          " <Leader>a shortcut for ack
let g:ackprg = 'ag --nogroup --nocolor --column'     " use silver searcher instead of ack

""" reply.vim
nmap <Leader>rp :Repl<CR>|                            " Open REPL
nmap <Leader>rs :ReplSend<CR>|                        " Send code to REPL
nmap <Leader>t :vert term<CR>|                        " Opens vertical terminal

""" rainbow_csv
let g:rcsv_colorpairs = [['red', 'red'], ['blue', 'blue'], ['green', 'green'], ['magenta', 'magenta'], ['NONE', 'NONE'], ['darkred', 'darkred'], ['darkblue', 'darkblue'], ['darkgreen', 'darkgreen'], ['darkmagenta', 'darkmagenta'], ['darkcyan', 'darkcyan']] " colors for csv file columns

""" buffers
nmap <Leader>n :bn<CR>|                               " <Leader>n shortcut for next buffer
nmap <Leader>p :bp<CR>|                               " <Leader>p shortcut for previous buffer
nmap <Leader>d :bd<CR>|                               " <Leader>d shortcut for delete buffer

command! BufOnly silent! execute "%bd|e#|bd#"
nmap <Leader>e :BufOnly<CR>                           " <Leader>e shorcut for closing all buffers but current one

""" trimming whitespaces
fun! TrimWhitespace()
  let l:save = winsaveview()
  %s/\s\+$//e
  call winrestview(l:save)
endfun

autocmd BufWritePre * :call TrimWhitespace()          " trimming whitespaces on save

""" paste/nopaste
set pastetoggle=<F3>                                  " paste/nopaste mode shortcut
