" Options.

if !exists("g:acorn_command")
  let g:acorn_command = "acorn"
endif

if !exists("g:acorn_fmt_command")
  let g:acorn_fmt_command = "fmt"
endif

if !exists('g:acorn_fmt_options')
  let g:acorn_fmt_options = ''
endif


" Format calls `acorn fmt ... ` on the file and replaces the file with the auto
" formatted version.
function! acorn#Format() abort
  " Save the view.
  let curw = winsaveview()

  " Make a fake change so that the undo point is right.
  normal! ix
  normal! "_x

  " Execute `terraform fmt`, redirecting stderr to a temporary file.
  let tmpfile = tempname()
  let shellredir_save = &shellredir
  let &shellredir = '>%s 2>'.tmpfile
  silent execute '%!' . g:acorn_command . " " . g:acorn_fmt_command . " " . g:acorn_fmt_options . " -"
  let &shellredir = shellredir_save

  " If there was an error, undo any changes and show stderr.
  if v:shell_error != 0
    silent undo
    let output = readfile(tmpfile)
    echo join(output, "\n")
  endif

  " Delete the temporary file, and restore the view.
  call delete(tmpfile)
  call winrestview(curw)
endfunction
