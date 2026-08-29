" Vim syntax file
" Language:	Custom Operators
" Maintainer:	Nick Heilmann
" Updated:	2025 — spaceship operator, member pointer operators

" For version 5.x: Clear all syntax items
" For version 6.x: Quit when a syntax file was already loaded
if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

syn match	custOpMath		display "+\|-\|\*\|%\|\(\([/*]\)\@<!/\([/*]\)\@!\)"
syn match	custOpPunc		display ";\|:\|,\|\.\|?"
syn match	custOpComparator	display "!\|=\|<\|>"
syn match	custOpBrackets		display "(\|)\|{\|}\|\[\|\]"
syn match	custOpBitwise		display "\~\|\^\|[|]\|&"

" C++20: three-way comparison (spaceship) operator
syn match	custOpSpaceship		display "<=>"

" C++: member pointer dereference operators (.* and ->*)
syn match	custOpMemberPtr		display "\.\*\|->*"

syn cluster	custOps			contains=custOpMath,custOpPunc,custOpComparator,custOpBrackets,custOpBitwise,custOpSpaceship,custOpMemberPtr

" Default highlighting
if version >= 508 || !exists("did_custop_syntax_inits")
  if version < 508
    let did_custop_syntax_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif
  HiLink custOpMath		Operator
  HiLink custOpPunc		Operator
  HiLink custOpComparator	Operator
  HiLink custOpBrackets		Operator
  HiLink custOpBitwise		Operator
  HiLink custOpSpaceship	Operator
  HiLink custOpMemberPtr	Operator
  HiLink custOps		Operator
  delcommand HiLink
endif

let b:current_syntax = "custOp"

" vim: ts=8
