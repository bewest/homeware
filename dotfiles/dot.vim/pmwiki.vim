" Vim syntax file
" Language:	PMWiki
" Maintainer:	Ben Wilson <ameen@dausha.net>
" Last Change:	2004 July 2
" Remark:	First version.

" Setup
if version >= 600
  if exists("b:current_syntax")
    finish
  endif
else
  syntax clear
endif

" Wiki variables and the like are case sensitive

syntax case match

" Wiki Names

syntax match pmwikiPageName  "\([A-Z][a-z]\+\.\)\?\([A-Z][A-Z0-9]*[a-z0-9]\+\)\{2,}"
syntax match pmwikiPageLink  "|[^_].\{-}\S|"
syntax match pmwikiPageName  "\[\[[^\*].\{-}\S\]\]"

" Base constructs

syntax match pmwikiListItem  "^\s*\*\+\s"           " Unordered List Item
syntax match pmwikiListItem  "^\s*\#\+\s"           " Ordered   List Item
syntax match pmwikiListItem  "^\s*\[0-9]+\.\+\s" " Ordered   List Item
syntax match pmwikiDefList   "^\(   \).\+: \+"   " Defined list (not PmWiki)
syntax match pmwikiSeparator "^----"            " Hard Rule

syntax match pmwikiEM    "\*[^\*].\{-}\S\*"  " Embolden text
syntax match pmwikiStrongEm  "\*\*\*[^\\*\*].\{-}\S\*\*\*" " Markdown Embolden & Emphasize Text
syntax match pmwikiStrong    "\*\*[^\\*\*].\{-}\S\*\*" " Markdown Embolden & Emphasize Text
syntax match pmwikiEM        "\*[^\_].\{-}\S\*"    " Markdown Emphasize Text
syntax match pmwikiStrongEm  "___[^\__].\{-}\S___" " Markdown Embolden & Emphasize Text
syntax match pmwikiStrong    "__[^\__].\{-}\S__" " Markdown Embolden & Emphasize Text
syntax match pmwikiEM        "_[^\_].\{-}\S_"    " Markdown Emphasize Text

syntax match pmwikiDiffSize  "\[+.+\]"           " Increase Text Size

syntax match pmwikiFixFormat "^\s\+\S.\{-}\S"
syntax match pmwikiFixFormat "@@[^@]\S.\{-}\S@@"

syntax match pmwikiFixFormat "\s=[^=].\{-}\S=\s"
syntax match pmwikiFixFormat "\s=[^=].\{-}\S=$"
syntax match pmwikiFixFormat "\s==\S.\{-}\S==$"
syntax match pmwikiBackslash "\\*\s*$"
syntax match pmwikiIndent    "^-\+>"
syntax match pmwikiTable     "||"
syntax match pmwikiTable     "\(:table:\)"
syntax match pmwikiTable     "\(:tableend:\)"
syntax match pmwikiTable     "\(:cell:\)"
syntax match pmwikiTable     "\(:cellnr:\)"
"
syntax match pmwikiStrongEM  "'''''[^\'{2,5}].\{-}\S'''''" " Embolden & Emphasize Text
syntax match pmwikiStrong    "'''[^\'{2,5}].\{-}\S'''" " Embolden & Emphasize Text
syntax match pmwikiEM        "''[^\'{2,5}].\{-}\S''" " Embolden & Emphasize Text
"
" Titles
syntax region pmwikiTitle     start=/^!\+ / end=/$/
syntax region pmwikiFixFormat start=/^\(\t\|\s\)\+\S/ end=/$/
syntax region pmwikiDiffSize  start=/\[+/ end=/+\]/  " Increase Text Size
syntax region pmwikiDiffSize  start=/\[-/ end=/-\]/  " Decrease Text Size

" Define the default highlighting
if version >= 508 || !exists("did_inittab_syntax_inits")
  if version < 508
    let did_inittab_syntax_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif

  HiLink pmwikiTitle        Comment
  HiLink pmwikiDiffSize     Comment

  HiLink pmwikiFixFormat    Constant

  HiLink pmwikiBackslash    Special

  HiLink pmwikiStrongEM     Identifier

  HiLink pmwikiStrong       Type
  HiLink pmwikiListItem     Type
  HiLink pmwikiDefList      Type
  HiLink pmwikiSeparator    Type

  "HiLink pmwikiIndent       Special

  HiLink pmwikiTable        PreProc

  HiLink pmwikiPageNameOld  Tag
  HiLink pmwikiPageLink     Tag
  HiLink pmwikiPageName     Tag

  HiLink pmwikiEM           Underlined
  
  delcommand HiLink
endif

let b:current_syntax = "pmwiki"
