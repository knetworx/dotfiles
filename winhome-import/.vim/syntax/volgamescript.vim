" Vim syntax file
"if exists("b:current_syntax")
"  finish
"endif

" Read the C syntax to start with
runtime! syntax/c.vim
unlet b:current_syntax

" C++ extentions
syn match   cppType				"\<_\i\+\>"
syn keyword cppBoolean			true false
syn match   cppRFGKeywords		"\(->\|\.\)\@<!\<\i\+\>\(\(<\i\+>\)\?\(\s\|\*\|\(&\@<!&\)\)\+[a-zA-Z]\)\@="
syn match   cppRFGKeywords		"(\@<=\(\<\i\+\>\)\(\s*\*)\)\@="
syn match   cppRFGKeywords		"\(<\s*\)\@<=\(\i\+\)\(\s*\*\?>\)\@="
syn match   cppRFGKeywords	 	"\(\(class\|struct\|enum\)\s\+\)\@<=\<\i\+\>"
syn match   cppRFGKeywords	 	"\(<\s*\)\@<=\(\i\+\)\(\s*\*\?\s*,\s*\i\+\s*\*\?\s*>\)\@="
syn match   cppRFGKeywords	 	"\(typedef\s\S\+\s\)\@<=\(\i\+\)\(;\)\@="
syn match   cppRFGKeywords	 	"\(}\s*\)\@<=\(\i\+\);\@="
syn keyword cppBuildName	 	_DEBUG __RELEASE_FINAL
syn keyword cppPlatformName	XBOX2 PS3
syn match   cppPreProcWords	"^\s*#\i\+"
syn match   cppPreProcWords	"^\s*#if !\?defined" contains=cppOperator,cOperator
syn match   cppRFGDefines		"\(^\s*#\i\+\)\@<=.\+" contains=cppOperator,cOperator,cComment,cCommentL,cNumber,cNumbers,cppBuildName,cppPreProcWords,cIncluded
syn match   cppRFGKeywords		"\<\i\+\(::\)\@="

" Default highlighting
if version >= 508 || !exists("did_cpp_syntax_inits")
   command -nargs=+ HiLink hi def link <args>
   HiLink cppAccess			cppStatement
   HiLink cppCast				cppStatement
   HiLink cppExceptions		Exception
   HiLink cppOperator		Operator
   HiLink cppStatement		Statement
   HiLink cppType				Type
   HiLink cppStorageClass	StorageClass
   HiLink cppStructure		Structure
   HiLink cppNumber			Number
   HiLink cppBoolean			Boolean
   HiLink cppBuildName		cppType
   delcommand HiLink
endif

let b:current_syntax = "volgamescript"

" vim: ts=3
