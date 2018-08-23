" === General
set ttyfast             " Indicate fast terminal
set mouse=              " Disable mouse visual mode
set hlsearch            " Highlight all matches when searching
set scrolloff=10        " Keep 10 lines in screen when scrolling
set ruler               " Show cursor position in bottom-right corner
set modeline            " Enable vim options in file's header
"set number              " Enable linenumber bar
"set relativenumber      " Use relative linenumbers
set numberwidth=6       " Linenumber bar width

" Jump to the last position when reopening a file
" - Added filetype gitcommit to ignore list
augroup lastpos
    autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") && &filetype != "gitcommit" | exe "normal! g'\"" | endif
augroup END

" Enable syntax coloring
if has('syntax')
    syntax on
endif

" === Syntax highlighting
" Linenumber bar colors
highlight LineNr term=bold cterm=NONE ctermfg=Grey ctermbg=NONE gui=NONE guifg=Grey guibg=NONE
highlight CursorLineNr term=bold cterm=NONE ctermfg=Grey ctermbg=NONE gui=NONE guifg=Grey guibg=NONE

" Highlight trailing whitespaces
highlight ExtraWhitespace ctermbg=red guibg=red
syntax match ExtraWhitespace /\s\+$/

highlight ColorColumn ctermbg=Black guibg=Black

augroup filetypes
    " Highlight characters exceeding maximum line length
    autocmd FileType python highlight OverLength ctermbg=DarkRed ctermfg=white
    autocmd FileType python syntax match OverLength /\%>79v.\+/
    autocmd FileType python set cc=73,80
augroup END

" === Key mappings
" F3: Toggle linenumbers bar
noremap <F3> :set invnumber<CR>:set invrelativenumber<CR>
" F3: Toggle linenumbers bar (in insert mode)
inoremap <F3> <C-O>:set invnumber<CR><C-O>:set invrelativenumber<CR>

" === Indentation
set shiftwidth=4
set tabstop=4

augroup filetypes
    autocmd FileType python    setlocal cinwords=if,elif,else,for,while,try,except,finally,def,class
    autocmd FileType python    setlocal tabstop=8 expandtab shiftwidth=4 softtabstop=4
    autocmd FileType gitcommit setlocal tabstop=8 expandtab shiftwidth=2 softtabstop=2 textwidth=70
    autocmd FileType yaml      setlocal tabstop=8 expandtab shiftwidth=2 softtabstop=2
augroup END
