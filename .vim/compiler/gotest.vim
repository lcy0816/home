if exists("current_compiler")
  finish
endif
let current_compiler = "gotest"

if exists(":CompilerSet") != 2
  command -nargs=* CompilerSet setlocal <args>
endif

let s:save_cpo = &cpo
set cpo-=C

CompilerSet makeprg=go\ test
CompilerSet errorformat=
      \%-G#\ %.%#,
      \%-G%.%#panic:\ %m,
      \%A%f:%l:%c:\ %m,
      \%A%f:%l:\ %m,
      \%C%*\\s%m,
      \%-G%.%#

let &cpo = s:save_cpo
unlet s:save_cpo

" vim:ts=4:sw=4:et
