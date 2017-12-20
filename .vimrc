" .vimrc by Matt Ladany

" General settings
set number
set colorcolumn=80

" Color Settings
syntax enable

let g:solarized_termcolors=256
set background=dark
colorscheme hybrid "hybrid.vim colors
"colorscheme solarized "solarized.vim color

" Tabbular settings
set tabstop=4
set softtabstop=-1
set shiftwidth=4
set expandtab
set autoindent


" Statusline settings
set laststatus=2
set term=screen-256color

"##############################################################################
"################################  Mappings  ##################################
"##############################################################################

" Disabling the arrow keys
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

" Escape
inoremap jk <Esc>

" Visual from Insert mode
inoremap vv <Esc>v

" Comment/uncomment selected lines
vnoremap <silent> # :'<,'>norm i#<CR>
vnoremap <silent> -# :s/^#//<CR>:noh<CR>
vnoremap <silent> " :'<,'>norm i"<CR>
vnoremap <silent> -" :s/^"//<CR>:noh<CR>
vnoremap <silent> / :'<,'>norm i//<CR>

" Delete first or first two vals per-line in the selected text
vnoremap <silent> nx :'<,'>norm x<CR>
vnoremap <silent> nxx :'<,'>norm xx<CR>

" Function to move the cursor one character to the right, if the cursor
"   is on the last character of the line when entering Insert mode.
function! CheckLength(index)
    return strlen(getline('.'))-1 == a:index ? "i<Right>" : "i"
endf

" Insert
" TODO: get this to work
" noremap i :call CheckLength(col('.'))<C-M>

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

"Java
inoremap sout<CR> System.out.println();<Left><Left>

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

" Arrows <>
inoremap <          <><Left>
inoremap <expr> >   SkipClosing('>')

"TODO: single and double quotes

" Avoiding mis-typing :wq and :w
command! W w
command! Wq wq
command! WQ wq
command! WQ wq

" PlugInstall shortcut
command! PI PlugInstall

" NERDTree shortcut
command! NT NERDTree

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

Plug 'vim-airline/vim-airline' " statusline plugin
Plug 'vim-airline/vim-airline-themes' " statusline color themes
Plug 'Valloric/YouCompleteMe' " autocomplete plugin
Plug 'tpope/vim-fugitive' " git integration
Plug 'sickill/vim-pasta' " fixed indenting of copy/pasting
Plug 'tomasiser/vim-code-dark' " theme used for vim-airline
Plug 'scrooloose/nerdtree' " vim file explorer
"Plug 'edkolev/tmuxline.vim'
"Plug 'kien/rainbow-parentheses.vim'

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

" TODO: Changing the layout for section z of airline

" Setting the airline theme
let g:airline_theme = 'codedark'

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
