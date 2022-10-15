" Vim syntax file for KDL (https://kdl.dev)
" Language: KDL
" Maintainer: Autumn <auctumnus@pm.me> (https://autumns.page)
" For bugs and patches, yell at Autumn.
" Licensed under MIT.
" Includes regexes from:
"  - https://github.com/rust-lang/rust.vim
"  - https://github.com/kdl-org/vscode-kdl

if exists("b:current_syntax")
  finish
endif

syn keyword kdlBoolean true false
syn keyword kdlNull null

syn match kdlOperator "\v\="

syn region kdlComment              start="\b//"  end="$"
syn region kdlCommentBlock         start="/\*" end="\*/" contains=kdlCommentBlock fold
syn region kdlSlashdashComment     start="^\@<!/-"  end="\s"
syn region kdlSlashdashNodeComment start="/-{" end="}" contains=kdlBlock
syn region kdlSlashdashNodeComment start="^\@<=/-" end="}"

syn match kdlEscapeError        display contained /\\./
syn match kdlEscape             display contained /\\[nrt\\\/"bf]/
syn match kdlUnicodeEscape      display contained /\\u{\%(\x_*\)\{1,6}}/
syn match kdlUnicodeEscapeError display contained /\\u{\%(\x_*\)\{7,}}/

syn region kdlRawString start='b\?r\z(#*\)"' end='"\z1'
syn region kdlString    start="\"" skip=+\\\\\|\\"+ end=+"+ contains=kdlEscape,kdlEscapeError,kdlUnicodeEscape,kdlUnicodeEscapeError

syn match kdlNumberDecimal display /[0-9]+/

syn region kdlBlock start="{" end="}" fold transparent

highlight def link kdlOperator             Operator
highlight def link kdlCommentBlock         Comment
highlight def link kdlComment              Comment
highlight def link kdlSlashdashComment     Comment
highlight def link kdlSlashdashNodeComment Comment
highlight def link kdlBoolean              Boolean
highlight def link kdlNull                 Type
highlight def link kdlString               String
highlight def link kdlRawString            String
highlight def link kdlEscape               Special
highlight def link kdlUnicodeEscape        Special
highlight def link kdlEscapeError          Error
highlight def link kdlUnicodeEscapeError   Error
highlight def link kdlNumberDecimal        Number

let b:current_syntax = "kdl"
