" .vimrc by Matt Ladany

" General settings
set number
set colorcolumn=80
set visualbell

" Color Settings
syntax enable
set term=screen-256color
let g:hybrid_custom_term_colors=256
set background=dark
colorscheme hybrid "hybrid.vim colors
"colorscheme solarized "solarized.vim colors

" Default tabbular settings
set tabstop=4
set softtabstop=-1
set shiftwidth=4
set expandtab
set autoindent

" Search settings
set smartcase
set hlsearch
hi search cterm=NONE ctermfg=black ctermbg=LightGreen

" Statusline settings
set laststatus=2

"##############################################################################
"################################  Mappings  ##################################
"##############################################################################

" Disabling the arrow keys when not in Insert mode
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

" Escape
inoremap jk <Esc>

" Visual from Insert mode
inoremap vv <Esc>v

"***** Comment/uncomment selected lines *****

" Ruby, Bash, etc. comments (#)
vnoremap <silent> #   :'<,'>norm i#<CR>
vnoremap <silent> -#  :s/^#//<CR>:noh<CR>

" Vim comments (")
vnoremap <silent> "   :'<,'>norm i"<CR>
vnoremap <silent> -"  :s/^"//<CR>:noh<CR>

" Haskell comments (--)
vnoremap <silent> --  :'<,'>norm i--<CR>
vnoremap <silent> --- :s/^--//<CR>:noh<CR>

" Java, C, C++, etc. comments (//)
vnoremap <silent> /   :'<,'>norm i//<CR>
"vnoremap <silent> -/ :s/^////<CR>:noh<CR> "TODO: get remove // to work

" Delete first or first two vals per-line in the selected text
vnoremap <silent> nx :'<,'>norm x<CR>
vnoremap <silent> nxx :'<,'>norm xx<CR>

" Turning off the highlighted text
nnoremap <C-h> :nohl<CR>

" Searching
inoremap <C-f> <Esc>/
noremap <C-f> <Esc>/

" Saving/quiting in insert
inoremap <C-S> <Esc>:w<CR>i
inoremap <C-Q> <Esc>:q

" Mapping normal mode half-page up and down to insert mode
inoremap <C-D> <Esc><C-D>i
inoremap <C-U> <Esc><C-U>i

"********** Intellij conveniences **********

" Tabbing and Entering
inoremap <S-Tab> <C-D>
inoremap <C-O> <End><C-M>

" ********** Enclosing characters **********
" TODO: when there's only (), <>, etc., and you backspace (, delete both.

" Function to be called when entering closing characters
function! SkipClosing(char)
    return strpart(getline('.'), col('.')-1, 1) == a:char ? "\<Right>" : a:char
endf
" Semicolons ;
inoremap <expr> ;   SkipClosing(';')

" Braces {}
inoremap {          {}<Left>
inoremap <expr> }   SkipClosing('}')
inoremap {<CR>      {<CR>}<Esc>O<Tab>
inoremap {{         {
inoremap {}         {}

" Parentheses ()
inoremap (          ()<Left>
inoremap <expr> )   SkipClosing(')')

" Brackets []
inoremap [          []<Left>
inoremap <expr> ]   SkipClosing(']')

"TODO: single and double quotes
inoremap '          ''<Left>
inoremap <expr> '   SkipClosing('\'')

inoremap "          ""<Left>
inoremap <expr> "   SkipClosing('"')


" Avoiding mis-typing :wq and :w
command! W w
command! Wq wq
command! WQ wq
command! WQ wq

"##############################################################################
"#################################  Plugins  ##################################
"##############################################################################

" Installing vim-plug if it is not already installed.
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

Plug 'vim-airline/vim-airline' " statusline
Plug 'vim-airline/vim-airline-themes' " statusline color themes
Plug 'Valloric/YouCompleteMe' " autocomplete
Plug 'tpope/vim-fugitive' " git integration
Plug 'sickill/vim-pasta' " fixed indenting of copy/pasting
Plug 'tomasiser/vim-code-dark' " theme used for vim-airline
Plug 'scrooloose/nerdtree' " vim file explorer
Plug 'tpope/vim-obsession' " saving sessions through restart
Plug 'vim-syntastic/syntastic' " static syntax checking
Plug 'neovimhaskell/haskell-vim' " haskell vim settings
Plug 'vim-scripts/calendar.vim--Matsumoto' " open a vim calendar
Plug 'ctrlpvim/ctrlp.vim'

call plug#end()

" Getting old vim-powerline symbols
let g:airline_symbols = {}
let g:airline_left_sep = '⮀'
let g:airline_left_alt_sep = '⮁'
let g:airline_right_sep = '⮂'
let g:airline_right_alt_sep = '⮃'
let g:airline_symbols.branch = '⭠'
let g:airline_symbols.readonly = '⭤'
let g:airline_symbols.linenr = '⭡'

" Airline settings
" TODO: Changing the layout for section z of airline
let g_airline_section_x = "%{ObsessionStatus()}"
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme = 'codedark' " theme
let g:bufferline_echo = 1

" Syntastic settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Ctrlp settings
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_user_command = 'find %s -type f'

" PlugInstall shortcut
command! PI PlugInstall

" NERDTree shortcut
command! NT NERDTree

" Calendar shortcut
command! C Calendar

"##############################################################################
"#####################  Setting up persistant undo/redo  ######################
"##############################################################################

" Taken from github.com/folksgl/.dotfiles.git repository
let vimDir = '$HOME/.vim'
let &runtimepath.=','.vimDir
if has('persistent_undo')
    let myUndoDir = expand(vimDir . '/undodir')
    " Create dirs
    call system('mkdir ' . vimDir)
    call system('mkdir ' . myUndoDir)
    let &undodir = myUndoDir
    set undofile
endif

"##############################################################################
"########################### File-specific options  ###########################
"##############################################################################

if has("autocmd")

    " Put these in an autocmd group, so that we can delete them easily.
    augroup vimrcEx
    au!

    autocmd FileType text       call SetTextOptions()
    autocmd FileType java       call SetJavaOptions()
    autocmd FileType c,cpp      call SetCandCPPOptions()
    autocmd FileType ruby       call SetRubyOptions()
    autocmd FileType html       call SetHTMLOptions()
    autocmd FileType haskell    call SetHaskellOptions()
    augroup END

endif " has("autocmd")

function SetRubyOptions()
    setlocal sw=2 ts=2
endf

function SetHTMLOptions()
    setlocal sw=2 ts=2
    inoremap < <><Left>
    inoremap <expr> > SkipClosing('>')
endf

function SetTextOptions()
    setlocal sw=2 ts=2
endf

function SetJavaOptions()
    setlocal sw=4 ts=4
    inoremap sout<CR> System.out.println();<Left><Left>
endf

function SetCandCPPOptions()
    setlocal sw=2 ts=2
endf

function SetHaskellOptions()
    setlocal sw=2 ts=2
endf
