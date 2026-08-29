hi clear
set bg=dark
if exists("syntax_on")
  syntax reset
endif
let g:colors_name = "nick"

hi Comment					guifg=green4											ctermfg=28
hi Constant					guifg=purple							gui=none		ctermfg=129
hi Character				guifg=red												ctermfg=196
if (&t_Co > 16)
	hi DiffAdd										guibg=#002200		gui=none							ctermbg=232
	hi DiffChange									guibg=#330033		gui=none							ctermbg=235
else
	hi DiffAdd										guibg=#002200		gui=none							ctermbg=darkgreen
	hi DiffChange									guibg=#330033		gui=none							ctermbg=darkmagenta
endif
hi DiffDelete				guifg=#333333		guibg=#171717		gui=none							ctermbg=233		ctermfg=236
hi DiffText										guibg=#000077		gui=none							ctermbg=18
"hi Directory				guifg=cyan												ctermfg=cyan		ctermbg=black
hi Error					guifg=white			guibg=red							ctermfg=231		ctermbg=196
hi Exception				guifg=orange											ctermfg=214
hi Folded					guifg=gray			guibg=#004400						ctermfg=250		ctermbg=22
hi FoldColumn				guifg=darkgreen		guibg=#222222						ctermfg=22	ctermbg=235
hi Function					guifg=#eb660e											ctermfg=166
hi Identifier				guifg=#5555ff							gui=none		ctermfg=63
hi Include					guifg=#999999											ctermfg=246
hi Label					guifg=yellow											ctermfg=226
"hi LineComment				guifg=#777777
hi LineNr					guifg=#555555		ctermfg=240
hi MatchParen				guifg=white			guibg=#000000						ctermfg=231		ctermbg=16
hi Normal					guifg=#d0ce7c		guibg=#1e1e1e						ctermfg=186		ctermbg=234
hi Number					guifg=#86aa90											ctermfg=108
hi PreProc					guifg=#00ff00											ctermfg=46
hi Operator					guifg=#559fd1											ctermfg=74
hi Search						               guibg=#c0c000											ctermbg=142
hi SpecialComment			guifg=darkcyan											ctermfg=30
hi SpecialKey				guifg=#555555											ctermfg=240
hi Statement				guifg=#3f8cbd							gui=bold		ctermfg=67
hi StatusLine				guifg=#ffff00		guibg=#0000ff		gui=none		ctermfg=226		ctermbg=21
hi String					guifg=#c68860											ctermfg=173
hi Todo						guifg=#000080		guibg=#c0c000		gui=bold		ctermfg=18			ctermbg=142
hi Type						guifg=#3f8cbd							gui=bold		ctermfg=67
hi Unknown					guifg=black			guibg=yellow		gui=bold		ctermfg=16		ctermbg=226			cterm=bold
hi Visual										guibg=#004400											ctermbg=22

hi link Boolean			Statement
hi link Conditional		Statement
hi link Directory		Comment
hi link Float			Number
hi link LineComment		Comment
hi link Macro			Constant
hi link PreCondit		Statement
hi link Repeat			Statement
hi link Special			Comment
hi link SpecialChar		Constant
hi link StorageClass	Statement
hi link Structure		Statement

hi link vimFunction Function

" Actionscript
hi actionScriptObjects			guifg=yellow		ctermfg=226
hi actionScriptAs2				guifg=blue		ctermfg=21
hi actionScriptParen			guifg=green		ctermfg=46
hi link actionScriptLineComment	LineComment
"actionScriptCommentSkip xxx cleared
"actionScriptSpecial xxx links to Special
"actionScriptCommentString xxx cleared
"actionScriptComment2String xxx cleared
"actionScriptCharacter xxx links to Character
hi link actionScriptNumber		Number
"actionScriptComment xxx links to Comment
"actionScriptStringD xxx links to String
"actionScriptStringS xxx links to String
"actionScriptSpecialCharacter xxx links to actionScriptSpecial
"actionScriptConditional xxx links to Conditional
"actionScriptRepeat xxx links to Repeat
"actionScriptCase xxx links to Label
"actionScriptConstructor xxx links to Operator
"actionScriptObjects xxx guifg=yellow
"actionScriptStatement xxx links to Statement
"actionScriptFunction xxx links to Function
"actionScriptValue xxx links to Boolean
"actionScriptArray xxx links to Type
"actionScriptDate xxx links to Type
"actionScriptMath xxx links to Type
"actionScriptNumberObj xxx links to Type
"actionScriptObject xxx links to Function
"actionScriptString xxx links to Type
"actionScriptColor xxx links to Type
"actionScriptKey xxx links to Type
"actionScriptMouse xxx links to Type
"actionScriptSelection xxx links to Type
"actionScriptSound xxx links to Type
"actionScriptStage xxx links to Type
"actionScriptSystem xxx links to Type
"actionScriptTextFormat xxx links to Type
"actionScriptCommunication xxx links to Type
"actionScriptXMLSocket xxx links to Type
"actionScriptTextField xxx links to Type
"actionScriptMethods xxx links to Statement
"actionScriptBraces xxx links to Function
"actionScriptException xxx links to Exception
"actionScriptXML xxx links to Type
"actionScriptArrayConstant xxx links to Constant
"actionScriptStringConstant xxx links to Constant
"actionScriptEventConstant xxx links to Constan

" Diff files
hi diffAdded				guifg=green		ctermfg=46
hi diffFile					guifg=yellow2		ctermfg=226
hi diffLine					guifg=#555555		ctermfg=240
hi diffRemoved				guifg=red		ctermfg=196

" Completion Menu
hi Pmenu					guifg=#dddddd		guibg=#333333						ctermfg=253		ctermbg=236		cterm=bold
hi PmenuSel					guifg=#dddddd		guibg=#000055						ctermfg=253		ctermbg=17

" C Highlighting
hi link cBracket Operator
hi link cCppBracket Operator
hi link cCppParen Operator
hi link cCppString String
hi link cParen Operator
hi link cLabel Label
hi cUserLabel guifg=#a96a1e		ctermfg=130
hi link cUserCont Operator
hi cComment2String		guifg=gray											ctermfg=250
hi cCommentString		guifg=gray											ctermfg=250
hi cErrInBracket		guifg=fg			guibg=bg			gui=none	ctermfg=fg		ctermbg=bg	cterm=none
hi cErrInParen			guifg=white			guibg=red			gui=bold	ctermfg=231	ctermbg=196	cterm=bold
"hi cType guifg=#3f8cbd gui=bold
" And some keywords I added...
hi link cMyKeywords Identifier
hi link cMyKeywords2 Normal
hi link cLibKeywords Directory

" C++ Highlighting (extends from C Highlighting)
hi cppAccess guifg=#3f8cbd gui=bold		ctermfg=67
hi link cppMinMax Operator
hi link cppExceptions Exception
" Again, syntax elements I created
hi link cppFunctions Function
hi link cppPreProcWords Include
hi link cppCustDefines Constant
hi link cppSectionHeader Comment
hi link cppCustKW Identifier
hi link cppCustDecl Identifier
hi link cppCustCast Identifier
hi link cppCustTemp Identifier
hi link cppCustFwdDecl Identifier
hi link cppCustTypeDef Identifier
hi link cppCustEnumName Identifier
hi link cppCustSRO Identifier
hi link cppAccess Label
hi cppPragmaRegion		guifg=black			guibg=gray			gui=bold		ctermfg=16	ctermbg=250	cterm=bold
hi cppPRKeywords		guifg=blue			guibg=gray			gui=bold		ctermfg=21	ctermbg=250	cterm=bold
hi cppDEBUG									guibg=#333333		ctermbg=236
hi cppUEType guifg=yellow gui=bold		ctermfg=226

hi dosbatchPath			guifg=darkgreen											ctermfg=22

" Java Highlighting
hi link javaBraces Operator
hi link javaConditional Statement
hi link javaConstant Constant
hi link javaError2 Error
hi link javaExceptions Statement
hi link javaExternal String
hi link javaLabel Directory
hi link javaOpchars Operator
hi link javaOperator Statement
hi link javaOperatorC Operator
hi link javaParen Operator
hi link javaScopeDecl Statement
hi link javaSpecialChar Constant
hi link javaString String
hi link javaType Statement
hi link javaTypedef Directory
hi link javaNicksExceptions Constant
hi link javaClassType Constant
hi link javaCommentCharacter SpecialComment
hi link javaCommentSpecial SpecialComment
hi link javaCommentSpecial2 SpecialComment
hi link javaCommentString SpecialComment
hi javaBoolean             guifg=magenta                   	gui=bold			ctermfg=201						cterm=bold
hi javaDocComment          guifg=#228844                   	gui=none			ctermfg=29					cterm=bold
hi javaDocParam            guifg=cyan3											ctermfg=44
hi javaDocTags             guifg=cyan                      	gui=bold			ctermfg=51						cterm=bold
hi javaStorageClass        guifg=red3                      	gui=bold			ctermfg=160						cterm=bold

" JavaScript Highlighting
hi javaScriptFunction		guifg=yellow		ctermfg=226
hi javaScriptFunctions		guifg=darkgray		ctermfg=248

" QNA Highlighting (Custom filetype, see syntax/qna.vim)
hi qnaQuestion              guifg=white                     gui=bold			ctermfg=231                       cterm=bold
hi qnaStartNum              guifg=green                     gui=bold			ctermfg=46                       cterm=bold
hi qnaResponse              guifg=gray											ctermfg=250
hi qnaMyName                guifg=red                       gui=bold			ctermfg=196                         cterm=bold

" VB Highlighting
hi link vbOperator Operator

" HTML Highlighting
hi cssStyle                 guifg=orange                                        ctermfg=214  cterm=bold
hi htmlEndTag               guifg=blue                      gui=bold            ctermfg=21                       cterm=bold
hi htmlScriptTag            guifg=blue                      gui=bold            ctermfg=21
hi htmlTag                  guifg=blue                      gui=bold            ctermfg=21                       cterm=bold
hi htmlTitle                guifg=magenta                   gui=bold,underline	ctermfg=201						cterm=bold,underline
hi javaScript               guifg=green                                         ctermfg=46  cterm=bold

" MATH highlighting (Custom filetype, see syntax/math.vim)
hi link mathOperator Operator
hi link mathNumber Number
hi mathVariable             guifg=white		ctermfg=231
hi mathExample              guifg=yellow                    gui=bold,underline		ctermfg=226

hi luaOperator				guifg=green											ctermfg=46
hi luaFunc					guifg=darkgray										ctermfg=248
hi luaNumber				guifg=red		ctermfg=196
hi luaConstant				guifg=purple3		ctermfg=92
hi luaFunction				guifg=yellow		ctermfg=226
hi luaVolitionConstant		guifg=#770077		ctermfg=90
hi luaVolitionSysConstant	guifg=blue		ctermfg=21

hi unrealSpecifier guifg=#a96a1e		ctermfg=130
hi link unrealMetaKey unrealSpecifier
hi link unrealGenerated Macro
