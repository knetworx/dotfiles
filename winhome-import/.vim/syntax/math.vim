if !exists("main_syntax")
  if version < 600
    syntax clear
  elseif exists("b:current_syntax")
    finish
  endif
  let main_syntax = 'math'
endif

syn case ignore

syn match   mathOperator  "[^a-zA-Z0-9 ]"
syn match   mathNumber    "[0-9]"
syn match   mathVariable  "[a-zA-Z]\(_[a-zA-Z0-9]\+\)\?"
syn match   mathExample   "[eE][xX][aA][mM][pP][lL][eE]:"
"syn region  qnaResponse   start="^\s\+" end="^\([^ $]\)\@="

let b:current_syntax = "math"

if main_syntax == 'math'
  unlet main_syntax
endif
