"autocmd vimenter * NERDTree

"set shell=sh

let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_symbols.space = "\ua0"
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 0
let g:airline_theme = 'dark'

let g:airline#extensions#hunks#enabled=0
let g:airline#extensions#branch#enabled=1

let NERDTreeShowHidden=1
let NERDTreeQuitOnOpen=1

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Enable filetype plugins
filetype plugin on
filetype indent on

set nocompatible " not compatible with vi
set autoread " detect when a file is changed

" make backspace behave in a sane manner
set backspace=indent,eol,start

" Set a map leader for more key combos
" let mapleader = ','

" Turn Off Swap Files
set noswapfile
set nobackup
set nowb
set noshowmode

" Encoding
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8
set bomb
set binary
set fileformats=unix
set t_Co=256

" General Config
set exrc " open .vimrc from current folder
set guicursor= " set cursor as block
set nowrap " do not wrap the test
set signcolumn=yes " always show extra column to the left for linting etc
set title
"set number
set rnu
set history=1000
set showcmd
set showmode
set gcr=a:blinkon0
set hidden
set linespace=0
set showmatch
set winminheight=0
set wildmenu
set wildmode=list:longest,full
set whichwrap=b,s,h,l,<,>,[,]
set clipboard^=unnamed,unnamedplus

" For regular expressions turn magic on
set magic

" Scrolling
set scrolljump=5
set scrolloff=5
set sidescrolloff=15
set sidescroll=1

" Ccode folding settings
set foldmethod=syntax " fold based on indent
"set foldmethod=indent
set foldnestmax=10 " deepest fold is 10 levels
set nofoldenable " don't fold by default
"set foldenable
set foldlevel=1
set foldcolumn=1

" Always wrap long lines
set wrap
set linebreak

" Tab control
set noexpandtab " tabs ftw
set smarttab " tab respects 'tabstop', 'shiftwidth', and 'softtabstop'
set tabstop=4 " the visible width of tabs
set softtabstop=4 " edit as if the tabs are 4 characters wide
set shiftwidth=4 " number of spaces to use for indent and unindent
set shiftround " round indent to a multiple of 'shiftwidth'
set expandtab

set clipboard=unnamed

" faster redrawing
set ttyfast

" Display tabs and trailing spaces visually
"set list listchars=tab:\ \ ,trail:

" Status bar
set laststatus=2

" Visual Settings
set background=dark
syntax on
syntax enable
autocmd BufEnter * :syntax sync fromstart
autocmd BufEnter * :set number
set ruler
set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%)
set showcmd
set visualbell
set noerrorbells
set printoptions=paper:letter
set spelllang=en_us
set cursorline

" Highlite color number lign color
highlight CursorLine cterm=NONE ctermbg=NONE ctermfg=NONE guibg=NONE guifg=NONE
" DarkGray number line
highlight LineNr term=bold cterm=NONE ctermfg=DarkGray ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE

" Splilt windows botoom and right
set splitbelow
set splitright

" Mouse work
set mouse+=a
set mousehide
set showmode

" Indentation
set autoindent
set smartindent

" Persistent Undo
if has('persistent_undo') && !isdirectory(expand('~').'/.vim/backups')
    silent !mkdir ~/.vim/backups > /dev/null 2>&1
    set undodir=~/.vim/backups
    set undofile
endif

" Git undotree
nnoremap <F5> :UndotreeToggle<CR>

" Searching
 set ignorecase " case insensitive searching
 set smartcase " case-sensitive if expresson contains a capital letter
 set hlsearch
 set incsearch " set incremental search, like modern browsers
 set nolazyredraw " don't redraw while executing macros
 set nohlsearch " do not highlight search
 
" Fast saving
"nmap <leader>w :w!<cr>

" :W sudo saves the file
command W w !sudo tee % > /dev/null
noremap <Leader>W :w !sudo tee % > /dev/null
" cmap w!! w !sudo tee > /dev/null %

" Coc-prettier setup
" vmap <leader>f  <Plug>(coc-format-selected)
" nmap <leader>f  <Plug>(coc-format-selected)

" Key Bindings
nmap <C-n> :NERDTreeToggle<CR>

" Split
noremap <Leader>h :<C-u>split<CR>
noremap <Leader>v :<C-u>vsplit<CR>

" Buffer nav
noremap <leader>z :bp<CR>
noremap <leader>q :bn<CR>
noremap <leader>a :ls<CR>
noremap <leader>c :bd<CR>

" Useful mappings for managing tabs
map <leader>tn :tabnew<CR>
map <leader>to :tabonly<CR>
map <leader>tc :tabclose<CR>
map <leader>tm :tabmove<CR>
map <leader>t :tabnext<CR>

" Close buffer
"noremap <leader>c :bd<CR>
noremap <leader>z :bd<CR>

" Fix indentation in file
map <leader>i mmgg=G`m<CR>

" Toggle highlighting of search results
nnoremap <leader><space> :nohlsearch<cr>

" Toggle paste mode on and off
map <leader>pp :setlocal paste!<cr>

" Configure spell checking
nmap <silent> <leader>p :set spell!<CR>

" Quick timeouts on key combinations.
" Auto indent pasted text
" nnoremap p p=`]<C-o>
" nnoremap P P=`]<C-o>

" comments the line
"vnoremap <C-b> :norm

set timeoutlen=300

" Completion
set wildmode=list:longest
set wildmenu
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
set wildignore=*.o,*.obj,*~
set wildignore+=*vim/backups*
set wildignore+=*sass-cache*
set wildignore+=*DS_Store*
set wildignore+=vendor/rails/**"i"
set wildignore+=vendor/cache/**
set wildignore+=*.gem
set wildignore+=log/**
set wildignore+=tmp/**
set wildignore+=*.png,*.jpg,*.gif

" Fugitive Git vew map
nmap <leader>gs :G<CR>
nmap <leader>gh :diffget //3<CR>
nmap <leader>gu :diffget //2<CR>

" Custom Settings
function! s:DiffWithSaved()
    let filetype=&ft
    diffthis
    vnew | r # | normal! 1Gdd
    diffthis
    exe "setlocal bt=nofile bh=wipe nobl noswf ro ft=" . filetype
endfunction
com! Diffs call s:DiffWithSaved()

fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun

augroup THE_PRIMEAGEN
    autocmd!
    autocmd BufWritePre * :call TrimWhitespace()
    "autocmd BufEnter,BufWinEnter,TabEnter *.rs :lua require'lsp_extensions'.inlay_hints{}
augroup END
