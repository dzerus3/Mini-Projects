"" This is my vimrc. It changes *very* many things, but here is a reference to some of the best features

""" This largely depends on having certain addons installed. 
""" First install pathogen. This is really easy, just find a tutorial online.
""" Then go into ~/.vim/bundle and git clone the following repositories:
"" Ale
" This lints code. I only use it for C/C++, but I think you can make it work with other languages as well.
" https://github.com/dense-analysis/ale.git
"
"" CtrlP
" This provides you with a fuzzy search menu to open new files from within vim. Bound to `Ctrl + f` because reaching for the p is too big an ordeal for me.
" https://github.com/ctrlpvim/ctrlp.vim.git
"
"" Supertab
" Binds autocomplete to `tab` and allows you to configure it.
" https://github.com/ervandew/supertab.git
"
"" Tagbar
" Gives you an overview of all C++ classes and functions in current file. Allows you to jump to them when selected in the window. Extremely useful when programming C++. It makes you install an extra program, directions will pop up in vim first time you start with it.
" https://github.com/majutsushi/tagbar
"
"" Autoclose
" Intelligently autocloses parentheses, brackets, quotes, etc.
" https://github.com/Townk/vim-autoclose.git
"
"" Commentary
" Allows you to quickly comment stuff out. I just use it for its `gc` command.
" https://github.com/tpope/vim-commentary.git
"
"" Dispatch
" Allows you to run make in a vim window. Extremely convenient.
" https://github.com/tpope/vim-dispatch.git
"
"" Fugitive
" Allows you to run Git commands in vim. Just type :Git and append with proper command line args.
" https://github.com/tpope/vim-fugitive.git
"
"" Surround
" Allows you to efficiently surround things with quotes, HTML tags, parentheses, etc. I never use it, but I guess it's nice to have if you ever get around to using it.
" https://github.com/tpope/vim-surround.git
"
"" WindowSwap
" Makes it really easy to move window layout around.
" https://github.com/wesQ3/vim-windowswap.git

"" Here are useful things you should always know about vim
" `i` goes into edit mode.
" `gi` starts edit mode on whichever spot you last entered it.
" `a` goes into edit mode, but moves your cursor forward by one character.
" `A` goes into edit mode, but moves your cursor to the end of the line.
" `new` splits window horizontally. `vert new` spreads it vertically.
" `m + any letter` saves that position. ' + same key returns to it.
" `gg` goes to beginning of first line. `G` goes to beginning of last line.
" `number + gg or G` goes to the line number.
" `w` goes to the next word. `b` goes to the previous word.
" `q + any letter` records whichever keys you type. Press `q` to stop recording, and `@ + letter` to repeat the keys.
" Vim regularly backs up whichever file you're working on, and it will prompt you whether to restore it upon crashing.
" `/` starts search mode. `n` goes to the next match. `Shift + n` goes to previous match.
" `:g` is like `/`, but instead of going to next match it just outputs a scrollable list of all matches.
" `/` and `:g` support regex.
" `:%s/text/othertext/` finds and replaces all occurences of text with othertext on current line.
" `:%s/text/othertext/g` finds and replaces all occurences of text with othertext.
" `:%s/text/othertext/gc` to make it prompt you before replacement.
" `:set number` enables line numbers. `:set nonumber` disables them.
" `H` goes to top of screen. `M` goes to middle of screen. `L` goes to bottom of screen.
" `:e` reloads file if it was changed externally.
" `number + direction key` move in direction by number rows/columns.

"" Visual mode
" `v` goes into visual mode. This selects text.
" `Shift + v` selects entire lines.
" `Ctrl + v` selects block of text.
" `y` in visual mode copies text. `d` deletes it and copies it. `p` pastes it in.

"" Here are existing things this just enables
" Syntax highlighting is on.
" Line numbers are enabled.
" `y`anking in one vim window now carries over to other windows.
" On exit, vim saves where you were in the file and comes back there when you open it again.
" Vim now scrolls down as long as you are within 7 rows of the bottom of the screen.
" Tab length is set to 4.
" You can undo things even after closing file. I think anyway.

"" Here are useful things related to deleting text
"" Keep in mind that most things using the `d` key copy what you deleted. See next section to see my fix for this.
" `w` and `b` can be prepended by `d` to delete this or previous word. Make sure to read more about this.
" `D` deletes everything from cursor until the end of the line.
" `x` deletes letter under cursor. `X` deletes the previous letter.
" `r + character` replaces whichever character your cursor is over with whichever character you type.
" `R` stars replace mode.

"" Here are things that were added within the vimrc.
" Leader key is bound to `,`.
" `:W` now goes into sudo and saves your file. Good if you edit /etc but forget to prepend sudo to the command.
" `Ctrl + d` deletes entire line without copying it.
" `Ctrl + d` in visual mode now deletes selection without copying.
" `Ctrl + a` is an alias for `^` (goes to first non-whitespace character on line).
" `Ctrl + e` is an alias for `$` (goes to last non-whitespace character on line).
" `Ctrl + j` makes everything past cursor a new line.
" I set `o` and `O` to do their thing, without going into edit mode.
" `Ctrl + h` and `Ctrl + Backspace` toggles hexadecimal mode. It gives an error, but I think it is safe to ignore.
" Custom status line.
" `z` searches for selected text.

"" Here are things related to tabs and windows. Very important to remember these.
" `Ctrl + n` open a new tab.
" `Ctrl + left/right arrow key` switches to the next tab in that direction.
" `Alt + arrow key` moves your cursor to the window which is in that direction.
" `Ctrl + w + number + < or >` increases or decreases window size by number characters.

"" Here are things related to installed addons
" Parentheses and brackets will intelligently autoclose.
" `Ctrl + x` opens up an overview of all C++ functions and classes in current file.
" `:Z` toggles preventing the overview from changing when you move to a different window.
" `:Make` or `:m` calls make without exiting vim.
" `:Git` allows you to run any commands of Git without exiting vim.
" `Tab` while on an unfinished line of code attempts to do autocompletion. When the suggestions pop up, press `Tab` again to scroll through them and `Shift + Tab` to scroll backward.
" `Ctrl + f` opens up a window which allows you to fuzzy search for files. 
" `Ctrl + y` while in Ctrl + f mode creates the file with the name you typed in.
" `gc` while selecting something comments out all selected lines. Works across just about all languages.
" `,a` goes to the next ALE error.
" `Leader ww` selects a window. Switching to another window and doing `Leader ww` again swaps the windows places

" Starts pathogen
execute pathogen#infect()

" Syntax highlighting
syntax on

" Set line numbers
set number

" :W saves with sudo
command W w !sudo tee "%" > /dev/null

" Yanking between windows
set clipboard=unnamed

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Sets how many lines of history VIM has to remember
set history=500

" Enable filetype plugins
filetype plugin on
filetype indent on

" Set to auto read when a file is changed from the outside
set autoread
au FocusGained,BufEnter * checktime

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","

" Remembers last position
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" Fast saving
nmap <leader>w :w!<cr>

" Run make and save output
" nmap <C-S> :make | copen<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set 7 lines to the cursor - when moving vertically using j/k
set so=7

" Avoid garbled characters in Chinese language windows OS
let $LANG='en' 
set langmenu=en
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim

" Turn on the Wild menu
set wildmenu

" Ignore compiled files
set wildignore=*.o,*~,*.pyc
if has("win16") || has("win32")
    set wildignore+=.git\*,.hg\*,.svn\* else
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
endif

"Always show current position
set ruler

" Height of the command bar
set cmdheight=1

" A buffer becomes hidden when it is abandoned
set hid

" Configure backspace so it acts as it should act
set backspace=eol,start,indent

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases 
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch 

" Don't redraw while executing macros (good performance config)
set lazyredraw 

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch 
" How many tenths of a second to blink when matching brackets
set mat=2

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Enable syntax highlighting
syntax enable 

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
" set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 4 spaces
set shiftwidth=2
set tabstop=2

" Linebreak on 500 characters
set lbr
set tw=500

set ai "Auto indent"
set si "Smart indent"
set wrap "Wrap lines"

""""""""""""""""""""""""""""""
" => Visual mode related
""""""""""""""""""""""""""""""
" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
vnoremap <silent> z :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>

""""""""""""""""""""""""""""""
" => Status line
""""""""""""""""""""""""""""""
" Always show the status line
set laststatus=2

function! WindowNumber()
    let str=tabpagewinnr(tabpagenr())
    return str
endfunction

" Format the status line
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ Win:%{WindowNumber()}\ \ \ Line:\ %l\ \ Column:\ %c

let i = 1
while i <= 9
    execute 'nnoremap <leader>' . i . ' :' . i . 'wincmd w<CR>'
    let i = i + 1
endwhile

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Editing mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remap VIM 0 to first non-blank character
map 0 ^


" Better tab management
map <C-Left> <Esc>:tabprev<CR>
map <C-Right> <Esc>:tabnext<CR>
map <C-n> <Esc>:tabnew<CR>

" Ctrl-A/E for beginning/end of line
map <C-A> ^
nnoremap <silent> <C-E> $
vnoremap <silent> <C-E> $

" Ctrl-D to delete line without copying it
nnoremap <silent> <C-D> "_dd
vnoremap <silent> <C-D> "_dd
vmap <silent> <C-D> "_d

" Ctrl-J makes everything past cursor new line
nnoremap <C-J> a<CR><Esc>k$

" Creating newline without insert mode
nnoremap o o<Esc>
nnoremap O O<Esc>

nmap <M-j> mz:m+<cr>`z
nmap <M-k> mz:m-2<cr>`z
vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z

" Delete trailing white space on save, useful for some filetypes ;)
fun! CleanExtraSpaces()
    let save_cursor = getpos(".")
    let old_query = getreg('/')
    silent! %s/\s\+$//e
    call setpos('.', save_cursor)
    call setreg('/', old_query)
endfun

if has("autocmd")
    autocmd BufWritePre *.txt,*.js,*.py,*.wiki,*.sh,*.coffee :call CleanExtraSpaces()
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Turn persistent undo on 
"    means that you can undo even when you close a buffer/VIM
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
try
    set undodir=~/.vim_runtime/temp_dirs/undodir
    set undofile
catch
endtry

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Helper functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    endif
    return ''
endfunction

""""""""""""""""""""""""""""""
" => Python section
""""""""""""""""""""""""""""""
let python_highlight_all = 1
au FileType python syn keyword pythonDecorator True None False self

au BufNewFile,BufRead *.jinja set syntax=htmljinja
au BufNewFile,BufRead *.mako set ft=mako

au FileType python map <buffer> F :set foldmethod=indent<cr>

au FileType python inoremap <buffer> $r return 
au FileType python inoremap <buffer> $i import 
au FileType python inoremap <buffer> $p print 
au FileType python inoremap <buffer> $f # --- <esc>a
au FileType python map <buffer> <leader>1 /class 
au FileType python map <buffer> <leader>2 /def 
au FileType python map <buffer> <leader>C ?class 
au FileType python map <buffer> <leader>D ?def 

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => GUI related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set font according to system
if has("mac") || has("macunix")
    set gfn=IBM\ Plex\ Mono:h14,Hack:h14,Source\ Code\ Pro:h15,Menlo:h15
elseif has("win16") || has("win32")
    set gfn=IBM\ Plex\ Mono:h14,Source\ Code\ Pro:h12,Bitstream\ Vera\ Sans\ Mono:h11
elseif has("gui_gtk2")
    set gfn=IBM\ Plex\ Mono\ 14,:Hack\ 14,Source\ Code\ Pro\ 12,Bitstream\ Vera\ Sans\ Mono\ 11
elseif has("linux")
    set gfn=IBM\ Plex\ Mono\ 14,:Hack\ 14,Source\ Code\ Pro\ 12,Bitstream\ Vera\ Sans\ Mono\ 11
elseif has("unix")
    set gfn=Monospace\ 11
endif

" Disable scrollbars (real hackers don't use scrollbars for navigation!)
set guioptions-=r
set guioptions-=R
set guioptions-=l
set guioptions-=L

" Colorscheme
set background=dark
colorscheme torte

set ts=4 sw=4 et
let g:indent_guides_start_level=2
let g:indent_guides_size = 1

let g:indent_guides_enable_on_vim_startup = 1

" Tagbar options
nmap <C-X> :TagbarToggle<CR>
cnoreabbrev Z TagbarTogglePause

" Don't force me to capitalize make command
cnoreabbrev m Make

" Easy window switching
nmap <silent> <A-Up> :wincmd k<CR>
nmap <silent> <A-Down> :wincmd j<CR>
nmap <silent> <A-Left> :wincmd h<CR>
nmap <silent> <A-Right> :wincmd l<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Ale (syntax checker and linter)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ale_linters = {
\   'javascript': ['jshint'],
\   'python': ['flake8'],
\   'go': ['go', 'golint', 'errcheck']
\}

nmap <silent> <leader>a <Plug>(ale_next_wrap)

" Disabling highlighting
let g:ale_set_highlights = 0

" Only run linting when saving the file
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_enter = 0

let g:ale_cpp_clang_options = '-std=c++17 -Wall'
let g:ale_cpp_gcc_options = '-std=c++17 -Wall'

let g:clang_library_path='/usr/lib/llvm-9/lib/'

""""""""""""""""""""""""""""""
" => CTRL-P
""""""""""""""""""""""""""""""
let g:ctrlp_working_path_mode = 0

let g:ctrlp_map = '<C-f>'
map <leader>j :CtrlP<cr>
map <C-b> :CtrlPBuffer<cr>

let g:ctrlp_max_height = 20
let g:ctrlp_custom_ignore = 'node_modules\|^\.DS_Store\|^\.git\|^\.coffee'


" Hexadecimal mode
nnoremap <C-H> :Hexmode<CR>
inoremap <C-H> <Esc>:Hexmode<CR>
vnoremap <C-H> :<C-U>Hexmode<CR>

command -bar Hexmode call ToggleHex()

" helper function to toggle hex mode
function ToggleHex()
  " hex mode should be considered a read-only operation
  " save values for modified and read-only for restoration later,
  " and clear the read-only flag for now
  let l:modified=&mod
  let l:oldreadonly=&readonly
  let &readonly=0
  let l:oldmodifiable=&modifiable
  let &modifiable=1
  if !exists("b:editHex") || !b:editHex
    " save old options
    let b:oldft=&ft
    let b:oldbin=&bin
    " set new options
    setlocal binary " make sure it overrides any textwidth, etc.
    silent :e " this will reload the file without trickeries
              "(DOS line endings will be shown entirely )
    let &ft="xxd"
    " set status
    let b:editHex=1
    " switch to hex editor
    %!xxd
  else
    " restore old options
    let &ft=b:oldft
    if !b:oldbin
      setlocal nobinary
    endif
    " set status
    let b:editHex=0
    " return to normal editing
    %!xxd -r
  endif
  " restore values for modified and read only state
  let &mod=l:modified
  let &readonly=l:oldreadonly
  let &modifiable=l:oldmodifiable
endfunction

function! VisualSelection(direction, extra_filter) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", "\\/.*'$^~[]")
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'gv'
        call CmdLine("Ack '" . l:pattern . "' " )
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction
