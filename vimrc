" My custom vim config "

let g:TH3X_theme_active = 1
let g:minimal = 0

set encoding=utf-8
set pastetoggle=<F2>
syntax on
set t_Co=256

set tabstop=4
set shiftwidth=4
set autoindent
set number
set relativenumber 
set showcmd
set background=light

function! THEX_theme()
	set termguicolors
	set colorcolumn=80
	set cursorline
	colorscheme default
	set background=dark
	
	let s:colors = {
	  \ 'Red'          : {'Hex': '#ff0000', '256-color': '130'},
	  \ 'DarkRed'      : {'Hex': '#a52a2a', '256-color': '130'},
	  \ 'Blue'         : {'Hex': '#220dad', '256-color': '57'},
	  \ 'BlueViolet'   : {'Hex': '#8a2be2', '256-color': '57'},
	  \ 'SlateBlue'    : {'Hex': '#8470ff', '256-color': '57'},
	  \ 'MidnightBlue' : {'Hex': '#191970', '256-color': '57'},
	  \ 'DarkSlateBlue': {'Hex': '#483d8b', '256-color': '57'},
	  \ 'Purple'       : {'Hex': '#6a0dad', '256-color': '101'},
	  \ 'Magenta'      : {'Hex': '#ff00ff', '256-color': '135'}, 
	  \ 'DarkOrchid'   : {'Hex': '#ba55d3', '256-color': '35'},
	  \ 'VioletRed'    : {'Hex': '#d02090', '256-color': '35'},
	  \ 'Green'        : {'Hex': '#00ff00', '256-color': '35'},
	  \ 'DarkGreen'    : {'Hex': '#55af66', '256-color': '35'},
	  \ 'Teal'         : {'Hex': '#2e8b57', '256-color': '35'},
	  \ 'Orange'       : {'Hex': '#ff4c00', '256-color': '35'},
	  \ 'DarkOrange'   : {'Hex': '#ff8c00', '256-color': '130'},
	  \ 'Cyan'         : {'Hex': '#008787', '256-color': '33'},
	  \ 'Black'        : {'Hex': '#000000', '256-color': '0'},
	  \ 'LightGray1'   : {'Hex': '#b2b2b2', '256-color': '244'},
	  \ 'LightGray'    : {'Hex': '#919191', '256-color': '244'}, 
	  \ 'DarkGray'     : {'Hex': '#202020', '256-color': '232'},
	  \ 'DarkGray2'    : {'Hex': '#333333', '256-color': '233'}, 
	  \ 'DarkGray3'    : {'Hex': '#444444', '256-color': '233'}, 
	  \ 'DarkBlack'    : {'Hex': '#111111', '256-color': '0'},
	  \ 'DarkBlack2'   : {'Hex': '#080808', '256-color': '0'},
	  \ 'MediumGray'   : {'Hex': '#bcbcbc', '256-color': '233'},
	  \ 'LightWhite'   : {'Hex': '#e4e4e4', '256-color': '235'},
	  \ 'Yellow'       : {'Hex': '#ffff00', '256-color': '11'},
	  \ 'LightBlue'    : {'Hex': '#00ffff', '256-color': '94'},
	  \ 'White'        : {'Hex': '#ffffff', '256-color': '255'}, 
	  \ 'Gray'         : {'Hex': '#666666', '256-color': '241'},
	  \ 'NONE'         : {'Hex': 'NONE'	, 	'256-color': 'NONE'},
	  \}

	function! s:ui(args)
		let s:termguicolors = has('termguicolors')
		for [key, value] in items(a:args)
			let fg    = s:colors[value['fg']]
			let bg    = s:colors[value['bg']]
			let style = value['style']
			if !empty(s:termguicolors)
				execute 'hi '.key.' guifg='.fg['Hex'].' guibg='.bg['Hex'].' gui='.style.' cterm='.style
			else
				execute 'hi '.key.' ctermfg='.fg['256-color'].' ctermbg='.bg['256-color'].' cterm='.style 
			endif
		endfor
	endfunction

			"\ 'Statement' 	    :{ 'bg':'NONE',          'fg': 'DarkRed',	 'style': 'NONE'}, 
	call s:ui({
			\ 'Type' 	        :{ 'bg':'NONE',          'fg': 'Teal',		 'style': 'NONE'}, 
			\ 'Identifier' 	    :{ 'bg':'NONE',          'fg': 'Cyan',		 'style': 'NONE'}, 
			\ 'Constant' 	    :{ 'bg':'DarkBlack',     'fg': 'DarkRed',	 'style': 'NONE'}, 
			\ 'PreProc' 	    :{ 'bg':'NONE',          'fg': 'BlueViolet', 'style': 'NONE'}, 
			\ 'String' 	 	    :{ 'bg':'DarkBlack',     'fg': 'VioletRed',  'style': 'NONE'}, 
			\ 'Statement' 	    :{ 'bg':'NONE',          'fg': 'Orange',	 'style': 'NONE'}, 
			\ 'StatusLineTerm'  :{ 'bg':'MidnightBlue',  'fg': 'NONE',	 	 'style': 'NONE'}, 
			\ 'StatusLineTermNC':{ 'bg':'Black',     	 'fg': 'Black',	     'style': 'bold'}, 
			\ 'StatusLine' 	    :{ 'bg':'DarkBlack',     'fg': 'Teal',	 	 'style': 'NONE'}, 
			\ 'StatusLineNC'    :{ 'bg':'Black',     	 'fg': 'Black',	     'style': 'bold'}, 
			\ 'VertSplit' 	    :{ 'bg':'NONE',          'fg': 'Black',  	 'style': 'none'}, 
			\ 'LineNr' 		    :{ 'bg':'NONE',	 		 'fg': 'DarkGray3', 'style': 'NONE'}, 
			\ 'TabLine' 	    :{ 'bg':'MediumGray',    'fg': 'Black',	     'style': 'underline'}, 
			\ 'TabLineFill'     :{ 'bg':'NONE',          'fg': 'NONE',		 'style': 'reverse'}, 
			\ 'TabLineSel' 	    :{ 'bg':'LightWhite',    'fg': 'Black',	     'style': 'bold'}, 
			\ 'ToolbarLine'     :{ 'bg':'NONE',          'fg': 'NONE',		 'style': 'NONE'}, 
			\ 'ToolbarButton'   :{ 'bg':'MediumGray',    'fg': 'NONE',		 'style': 'bold'}, 
			\ 'Comment' 	    :{ 'bg':'NONE',  	 	 'fg': 'Cyan', 		 'style': 'NONE'}, 
			\ 'Pmenu' 		    :{ 'bg':'DarkBlack',     'fg': 'NONE',		 'style': 'NONE'}, 
			\ 'PmenuSel' 	    :{ 'bg':'Magenta',       'fg': 'DarkGray2',  'style': 'bold'}, 
			\ 'WildMenu' 	    :{ 'bg':'Yellow',        'fg': 'Black',	     'style': 'bold'}, 
			\ 'Number' 		    :{ 'bg':'NONE',  	     'fg': 'LightBlue',  'style': 'bold'}, 
			\ 'CursorLine' 	    :{ 'bg':'DarkBlack',     'fg': 'NONE',		 'style': 'NONE'}, 
			\ 'CursorLineNr'    :{ 'bg':'DarkGray',      'fg': 'DarkRed',	 'style': 'NONE'}, 
			\ 'ColorColumn'     :{ 'bg':'DarkBlack2',    'fg': 'NONE',		 'style': 'NONE'}, 
			\ 'Visual' 		    :{ 'bg':'DarkGray2',     'fg': 'NONE',		 'style': 'NONE'}, 
			\ 'VisualNOS' 	    :{ 'bg':'DarkGray2',     'fg': 'NONE',		 'style': 'NONE'}, 
			\})
endfunction

function! Clang()
	setlocal cindent
	setlocal cino=t0
	setlocal cino+=(0,W0
	setlocal cino+=:0

	setlocal shiftwidth=8 
	setlocal tabstop=8 

	setlocal noexpandtab 

	if g:TH3X_theme_active == 1
		syntax match cUserType            "\<[A-Za-z_0-9]\+_t\>"
		syntax match cCustomFunc          "\w\+\s*(\@="
		syntax match cDotSymbol /\./

		execute 'hi cCustomFunc     guifg=' . s:colors['Purple']['Hex']
		
		highlight NonText 		   guifg=#080808 guibg=NONE
		highlight SpecialKey	   guifg=#080808 guibg=NONE

		hi link  cUserType Type
	endif
endfunction

function! Asm()
	setlocal shiftwidth=8 
	setlocal tabstop=8 

	setlocal noexpandtab 

	if g:TH3X_theme_active == 1
		execute 'hi Identifier guifg=' . s:colors['Teal']['Hex']
	endif
endfunction

function! CPPlang()
	setlocal cindent
	setlocal shiftwidth=4
	setlocal tabstop=4 
endfunction


autocmd FileType c\|h call Clang()
autocmd BufRead,BufNewFile *.cc,*.hh call CPPlang()

autocmd BufRead,BufNewFile *.s,*.asm call Asm()

au InsertEnter * hi Cursor ctermbg=black ctermfg=black
au InsertLeave * hi Cursor ctermbg=red ctermfg=red

if g:TH3X_theme_active == 1
	call THEX_theme()
endif

if g:minimal == 1
	colorscheme quiet
	set background=dark
	hi Normal ctermbg=NONE
endif
