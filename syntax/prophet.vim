" vim syntax file
" Language: prophet

if exists("b:current_syntax")
  finish
end

syntax case match

syn keyword phtType label discrete continuous shortint int longint fload double string date timestamp
syn keyword phtStatement log floor year month date hour minute second datediff timediff eliminatechar combine lineartrans Beta0 split mapping splitbykey getkey wordseg top

syn region phtString start=/"/ skip=/\\"/ end=/"/
syn match  phtNumber "\<\d\>" display
syn match  phtNumber "\<[1-9]\d\+\>" display


syn keyword phtTodo TODO FIXME XXX contained
syn match   phtComment ' *#.*$' contains=phtTodo,@Spell

" Errors
syn match phtError "\<\d\+\D\+\>" display
syn match phtError "[$?]" display
syn match phtError "[&|]\{2,}" display
syn match phtError "[=]\{3,}" display

" highlight link
hi link phtType Type
hi link phtStatement Statement

hi link phtString String
hi link phtNumber Number

hi link phtTodo TODO
hi link phtComment Comment

hi link phtError Error
