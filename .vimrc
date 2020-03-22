" For vim 7.4 terminal
" Tested on Centos7, Debian 10
" 2019.09.26
" feature1 test
" modify on "master"

set nocp 	" nocompatible: less Vi-compatible
colo darkblue 	" colorscheme
"colo elflord 	" colorscheme
syn on 		" syntax: highlighting on
set nu 		" number: display line numbers
"set nuw=3 	" numberwidth: width of line numbers.
"set co=76 	" columns: number of columns of the screen. Default 80
set so=3 	" scrolloff: Minimal number of screen lines to keep.
"set wrap 	" Word wrap visually. Default on
"set uc=100 	" updatecount: After typing 100 characters, the swap file will be written to disk.
"set ut=2000 	" updatetime: If this many milliseconds nothing is typed, the swap file will be written to disk
"set ul=1000 	" undolevels: Maximum number of changes that can be undone.
"set nobk   	" nobackup: Switch off automatic creation of backup files. Default off.
set mh 		" mousehide: The mouse pointer is hidden when characters are typed.
set sm 		" showmatch: When a bracket is inserted, briefly jump to the matching one.
set sc 		" showcmd: Show (partial) command in the last line of the screen.
set ic 		" ignorecase: Ignore case in search patterns.
set hls 	" hlsearch: Highlight all search matches
set is 		" incsearch: While typing a search command, the matched string is highlighted.

set ssop+=unix,slash  " sessionoptions: with Unix end-of-line format (single <NL>); backslashes in file names replaced with forward slashes.
autocmd BufWrite * :set ff=unix  " auto save to unix
autocmd BufReadPost * call setpos(".", getpos("'\""))

" show filetype 	:echo &filetype
autocmd FileType yaml,bindzone setlocal expandtab tabstop=2 softtabstop=2 shiftwidth=2 		" for yaml & bindzone file
autocmd BufRead,BufNewFile hosts set expandtab tabstop=2 softtabstop=2 shiftwidth=2
autocmd BufRead,BufNewFile all_list*.txt set nowrap 	" for hardware list file.

set laststatus=2     " always have a stastus line
set statusline=%t%r%h%w\ [%{&ff}]\ [%{&fenc}:%{&enc}]\ [%p%%-%P]\ [%04.4c]\ [%05.5b]\ [%04.4B]

hi User1 ctermfg=green
hi User2 ctermfg=yellow
hi User3 ctermfg=red
hi User4 ctermfg=cyan
hi User5 ctermfg=blue
hi User6 ctermfg=gray

set statusline=
set statusline +=%1*\%f\ %*
set statusline +=%6*[Col:%*
set statusline +=%4*%c%*
set statusline +=%6*/V:%*
set statusline +=%3*%v%*
set statusline +=%6*]\ %*
set statusline +=%6*Hex:%*
set statusline +=%2*%B%*
set statusline +=%1*%=%*
set statusline +=%5*[%{&ff}:%{&fenc}]%*
set statusline +=%3*%p%%\ %*
 
set enc=utf-8   " encoding: character encoding used inside Vim.
set fenc=utf-8  " fileencoding: Sets the character encoding for the file of this buffer.
set fencs=ucs-bom,utf-8,gb18030,big5,euc-jp,euc-kr,latin1 " fileencodings

set si 		" cindent, smartindent, autoindent

"set et 	" expandtab: use space replace tab.
set noet 	" noexpandtab
set ts=8 	" tabstop
"set sts=12  	" softtabstop: if ts=8, then: sts4=4*space; 12=1*tab+4*space
 
"set nofen 	" nofoldenable
set fdm=marker 	" foldmethod: manual, indent, expr, marker, syntax, diff
"set fdm=indent 	" foldmethod: manual, indent, expr, marker, syntax, diff
set fdo=search	" foldopen(will open folds): all, block, hor, insert, jump, mark, percent, quickfix, search, undo
 
"set lbr 	" linebreak, wrap line at breakat.
"set tw=72 	" textwidth: Maximum width of text that is being inserted.
"set fo+=mM 	" formatoptions: For chinese, even there isn't space.
 
"set cul 	" cursorline: Highlight the line of the cursor
"set cuc 	" cursorcolumn: Highlight the column of the cursor
"highlight cursorcolumn guibg=gray10 ctermbg=gray

" Show tabs, end of line...
set list listchars=tab:→\ ,trail:·,precedes:←,extends:▸
"set list listchars=tab:▸\ ,trail:·,precedes:←,extends:→
"set list listchars=tab:>-,trail:-
"set list listchars=tab:»\ ,extends:›,precedes:‹,nbsp:·,trail:·
 
filetype plugin on
au BufNewFile,BufRead * if &ft == '' | set ft=txt | endif
 
map <F2> 	o<Esc>o<Esc>0I---------------------------------<C-R>=strftime("%Y_%m_%d %HH")<CR>----<Esc>o<Esc>o<Esc>
map <F3> 	I【<Esc>A】<Esc>
map <F4> 	I[<Esc>A]<Esc>
map <F5> 	:set fileencoding=utf-8 <CR>
"map <F6> 	:set fileencoding=gb2312 <CR>
map <F6> 	:set paste <CR>
map <F7> 	"<Esc>:setlocal spell! spelllang=fr<CR>"
map <F8> 	"<Esc>:setlocal spell! spelllang=en<CR>"

" then v -> gq, reformat.
map <F10> 	:set textwidth=72 <CR>

"set paste 	" Paste mode, avoid too many indent.
"set nopaste 	" Disable paste mode
map <F11> 	bi{<Esc>ea}<Esc>
map <F12> 	bi<<Esc>ea><Esc>

noremap  j 	gj
noremap  k 	gk
noremap  <Down> gj
noremap  <Up>   gk

" auto insert brackets.
"inoremap ( ()<LEFT>
"inoremap [ []<LEFT>
"inoremap ' ''<LEFT>
"inoremap " ""<LEFT>

"set lines=25 columns=84

