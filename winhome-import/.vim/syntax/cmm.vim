" Vim syntax file:
" Language:     cmm
" Maintainer:   Nick Heilmann
" Last Change:  Tuesday, June 27, 2006

if exists("b:current_syntax")
  finish
endif

syn case ignore

syn keyword cmmKeywords         append beep close cont continue decrypt do dodecrypt else encrypt 
syn keyword cmmKeywords         encryptdo end enddo enter entry global gosub goto if inkey jumpto 
syn keyword cmmKeywords         local on open pbreak pedit plist pmacro pstep read repeat rpt 
syn keyword cmmKeywords         return run screen stop title wait while write

syn keyword cmmCommands         analyzer art asto autostore bm bookmark break cache csto clipstore
syn keyword cmmCommands         count cts data etm exception extension ext fdx fifo flag flash fpu
syn keyword cmmCommands         go group integrator java jtag la logger map mmu mode name onchip
syn keyword cmmCommands         pcp per perf pod port probe pulse pulse2 ref refresh register res 
syn keyword cmmCommands         reset rt runtime selftest shadow sim snoop snooper spe sp spot
syn keyword cmmCommands         step sto store symbol y sy synch sys system target task term tpu ta 
syn keyword cmmCommands         traddress tb trbus te trevent tp triggerprobe ti trin tm trmain to 
syn keyword cmmCommands         tronchip v var vco vm vpu 

syn keyword cmmIDEKeywords      abort area bitmapedit chdir cd clock cpos cmdpos cp compare copy del
syn keyword cmmIDEKeywords      dialog dir dump edit eval find history hist ifconfig iftest 
syn keyword cmmIDEKeywords      intercom license log ls menu mkdir mv os pack patch path prt printer
syn keyword cmmIDEKeywords      pro profile pwd quit radix ren rm rmdir setup statusbar toolbar type
syn keyword cmmIDEKeywords      unpack unzip version window zero zip

syn keyword cmmDBoxKeywords     box button checkbox choosebox combobox defbutton defcombobox
syn keyword cmmDBoxKeywords     defedit defhotcombobox defhotedit defmedit dlistbox dyncombobox
syn keyword cmmDBoxKeywords     dyndefcombobox dyndefhotcombobox dynhotcombobox header help 
syn keyword cmmDBoxKeywords     hotedit hotcombobox icon line listbox medit mlistbox pos posx posy
syn keyword cmmDBoxKeywords     pulldown space static text vline

syn match   cmmNumber           "[0-9]\+\(.[0-9]*\)\?" contains=cmmOperator
syn match   cmmNumber           "0x[a-fA-F0-9]\+" contains=cmmOperator

syn match   cmmIdentifier       "[a-zA-Z_][a-zA-Z_0-9]*"

syn match   cmmOperator         "?\|!\|=\|+\|-\|%\|:\|,\|\.\|<\|>\|&\|(\|)\|{\|}\|\[\|\]\|\*\|\~\|\^\|[|]\|/"
syn match   cmmOperator         "/[a-zA-A]\+" contains=cmmKeywords,cmmCommands,cmmIDEKeywords,cmmDBoxKeywords

syn region  cmmString           start=+L\="+ skip=+\\\\\|\\"\|\\$+ excludenl end=+"+ end='$'
syn region  cmmString           start=+L\='+ skip=+\\\\\|\\'\|\\$+ excludenl end=+'+ end='$'

syn region  cmmComment          start="//" skip="\\$" end="$" keepend
syn region  cmmComment          start=";" skip="\\$" end="$" keepend

hi cmmCommands                  ctermfg=yellow                    guifg=yellow
hi cmmComment                   ctermfg=green    cterm=italic     guifg=green    gui=italic
hi cmmDBoxKeywords              ctermfg=yellow   cterm=underline  guifg=yellow   gui=underline
hi cmmIDEKeywords               ctermfg=blue     cterm=underline  guifg=blue     gui=underline
hi cmmIdentifier                ctermfg=white                     guifg=white
hi cmmKeywords                  ctermfg=blue                      guifg=blue
hi cmmNumber                    ctermfg=magenta                   guifg=magenta
hi cmmOperator                  ctermfg=cyan                      guifg=cyan
hi cmmString                    ctermfg=red      cterm=italic     guifg=red      gui=italic

let b:current_syntax = "cmm"
