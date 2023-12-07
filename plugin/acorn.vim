" A plugin for acorn files.
" Install useful tools for *.acorn files

function! s:fmtAutosave()
  " acorn code formatting on save
  if get(g:, "acorn_fmt_on_save", 1)
    call acorn#Format()
  endif
endfunction


" auto group and clear inside prevents multiple registration of the same
" auto commands
augroup vim-acorn
   autocmd!
   autocmd BufReadPre *.acorn setlocal foldmethod=syntax
   autocmd BufReadPre *.acorn setlocal foldlevel=100
   autocmd BufWritePre *.acorn call s:fmtAutosave()
augroup END

