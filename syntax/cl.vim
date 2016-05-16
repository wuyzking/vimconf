" Vim syntax file
"
" This file is a modified version of the existing vim C++
" syntax file in order to support C++11 language changes.
"
" Original Details
" ================
" Language:	C++
" Maintainer:	Ken Shan <ccshan@post.harvard.edu>
" Last Change:	2002 Jul 15

" For version 5.x: Clear all syntax items
" For version 6.x: Quit when a syntax file was already loaded
if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

" Read the C syntax to start with
if version < 600
  so <sfile>:p:h/cpp11_cbase.vim
else
  runtime! syntax/cpp11_cbase.vim
  unlet b:current_syntax
endif

" C++ extentions
syn keyword cppStatement	new delete this friend using constexpr
syn keyword cppAccess		public protected private __read_only read_only __write_only write_only __read_write read_write
syn keyword cppType		inline virtual explicit export bool wchar_t float2 float3 float4 uint int2 int3 int4 uint2 uint3 uint4 char2 char3 char4 char8 char16 uchar uchar2 uchar3 uchar4 uchar8 uchar16 short2 short3 short4 short8 short16 ushort ushort2 ushort3 ushort4 ushort8 ushort16 int8 int16 uint8 uint16 long2 long3 long4 long8 long16 ulong ulong2 ulong3 ulong4 ulong8 ulong16 float8 float16 double2 double3 double4 double8 double16 half half2 half3 half4 half8 half16 ptrdiff_t intptr_t uintptr_t image2d_t image3d_t sampler_t event_t
syn keyword cppExceptions	throw try catch
syn keyword cppOperator		operator typeid
syn keyword cppOperator		and bitor or xor compl bitand and_eq or_eq xor_eq not not_eq
syn match cppCast		"\<\(const\|static\|dynamic\|reinterpret\)_cast\s*<"me=e-1
syn match cppCast		"\<\(const\|static\|dynamic\|reinterpret\)_cast\s*$"
syn keyword cppStorageClass	mutable __global __local __kernel local global kernel __attribute__ __constant constant __private 
syn keyword cppStructure	class typename template namespace
syn keyword cppNumber		NPOS
syn keyword cppBoolean		true false

" The minimum and maximum operators in GNU C++
syn match cppMinMax "[<>]?"

" Default highlighting
if version >= 508 || !exists("did_cpp_syntax_inits")
  if version < 508
    let did_cpp_syntax_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif
  HiLink cppAccess		cppStatement
  HiLink cppCast		cppStatement
  HiLink cppExceptions		Exception
  HiLink cppOperator		Operator
  HiLink cppStatement		Statement
  HiLink cppType		Type
  HiLink cppStorageClass	StorageClass
  HiLink cppStructure		Structure
  HiLink cppNumber		Number
  HiLink cppBoolean		Boolean
  delcommand HiLink
endif

let b:current_syntax = "cpp"

" vim: ts=8
