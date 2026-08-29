" Vim syntax file
" Language:	C++
" Maintainer:	Nick Heilmann
" Based on:	Ken Shan <ccshan@post.harvard.edu>
" Updated:	2025 — C++11/14/17/20/23 keywords, attributes, binary literals

if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

if version < 600
  so <sfile>:p:h/c.vim
else
  runtime! syntax/c.vim
  unlet b:current_syntax
endif

" ============================================================
" C++ keywords
" ============================================================
syn keyword cppStatement	new gcnew delete this friend using
syn keyword cppAccess		public protected private
syn keyword cppType		inline virtual explicit export override final
syn keyword cppType		bool wchar_t uint8 uint16 uint32 uint64 int8 int16 int32 int64
syn keyword cppExceptions	throw try catch
syn keyword cppOperator		operator typeid
syn keyword cppOperator		and bitor or xor compl bitand and_eq or_eq xor_eq not not_eq
syn match   cppCast		"\<\(const\|static\|dynamic\|reinterpret\)_cast\s*<"me=e-1
syn match   cppCast		"\<\(const\|static\|dynamic\|reinterpret\)_cast\s*$"
syn keyword cppStorageClass	mutable
syn keyword cppStructure	class typename template namespace
syn keyword cppNumber		NPOS
syn keyword cppBoolean		true false
syn keyword cRepeat		foreach

" ============================================================
" C++11 keywords
" ============================================================
syn keyword cppType		decltype noexcept char16_t char32_t
syn keyword cppType		alignas alignof
syn keyword cppStatement	static_assert
syn keyword cppStorageClass	thread_local constexpr
" nullptr is its own keyword constant (type nullptr_t)
syn keyword cppNullptr		nullptr

" ============================================================
" C++20 keywords
" ============================================================
syn keyword cppStructure	concept
syn keyword cppStatement	requires co_await co_yield co_return
syn keyword cppStorageClass	consteval constinit
syn keyword cppType		char8_t

" ============================================================
" C++11 attributes: [[nodiscard]], [[maybe_unused]], etc.
" ============================================================
syn match cppAttribute		"\[\[.\{-}\]\]"

" ============================================================
" C++14: binary integer literals (0b0101), with optional digit separators
" Digit separators (') within decimal/hex are handled approximately —
" the existing cNumber patterns in c.vim still apply for those.
" ============================================================
syn match cNumber display contained "0[bB][01][01']*\(u\=l\{0,2}\|ll\=u\)\>"

" ============================================================
" UE type prefixes: A=Actor, U=UObject, F=struct, E=enum, T=template, I=interface
" Matches e.g. AActor, UObject, FName, FVector, ENetMode, TArray, IInterface
" Does NOT match plain capitalized variables like Target, Event, WorldContext
" ============================================================
syn match cppUEType "\<[AUFETI][A-Z][a-zA-Z0-9_]*\>"

" ============================================================
" ALL_CAPS defines / macros (JUNO_API, PI, INDEX_NONE, etc.)
" ============================================================
syn match cppCustDefines "\<[A-Z_][A-Z0-9_]\{2,\}\>"

" ============================================================
" Functions: identifier immediately before ( or <T>(
" ============================================================
syn match cppFunctions "\<[A-Za-z_]\i*[a-z]\i*\(\(<\i\+>\)\?(\)\@=" contains=cppCast
" Function pointer:  (*FuncName)(args)
syn match cppFunctions "\((\*\)\@<=\(\i\+\)\()\s*(\)\@="

" ============================================================
" Std / Boost qualified access:  std::vector, boost::shared_ptr
" ============================================================
syn match   cppStdBoostAccess "\<\i\+\(::\i\+\)\+\>" contains=ALL
syn keyword cppStdBoost contained
    \ std boost
    \ string string_view wstring
    \ vector array deque list forward_list
    \ map unordered_map multimap unordered_multimap
    \ set unordered_set multiset unordered_multiset
    \ bitset span
    \ optional variant any monostate expected
    \ tuple pair
    \ shared_ptr unique_ptr weak_ptr make_shared make_unique
    \ function move forward declval exchange
    \ atomic mutex lock_guard unique_lock shared_mutex scoped_lock
    \ thread jthread
    \ stringstream istringstream ostringstream
    \ iterator const_iterator
    \ cout cerr endl
    \ runtime_error logic_error out_of_range invalid_argument
    \ ostream istream
    \ byte
    \ filesystem path
    \ chrono
    \ future promise async

" ============================================================
" Build / preprocessor
" ============================================================
syn keyword cppBuildName	_DEBUG __RELEASE_FINAL DEBUG __AVM2__
syn match   cppPreProcWords	"^\s*#\i\+" contains=cppBuildName
syn match   cppPreProcWords	"^\s*#if !\?defined" contains=cppOperator,custOps
syn match   cppCustDefines	"\(^\s*#\i\+\)\@<=.\+" contains=cppOperator,custOps,cComment,cCommentL,cNumber,cNumbers,cppBuildName,cppPreProcWords,cIncluded,custOpMath,custOpBrackets,custOpComparator,custOpPunc

" ============================================================
" Section divider comments:  ////...
" ============================================================
syn region cppSectionHeader start=+///+ end=+$+

syn match cppMinMax "[<>]?"

" ============================================================
" Highlighting links
" ============================================================
if version >= 508 || !exists("did_cpp_syntax_inits")
  if version < 508
    let did_cpp_syntax_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif

  HiLink cppAccess	cppStatement
  HiLink cppCast	cppStatement
  HiLink cppExceptions	Exception
  HiLink cppOperator	Operator
  HiLink cppStatement	Statement
  HiLink cppType	Type
  HiLink cppStorageClass	StorageClass
  HiLink cppStructure	Structure
  HiLink cppNumber	Number
  HiLink cppBoolean	Boolean
  HiLink cppNullptr	Constant
  HiLink cppBuildName	cppType
  HiLink cppStdBoost	cppCustDefines
  HiLink cppMinMax	Operator
  HiLink cppAttribute	Special

  HiLink cppUEType	Type
  HiLink cppCustDefines	Constant
  HiLink cppFunctions	Function
  HiLink cppPreProcWords	Include
  HiLink cppSectionHeader	Comment
  HiLink cppStdBoostAccess	Identifier

  delcommand HiLink
endif

let b:current_syntax = "cpp"

" vim: ts=8
