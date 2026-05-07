hi clear
if exists("syntax_on")
  syntax reset
endif
let g:colors_name = "designless-light"
set background=light

hi Normal       guifg=#111111 guibg=#FFFFFF ctermfg=16 ctermbg=231
hi Comment      guifg=#6B6560 ctermfg=59 gui=italic
hi Constant     guifg=#5A2D9A ctermfg=55
hi String       guifg=#1E6B3C ctermfg=22
hi Number       guifg=#7A4A00 ctermfg=94
hi Identifier   guifg=#111111 ctermfg=16
hi Function     guifg=#1050A0 ctermfg=25
hi Statement    guifg=#C0000A ctermfg=160
hi Keyword      guifg=#C0000A ctermfg=160
hi Type         guifg=#5A2D9A ctermfg=55
hi PreProc      guifg=#006E6E ctermfg=30
hi Special      guifg=#006E6E ctermfg=30
hi Underlined   guifg=#1050A0 ctermfg=25 gui=underline
hi Todo         guifg=#7A4A00 guibg=#E8E4DF ctermfg=94 ctermbg=254 gui=bold
hi Error        guifg=#C0000A ctermfg=160 gui=bold

hi LineNr       guifg=#6B6560 guibg=#FFFFFF ctermfg=59 ctermbg=231
hi CursorLineNr guifg=#111111 guibg=#E8E4DF ctermfg=16 ctermbg=254 gui=bold
hi CursorLine   guibg=#E8E4DF ctermbg=254
hi Visual       guibg=#E8E4DF ctermbg=254
hi StatusLine   guifg=#111111 guibg=#E8E4DF ctermfg=16 ctermbg=254
hi StatusLineNC guifg=#6B6560 guibg=#DDD7D1 ctermfg=59 ctermbg=188
hi Pmenu        guifg=#111111 guibg=#E8E4DF ctermfg=16 ctermbg=254
hi PmenuSel     guifg=#FFFFFF guibg=#1050A0 ctermfg=231 ctermbg=25
hi MatchParen   guifg=#1050A0 guibg=#E8E4DF ctermfg=25 ctermbg=254 gui=bold
hi Search       guifg=#FFFFFF guibg=#7A4A00 ctermfg=231 ctermbg=94
hi IncSearch    guifg=#FFFFFF guibg=#1050A0 ctermfg=231 ctermbg=25

hi DiffAdd      guifg=#1E6B3C guibg=#E8E4DF ctermfg=22 ctermbg=254
hi DiffDelete   guifg=#C0000A guibg=#E8E4DF ctermfg=160 ctermbg=254
hi DiffChange   guifg=#7A4A00 guibg=#E8E4DF ctermfg=94 ctermbg=254
hi DiffText     guifg=#111111 guibg=#DDD7D1 ctermfg=16 ctermbg=188 gui=bold
