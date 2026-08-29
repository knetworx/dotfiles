if !exists("main_syntax")
  if version < 600
    syntax clear
  elseif exists("b:current_syntax")
    finish
  endif
  let main_syntax = 'qna'
endif

syn case ignore

"syn region  qnaQuestion   start="\(^\(-\|\d\+[.)]\)\s*\)\@<=\S" end="\([.?)]\s*$\)\|\(\n\s*\n\)"
"syn region  qnaQuestion   start="\(^\(-\|\d\+[.)]\)\s*\)\@<=\S" end="\(\n\s*\n\)\|\(\n\@<=\s\s\S\)"
syn region  qnaQuestion   start="\(^\((.\{1,2})\|-\|\i\{1,3}[.)]\)\s*\)\@<=\S" end="\n\n"
"syn match   qnaStartNum   "^\(-\|\d\+[.)]\)"
syn match   qnaStartNum   "^\((.\{1,2})\|-\|\i\{1,3}[.)]\)"
syn region  qnaResponse   start="^\s\+" end="^\([^ $]\)\@="
syn match   qnaMyName     "Nic\(k\|holas\) Heilmann"

let b:current_syntax = "qna"

if main_syntax == 'qna'
  unlet main_syntax
endif
