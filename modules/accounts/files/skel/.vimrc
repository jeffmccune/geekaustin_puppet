" Jeff McCune's vimrc
" mccune.jeff@gmail.com
" 0xEFF on Twitter

" Swap dir for all so we don't litter
set directory=~/.vimswp

set nocompatible

" SnipMate plugin
filetype plugin on

" Find File plugin, quickly find a file
" FC .<CR> (Cache the directory)
" FF<CR> (Find File)
let g:FindFileIgnore = ['*.o', '*.pyc', '*/tmp/*', '*/.git/*']

" Add documentation for project plugin
helptags ~/.vim/doc

" Shift movement and selection Mac behavior.  Less vim like.
if has("gui_macvim")
  let macvim_hig_shift_movement = 1
endif

" Filetype plugin and stuff
filetype plugin on
filetype indent on

if has("gui_running")
  "Set the font and size
  set guifont=Consolas:h18
  " Hide toolbar
  set guioptions-=T
endif

" Turn on spell checking with English dictionary
set nospell
set spelllang=en
set spellsuggest=9 "show only 9 suggestions for misspelled words
" Selectively turn spelling off.
autocmd FileType c,cpp,lisp,puppet,ruby,vim setlocal nospell

set bs=2 "set backspace to be able to delete previous characters
" set wrapmargin (Generally unrecommended)
" set wm=4

" Turn on smart indent
set tabstop=2 "set tab character to 4 characters
set softtabstop=2
set expandtab "turn tabs into whitespace
set shiftwidth=2 "indent width for autoindent
" filetype indent on "indent depends on filetype
set smartindent

" Enable line numbering, taking up 6 spaces
set number

" Turn on word wrapping (Visually)
" set wrap

" Turn on search highlighting
set hlsearch
" Turn on incremental search with ignore case (except explicit caps)
set incsearch
set ignorecase
set smartcase

" Informative status line
" set statusline=%F%m%r%h%w\ [TYPE=%Y\ %{&ff}]\ [%l/%L\ (%p%%)]
"
" http://www.linux.com/archive/feature/120126
set statusline=%F%m%r%h%w\ [TYPE=%Y\ %{&ff}\ %{&fo}]\ [%l/%L,%v\ %p%%]\ [HEX=\%02.2B]
" Always show the status line
set laststatus=2

" Set color scheme
set t_Co=256
colorscheme desert256
" colorscheme slate
syntax enable

" Enable indent folding
set foldenable
set fdm=indent

" Set space to toggle a fold
nnoremap <space> za

" Hide buffer when not in window (to prevent relogin with FTP edit)
set bufhidden=hide

" Have 3 lines of offset (or buffer) when scrolling
set scrolloff=3

" Enable balloon tooltips on spelling suggestions and folds
function! FoldSpellBalloon()
    let foldStart = foldclosed(v:beval_lnum )
    let foldEnd = foldclosedend(v:beval_lnum)
    let lines = []

    " Detect if we are in a fold
    if foldStart < 0
        " Detect if we are on a misspelled word
        let lines = spellsuggest( spellbadword(v:beval_text)[ 0 ], 5, 0 )
    else
        " we are in a fold
        let numLines = foldEnd – foldStart + 1
        " if we have too many lines in fold, show only the first 14
        " and the last 14 lines
        if ( numLines > 31 )
            let lines = getline( foldStart, foldStart + 14 )
            let lines += [ '-- Snipped ' . ( numLines - 30 ) . ' lines --' ]
            let lines += getline( foldEnd – 14, foldEnd )
        else
            " less than 30 lines, lets show all of them
            let lines = getline( foldStart, foldEnd )
        endif
    endif
    " return result
    return join( lines, has( “balloon_multiline" ) ? “\n" : " " )
endfunction

" JJM FIXME E518: Unknown option: balloonexpr=FoldSpellBalloon()
" set balloonexpr=FoldSpellBalloon()
" set ballooneval

" http://vim.wikia.com/wiki/Highlight_unwanted_spaces
" Show trailing whitespace and spaces before a tab:
" match ExtraWhitespace /\s\+$\| \+\ze\t/
" highlight ExtraWhitespace ctermbg=darkgreen guibg=darkgreen
" JJM: Any changes to colorscheme will trigger this back on
" autocmd ColorScheme * highlight ExtraWhitespace ctermbg=darkgreen guibg=darkgreen


highlight ExtraWhitespace ctermbg=darkgreen guibg=darkgreen

if version >= 702

  " Use :call clearmatches() to clear these matches.
  " Give an indicator when we approach col 80 (>72)
  au BufWinEnter * let w:m1=matchadd('Search', '\%<81v.\%>72v', -1)
  " Give a strong indicator when we exceed col 80(>80)
  au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
  " Give an indicator of tailing white space.
  au BufWinEnter * let w:m3=matchadd('ErrorMsg', '\s\+$', -1)
  " Give an indicator of spaces before a tab.
  au BufWinEnter * let w:m4=matchadd('ErrorMsg', ' \+\ze\t', -1)
  " Give an indicator of tabs before a space.
  au BufWinEnter * let w:m5=matchadd('ErrorMsg', '\t\+\ze ', -1)

end

set bg=dark

" Allow vim comment commands
" http://vimdoc.sourceforge.net/htmldoc/options.html#modeline
set modeline
set modelines=7

" EOF
