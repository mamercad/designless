hi clear
if exists("syntax_on")
  syntax reset
endif
let g:colors_name = "designless-dark"
set background=dark

hi Normal       guifg=#E5DDD0 guibg=#090807 ctermfg=252 ctermbg=232
hi Comment      guifg=#5A5248 ctermfg=59 gui=italic
hi Constant     guifg=#9575CD ctermfg=104
hi String       guifg=#5AB87A ctermfg=71
hi Number       guifg=#E8A030 ctermfg=214
hi Identifier   guifg=#E5DDD0 ctermfg=252
hi Function     guifg=#4A8FD9 ctermfg=68
hi Statement    guifg=#D71921 ctermfg=160
hi Keyword      guifg=#D71921 ctermfg=160
hi Type         guifg=#9575CD ctermfg=104
hi PreProc      guifg=#26C6C6 ctermfg=44
hi Special      guifg=#26C6C6 ctermfg=44
hi Underlined   guifg=#4A8FD9 ctermfg=68 gui=underline
hi Todo         guifg=#E8A030 guibg=#1D1A17 ctermfg=214 ctermbg=234 gui=bold
hi Error        guifg=#D71921 ctermfg=160 gui=bold

hi LineNr       guifg=#5A5248 guibg=#090807 ctermfg=59 ctermbg=232
hi CursorLineNr guifg=#FFFFFF guibg=#1D1A17 ctermfg=231 ctermbg=234 gui=bold
hi CursorLine   guibg=#1D1A17 ctermbg=234
hi Visual       guibg=#3A3632 ctermbg=237
hi StatusLine   guifg=#E5DDD0 guibg=#1D1A17 ctermfg=252 ctermbg=234
hi StatusLineNC guifg=#5A5248 guibg=#3A3632 ctermfg=59 ctermbg=237
hi Pmenu        guifg=#E5DDD0 guibg=#1D1A17 ctermfg=252 ctermbg=234
hi PmenuSel     guifg=#090807 guibg=#4A8FD9 ctermfg=232 ctermbg=68
hi MatchParen   guifg=#4A8FD9 guibg=#1D1A17 ctermfg=68 ctermbg=234 gui=bold
hi Search       guifg=#090807 guibg=#E8A030 ctermfg=232 ctermbg=214
hi IncSearch    guifg=#090807 guibg=#4A8FD9 ctermfg=232 ctermbg=68

hi DiffAdd      guifg=#5AB87A guibg=#1D1A17 ctermfg=71 ctermbg=234
hi DiffDelete   guifg=#D71921 guibg=#1D1A17 ctermfg=160 ctermbg=234
hi DiffChange   guifg=#E8A030 guibg=#1D1A17 ctermfg=214 ctermbg=234
hi DiffText     guifg=#FFFFFF guibg=#3A3632 ctermfg=231 ctermbg=237 gui=bold
