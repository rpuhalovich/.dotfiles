" modified from retrobox.vim

source $VIMRUNTIME/colors/vim.lua " Nvim: revert to Vim default color scheme
let g:colors_name = 'retrobox'

let s:t_Co = &t_Co

hi! link CursorColumn CursorLine
hi! link StatusLineTerm StatusLine
hi! link StatusLineTermNC StatusLineNC
hi! link VisualNOS Visual
hi! link Tag Special
hi! link lCursor Cursor
hi! link MessageWindow PMenu
hi! link PopupNotification Todo
hi! link CurSearch Search

if (has('termguicolors') && &termguicolors) || has('gui_running')
  let g:terminal_ansi_colors = ['#000000', '#cc241d', '#98971a', '#d79921', '#458588', '#b16286', '#689d6a', '#a89984', '#928374', '#fb4934', '#b8bb26', '#fabd2f', '#83a598', '#d3869b', '#8ec07c', '#ebdbb2']
  " Nvim uses g:terminal_color_{0-15} instead
  for i in range(g:terminal_ansi_colors->len())
    let g:terminal_color_{i} = g:terminal_ansi_colors[i]
  endfor
endif
hi Normal guifg=#ebdbb2 guibg=#000000 gui=NONE cterm=NONE
hi CursorLineNr guifg=#fabd2f guibg=#303030 gui=NONE cterm=NONE
hi FoldColumn guifg=#928374 guibg=#000000 gui=NONE cterm=NONE
hi SignColumn guifg=#928374 guibg=#000000 gui=NONE cterm=NONE
hi VertSplit guifg=#303030 guibg=#000000 gui=NONE cterm=NONE
hi ColorColumn guifg=NONE guibg=#080808 gui=NONE cterm=NONE
hi Comment guifg=#928374 guibg=NONE gui=NONE cterm=NONE
hi CursorLine guifg=NONE guibg=#303030 gui=NONE cterm=NONE
hi Error guifg=#fb4934 guibg=#000000 gui=bold,reverse cterm=bold,reverse
hi ErrorMsg guifg=#000000 guibg=#fb4934 gui=bold cterm=bold
hi Folded guifg=#928374 guibg=#121212 gui=NONE cterm=NONE
hi LineNr guifg=#7c6f64 guibg=NONE gui=NONE cterm=NONE
hi MatchParen guifg=NONE guibg=#504945 gui=bold,underline cterm=bold,underline
hi NonText guifg=#504945 guibg=NONE gui=NONE cterm=NONE
hi Pmenu guifg=#ebdbb2 guibg=#3c3836 gui=NONE cterm=NONE
hi PmenuSbar guifg=NONE guibg=#3c3836 gui=NONE cterm=NONE
hi PmenuSel guifg=#3c3836 guibg=#83a598 gui=bold cterm=bold
hi PmenuThumb guifg=NONE guibg=#7c6f64 gui=NONE cterm=NONE
hi PmenuKind guifg=#fb4934 guibg=#3c3836 gui=NONE cterm=NONE
hi PmenuKindSel guifg=#fb4934 guibg=#83a598 gui=NONE cterm=NONE
hi PmenuExtra guifg=#a89984 guibg=#3c3836 gui=NONE cterm=NONE
hi PmenuExtraSel guifg=#303030 guibg=#83a598 gui=NONE cterm=NONE
hi SpecialKey guifg=#928374 guibg=NONE gui=NONE cterm=NONE
hi StatusLine guifg=#ebdbb2 guibg=#1c1c1c gui=NONE cterm=NONE
hi StatusLineNC guifg=#ebdbb2 guibg=#1c1c1c gui=NONE cterm=NONE
hi TabLine guifg=#a89984 guibg=#3c3836 gui=NONE cterm=NONE
hi TabLineFill guifg=#ebdbb2 guibg=#3c3836 gui=NONE cterm=NONE
hi TabLineSel guifg=#fbf1c7 guibg=#000000 gui=bold cterm=bold
hi ToolbarButton guifg=#fbf1c7 guibg=#303030 gui=bold cterm=bold
hi ToolbarLine guifg=NONE guibg=NONE gui=NONE ctermfg=NONE ctermbg=NONE cterm=NONE
hi Visual guifg=#000000 guibg=#83a598 gui=NONE cterm=NONE
hi WildMenu guifg=#83a598 guibg=#504945 gui=bold cterm=bold
hi EndOfBuffer guifg=#504945 guibg=NONE gui=NONE cterm=NONE
hi Conceal guifg=#83a598 guibg=NONE gui=NONE cterm=NONE
hi Cursor guifg=#000000 guibg=#fbf1c7 gui=NONE cterm=NONE
hi DiffAdd guifg=#b8bb26 guibg=#000000 gui=reverse cterm=reverse
hi DiffChange guifg=#8ec07c guibg=#000000 gui=reverse cterm=reverse
hi DiffDelete guifg=#fb4934 guibg=#000000 gui=reverse cterm=reverse
hi DiffText guifg=#fabd2f guibg=#000000 gui=reverse cterm=reverse
hi Directory guifg=#b8bb26 guibg=NONE gui=bold cterm=bold
hi IncSearch guifg=#fe8019 guibg=#000000 gui=reverse cterm=reverse
hi ModeMsg guifg=#fabd2f guibg=NONE gui=bold cterm=bold
hi MoreMsg guifg=#fabd2f guibg=NONE gui=bold cterm=bold
hi Question guifg=#fe8019 guibg=NONE gui=bold cterm=bold
hi Search guifg=#98971a guibg=#000000 gui=reverse cterm=reverse
hi QuickFixLine guifg=#8ec07c guibg=#000000 gui=reverse cterm=reverse
hi SpellBad guifg=#fb4934 guibg=NONE guisp=#fb4934 gui=undercurl cterm=underline
hi SpellCap guifg=#83a598 guibg=NONE guisp=#83a598 gui=undercurl cterm=underline
hi SpellLocal guifg=#8ec07c guibg=NONE guisp=#8ec07c gui=undercurl cterm=underline
hi SpellRare guifg=#d3869b guibg=NONE guisp=#d3869b gui=undercurl cterm=underline
hi Title guifg=#b8bb26 guibg=NONE gui=bold cterm=bold
hi WarningMsg guifg=#fb4934 guibg=NONE gui=bold cterm=bold
hi Boolean guifg=#d3869b guibg=NONE gui=NONE cterm=NONE
hi Character guifg=#d3869b guibg=NONE gui=NONE cterm=NONE
hi Conditional guifg=#fb4934 guibg=NONE gui=NONE cterm=NONE
hi Constant guifg=#d3869b guibg=NONE gui=NONE cterm=NONE
hi Define guifg=#8ec07c guibg=NONE gui=NONE cterm=NONE
hi Debug guifg=#fb4934 guibg=NONE gui=NONE cterm=NONE
hi Delimiter guifg=#fe8019 guibg=NONE gui=NONE cterm=NONE
hi Error guifg=#fb4934 guibg=#000000 gui=bold,reverse cterm=bold,reverse
hi Exception guifg=#fb4934 guibg=NONE gui=NONE cterm=NONE
hi Float guifg=#d3869b guibg=NONE gui=NONE cterm=NONE
hi Function guifg=#b8bb26 guibg=NONE gui=bold cterm=bold
hi Identifier guifg=#83a598 guibg=NONE gui=NONE cterm=NONE
hi Ignore guifg=fg guibg=NONE gui=NONE cterm=NONE
hi Include guifg=#8ec07c guibg=NONE gui=NONE cterm=NONE
hi Keyword guifg=#fb4934 guibg=NONE gui=NONE cterm=NONE
hi Label guifg=#fb4934 guibg=NONE gui=NONE cterm=NONE
hi Macro guifg=#8ec07c guibg=NONE gui=NONE cterm=NONE
hi Number guifg=#d3869b guibg=NONE gui=NONE cterm=NONE
hi Operator guifg=#8ec07c guibg=NONE gui=NONE cterm=NONE
hi PreCondit guifg=#8ec07c guibg=NONE gui=NONE cterm=NONE
hi PreProc guifg=#8ec07c guibg=NONE gui=NONE cterm=NONE
hi Repeat guifg=#fb4934 guibg=NONE gui=NONE cterm=NONE
hi SpecialChar guifg=#fb4934 guibg=NONE gui=NONE cterm=NONE
hi SpecialComment guifg=#fb4934 guibg=NONE gui=NONE cterm=NONE
hi Statement guifg=#fb4934 guibg=NONE gui=NONE cterm=NONE
hi StorageClass guifg=#fe8019 guibg=NONE gui=NONE cterm=NONE
hi Special guifg=#fe8019 guibg=NONE gui=NONE cterm=NONE
hi String guifg=#b8bb26 guibg=NONE gui=NONE cterm=NONE
hi Structure guifg=#8ec07c guibg=NONE gui=NONE cterm=NONE
hi Todo guifg=fg guibg=#000000 gui=bold cterm=bold
hi Type guifg=#fabd2f guibg=NONE gui=NONE cterm=NONE
hi Typedef guifg=#fabd2f guibg=NONE gui=NONE cterm=NONE
hi Underlined guifg=#83a598 guibg=NONE gui=underline cterm=underline
hi CursorIM guifg=#000000 guibg=#fbf1c7 gui=NONE cterm=NONE
