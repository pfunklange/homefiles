"au BufNewFile,BufRead *.module setfiletype php

" set drupal spacing issues
set expandtab
set tabstop=2
set shiftwidth=2
set autoindent
set smartindent
set backspace=indent,eol,start
syntax on

set number
set incsearch
set hlsearch
set nocompatible

" set specific drupal vim options
if has("autocmd")
  " Drupal files.
  augroup module
  autocmd BufRead *.module set filetype=php
  augroup END

  augroup inc
  autocmd BufRead *.inc set filetype=php
  augroup END

  augroup install
  autocmd BufRead *.install set filetype=php
  augroup END
 
  "nginx files
  augroup nginx
  autocmd BufRead *.nginx.conf set filetype=nginx
  augroup END
endif

" php autocomplete
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType php set foldmethod=marker
autocmd FileType php set foldmarker={,}

function! PyFold(lnum)
  let line = getline(a:lnum)
  if line =~ '^\s*$'
    return -1
  endif
  if line =~ '^#'
    return '='
  endif
  return indent(a:lnum) / 4
endfunction

autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType python set noexpandtab
autocmd FileType python set foldmethod=expr
autocmd FileType python set foldexpr=PyFold(v:lnum)
autocmd FileType python set tabstop=4
autocmd FileType python set shiftwidth=4

map <F2> :?;\\|\%^?+1,.-1;/;/ w !psql \| more <CR>
map <F3> :% w !php <CR>
map <F4> :% w !python <CR>
map <F5> :. w !sh <CR>
vmap <F2> : w !psql \| more<CR>
vmap <F3> : w !php <CR>
vmap <F4> : w !python <CR>
vmap <F5> : w !sh <CR>

hi String ctermfg=darkgreen
hi Type ctermfg=green
hi Number ctermfg=darkred
hi Comment ctermfg=darkblue

hi Folded ctermfg=yellow
hi Folded ctermbg=black
