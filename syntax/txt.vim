" Vim universal .txt syntax file
" For: 		Plaint text file
" By: 		Zheng (Linzheng@gmail.com)
" Date: 	2020.03.18
" ---------------------------------
"  https://vimhelp.org/usr_44.txt.html
" ---------------------------------

if version < 600
	syntax clear
elseif exists("b:current_syntax")
	finish
endif

syn case ignore

syn match node1 "^node1"
hi node1 guifg=maroon1 gui=bold,underline

" Sequence
syn match txt_seq "\( -> \|\t*-> \| -- \|^\t*-- \)"
syn match txt_seq "\C\(OPTION\)"
:hi txt_seq guifg=white guibg=MidnightBlue ctermfg=darkcyan ctermbg=black

" Action
syn match txt_act /\C\(SELECT\|CHECK\|CLICK\|PRESS\|HOLD\|ENABLE\)/
syn match txt_act /\C\(ADD\|SET\)/ contained
:hi txt_act guifg=RoyalBlue guibg=gray10 gui=bold

syn match txt_act_bg "\C\(ADD \|SET \)" contains=txt_act
:hi txt_act_bg guibg=black ctermbg=black

" End of sentence, special symbol.
syn match txt_list "[。:•●：★※⇒∴∵∞∑♠♣✓✗§≈≠≡≤≥▪▲△▼▽◆◇◘◙☆☺☻☼♀♂♪♫№■]"
syn match txt_list "\(\.$\|\. \|^\*\)"
:hi txt_list guifg=Yellow ctermfg=white

" Beginning of list.
syn match txt_list_simple "^\(\t\| \)*\(- \)"
hi txt_list_simple guifg=gray90 guibg=SkyBlue4 ctermfg=white

" Highlight list item
syn match txt_list_hl "^\(\t\| \)*\(\* \)"
hi txt_list_hl guifg=gray90 guibg=chocolate1 ctermfg=white

" Seperate line
syn region txt_line start="---------------------------------" end="$"
:hi txt_line guifg=darkgreen

" Number
syn match txt_num "\d"
:hi txt_num guifg=orange ctermfg=yellow

" Cite
syn region txt_cite matchgroup=txt_expl start="\"" end="\"" contains=txt_num oneline
hi txt_cite guifg=white gui=bold

" Explain
syn region txt_expl   start="("       end=")" contains=txt_err oneline
syn region txt_expl   start="（"       end="）" oneline
:hi txt_expl guifg=sienna4 ctermfg=Magenta

" Code block
syn region txt_code start="^ *\t*{{{" end="}}}" contains=txt_num
:hi txt_code guibg=#062847 ctermfg=blue ctermbg=white

" Comment. But if I write the whole document, don't use it.
syn region txt_cmt start="\t\+\(#\|\/\/\)" end="$" contains=txt_num,txt_act,txt_err oneline
syn region txt_cmt start="^\(#\|\/\/\|!\)" end="$" contains=txt_num,txt_act,txt_err,txt_emph,txt_wrn oneline
syn region txt_cmt start="^\/\*\_s"  end="\*\/" contains=txt_act,txt_num,txt_err
" for yaml
syn region txt_cmt start=" # " end="$" contains=txt_num,txt_act,txt_err oneline
:hi txt_cmt guifg=cyan3 ctermfg=white ctermbg=cyan

" Emphasis
syn region txt_emph start="<"        end=">" oneline
syn region txt_emph start=" : " end="$" oneline
syn region txt_emph start=" :$" end="$" oneline
syn region txt_emph start="\(\t\| \): " end="$" oneline
:hi txt_emph gui=underline guifg=magenta3 ctermfg=Cyan ctermbg=black

" Variable. Replace it with real environment.
syn region txt_var start="{"        end="}" oneline
syn match txt_var "e\.g\."
:hi txt_var gui=italic guifg=DodgerBlue ctermfg=Cyan ctermbg=black

" Title
syn region txt_title start="^【"       end="】$" oneline 
:hi txt_title guibg=chartreuse4 guifg=snow ctermfg=white ctermbg=green gui=bold

" Http link(content is not import)
syn match txt_link "\(http\|https\|ftp\|ssh\):\(\w\|[\-&=,?\:{}\%\+\(\)#\.\/]\)*"   contains=txt_seq,txt_var
syn match txt_link "[/][*][}][}][}][*][/]"
syn match txt_link "[/][*][{][{][{][*][/]"
:hi txt_link guifg=gray30 ctermfg=blue ctermbg=white

" Solution
syn match txt_sol "^\t*\C\(ISSUE\|SOL\|SOLUTION\|RESOLUTION\|RESULT\|USAGE\)"
syn match txt_sol "^\C[A-P]:" contained
syn match txt_sol "A:" contained
syn match txt_sol "^\C\(END_[A-P]$\)"
syn match txt_sol "^\C\(EOF$\)"
:hi txt_sol guifg=black guibg=green3 ctermfg=white ctermbg=LightRed

syn match txt_sol_bg "^[A-P]:\s*" contains=txt_sol
:hi txt_sol_bg guibg=black ctermbg=black

" Command
syn region txt_cmd start="^\t*\(##\|root\|nmcli\|virsh \#\)" end=" " oneline
syn region txt_cmd start="^grub" end=">" oneline
syn match txt_cmd "^[~][]]# "
syn match txt_cmd "[~][]]# "
syn region txt_cmd start="^\(user\|alice\|bob\):" end="\$" oneline
" router & switch
syn match txt_cmd "^\C\(R\|S\)\d\+[(]*\w*-*\w*[)]*\(#\|\>\)"
"syn match txt_cmd "^Switch.*\(#\|\>\)"
syn match txt_cmd "^Switch.*#" contains=txt_expl
" SQL
syn region txt_cmd start="^MariaDB" end="\]>" oneline
" win cmd
syn match txt_cmd "^\C[A-Z]:\\>"
" powershell
syn region txt_cmd start="^PS C:" end=">" oneline
syn region txt_cmd start="^PS /" end=">" oneline
syn region txt_cmd start="^localhost\*CLI" end=">" oneline
" adacel
syn region txt_cmd start="^\[atm@" end="\]\$" oneline
syn region txt_cmd start="^\[adacel@" end="\]\$" oneline
syn region txt_cmd start="^aurora02" end="\ \$" oneline
syn region txt_cmd start="^\[root@" end="#" oneline
" hp switch
syn match txt_cmd "^\[HPE.*\]"
syn match txt_cmd "^\[sw.*\]"
syn match txt_cmd "^]"
" esxi cmd
syn match txt_cmd "^\[root@.*:[~]\]" 	" esxi host
syn match txt_cmd "^dcli> " 	" esxi host

:hi txt_cmd guifg=red3 ctermfg=white ctermbg=lightyellow gui=bold

" Whole command line
syn region txt_cmd_all start="^\t*\C\(\$ \|##\|root\|PS \|nmcli\|virsh \)" end="$" contains=txt_cmd,txt_var,txt_cmt,txt_num oneline
syn region txt_cmd_all start="^\(r\|s\)\d\+" end="$" contains=txt_cmd,txt_var,txt_cmt,txt_num oneline
syn region txt_cmd_all start="^grub" end=">" contains=txt_cmd,txt_var,txt_cmt,txt_num oneline
syn region txt_cmd_all start="^\C[A-Z]:\\> " end="$" contains=txt_cmd,txt_var,txt_cmt,txt_num oneline
syn region txt_cmd_all start="^\[.*[]]\# " end="$" contains=txt_cmd,txt_var,txt_cmt,txt_num oneline
syn region txt_cmd_all start="^[~][]]\# " end="$" contains=txt_cmd,txt_var,txt_cmt,txt_num oneline

" For cisco switch
syn region txt_cmd_all start="^Switch.*#" end="$" contains=txt_cmd,txt_var,txt_cmt,txt_num,txt_expl oneline

" for HA test
syn region txt_cmd_all start="^node\d " end="$" contains=node1,txt_num,txt_cmd oneline

" for hp switch
syn region txt_cmd_all start="^]" end="$" contains=txt_cmd,txt_var,txt_cmt,txt_num oneline
syn region txt_cmd_all start="^\[sw\]" end="$" contains=txt_cmd,txt_var,txt_cmt,txt_num oneline
syn region txt_cmd_all start="^[[].*[]]" end="$" contains=txt_cmd,txt_var,txt_cmt,txt_num oneline

" for python
syn region txt_cmd_all start="^>>> " end="$" contains=txt_cmd,txt_var,txt_cmt,txt_num oneline

" for DCLI
syn region txt_cmd_all start="^dcli> " end="$" contains=txt_cmd,txt_var,txt_cmt,txt_num oneline

:hi txt_cmd_all gui=bold guifg=snow guibg=gray10 ctermfg=white ctermbg=lightyellow
:hi txt_cmd_all font=courier_new:h15:b

" Commande of user
syn match txt_cmd_user "^\[.*[]]\$ "
syn match txt_cmd_user "^\$ "
syn match txt_cmd_user "^[~][]]\$ "
" for hp switch
syn match txt_cmd_user "^>"
syn match txt_cmd_user "^<HPE>"
syn match txt_cmd_user "^<sw>"
:hi txt_cmd_user guifg=LightRed ctermfg=white ctermbg=lightgreen gui=bold

" Bold command line of user
syn region txt_cmd_user_all start="^\[.*[]]$ " end="$" contains=txt_cmd_user,txt_var,txt_cmt,txt_num oneline
syn region txt_cmd_user_all start="^\$ " end="$" contains=txt_cmd_user,txt_var,txt_cmt,txt_num oneline
" for hp switch
syn region txt_cmd_user_all start="^>" end="$" contains=txt_cmd_user,txt_var,txt_cmt,txt_num oneline
syn region txt_cmd_user_all start="^<sw>" end="$" contains=txt_cmd_user,txt_var,txt_cmt,txt_num oneline
syn region txt_cmd_user_all start="^>>>" end="$" contains=txt_cmd_user,txt_var,txt_cmt,txt_num oneline
:hi txt_cmd_user_all gui=bold guifg=snow guibg=gray10 ctermfg=white ctermbg=lightgreen font=courier_new:h15:b

" Citer, like email. Some option: and & or..
syn match txt_citer "^\(>>\|> \)"
syn match txt_citer "\C\(|\|^OR\|^\t*OR\| OR\|+\|&\|=\|AND\)"
:highlight txt_citer guifg=cyan ctermfg=Cyan

" Sub title
syn region txt_sous_title start="^\["       end="\]$" oneline 
:hi txt_sous_title guifg=green3 ctermfg=black ctermbg=green gui=underline

" Others
syn region txt_other start="^\t*\(>>\)" end="$" contains=txt_citer oneline
:hi txt_other guifg=white ctermfg=white ctermbg=lightyellow

" Question, not sure. Need to be verified.
syn region txt_q start="^??" end=" " oneline
syn match txt_q "^\t*\C\(SYMPTOM\|HOWTO\|CAUSE\|PROBLEM\|Q:\|??\|TO_DO\|TODO\)"
syn match txt_q "\t*??"
:hi txt_q guifg=white guibg=DarkOrchid3 ctermfg=white ctermbg=lightmagenta

" Error
syn match txt_err "\C\(NOT\|NO\|MUST\|SHOULD\|ERROR\|FAILED\|DISABLE\)" contained
:hi txt_err guifg=Gray90 guibg=red ctermfg=white ctermbg=LightRed

syn match txt_err_bg /NO / contains=txt_err
syn match txt_err_bg "\C\(NOT \|\tNO \|MUST \|SHOULD \|ERROR \|FAILED \|DISABLE \)" contains=txt_err
:hi txt_err_bg guibg=black ctermbg=black

" Warning
syn match txt_wrn /\C\(UNCHECK\|NOTE\|IMPORTANT\|WARNING\)/
:hi txt_wrn guifg=Gray10 guibg=orange1 ctermfg=white ctermbg=LightRed

" OK
syn match txt_OK "\C\(OK\)"
:hi txt_OK guifg=Green ctermfg=white ctermbg=LightRed

" Blank for future
syn match txt_blank "____"
:highlight txt_blank guifg=black guibg=Gray40 ctermfg=black ctermbg=grey

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" Color sample
" 	:highlight Comment guifg=#11f0c3 guibg=#ff00ff
" 	:hi Number guifg=black gui=bold guibg=lightgreen
"
" 	Red 	LightRed 	DarkRed
" 	Green 	LightGreen 	DarkGreen 	SeaGreen
" 	Blue 	LightBlue 	DarkBlue 	SlateBlue
" 	Cyan 	LightCyan 	DarkCyan
" 	Magenta LightMagenta 	DarkMagenta
" 	Yellow 	LightYellow 	DarkYellow
" 	Gray 	LightGray 	DarkGray
" 	Brown
" 	Black
" 	White
" 	Orange
" 	Purple
" 	Violet
"

" Following is from $VIMRUNTIME/rgb.txt with duplicate colors omitted.
" BEGIN_COLOR_LIST
"
" snow GhostWhite WhiteSmoke gainsboro FloralWhite OldLace linen
" AntiqueWhite PapayaWhip BlanchedAlmond bisque PeachPuff NavajoWhite
" moccasin cornsilk ivory LemonChiffon seashell honeydew MintCream azure
" AliceBlue lavender LavenderBlush MistyRose white black DarkSlateGray
" DimGray SlateGray LightSlateGray gray LightGray MidnightBlue navy
" NavyBlue CornflowerBlue DarkSlateBlue SlateBlue MediumSlateBlue
" LightSlateBlue MediumBlue RoyalBlue blue DodgerBlue DeepSkyBlue
" SkyBlue LightSkyBlue SteelBlue LightSteelBlue LightBlue PowderBlue
" PaleTurquoise DarkTurquoise MediumTurquoise turquoise cyan LightCyan
" CadetBlue MediumAquamarine aquamarine DarkGreen DarkOliveGreen
" DarkSeaGreen SeaGreen MediumSeaGreen LightSeaGreen PaleGreen
" SpringGreen LawnGreen green chartreuse MediumSpringGreen GreenYellow
" LimeGreen YellowGreen ForestGreen OliveDrab DarkKhaki khaki
" PaleGoldenrod LightGoldenrodYellow LightYellow yellow gold
" LightGoldenrod goldenrod DarkGoldenrod RosyBrown IndianRed SaddleBrown
" sienna peru burlywood beige wheat SandyBrown tan chocolate firebrick
" brown DarkSalmon salmon LightSalmon orange DarkOrange coral LightCoral
" tomato OrangeRed red HotPink DeepPink pink LightPink PaleVioletRed
" maroon MediumVioletRed VioletRed magenta violet plum orchid
" MediumOrchid DarkOrchid DarkViolet BlueViolet purple MediumPurple
" thistle snow1 snow2 snow3 snow4 seashell1 seashell2 seashell3
" seashell4 AntiqueWhite1 AntiqueWhite2 AntiqueWhite3 AntiqueWhite4
" bisque1 bisque2 bisque3 bisque4 PeachPuff1 PeachPuff2 PeachPuff3
" PeachPuff4 NavajoWhite1 NavajoWhite2 NavajoWhite3 NavajoWhite4
" LemonChiffon1 LemonChiffon2 LemonChiffon3 LemonChiffon4 cornsilk1
" cornsilk2 cornsilk3 cornsilk4 ivory1 ivory2 ivory3 ivory4 honeydew1
" honeydew2 honeydew3 honeydew4 LavenderBlush1 LavenderBlush2
" LavenderBlush3 LavenderBlush4 MistyRose1 MistyRose2 MistyRose3
" MistyRose4 azure1 azure2 azure3 azure4 SlateBlue1 SlateBlue2
" SlateBlue3 SlateBlue4 RoyalBlue1 RoyalBlue2 RoyalBlue3 RoyalBlue4
" blue1 blue2 blue3 blue4 DodgerBlue1 DodgerBlue2 DodgerBlue3
" DodgerBlue4 SteelBlue1 SteelBlue2 SteelBlue3 SteelBlue4 DeepSkyBlue1
" DeepSkyBlue2 DeepSkyBlue3 DeepSkyBlue4 SkyBlue1 SkyBlue2 SkyBlue3
" SkyBlue4 LightSkyBlue1 LightSkyBlue2 LightSkyBlue3 LightSkyBlue4
" SlateGray1 SlateGray2 SlateGray3 SlateGray4 LightSteelBlue1
" LightSteelBlue2 LightSteelBlue3 LightSteelBlue4 LightBlue1 LightBlue2
" LightBlue3 LightBlue4 LightCyan1 LightCyan2 LightCyan3 LightCyan4
" PaleTurquoise1 PaleTurquoise2 PaleTurquoise3 PaleTurquoise4 CadetBlue1
" CadetBlue2 CadetBlue3 CadetBlue4 turquoise1 turquoise2 turquoise3
" turquoise4 cyan1 cyan2 cyan3 cyan4 DarkSlateGray1 DarkSlateGray2
" DarkSlateGray3 DarkSlateGray4 aquamarine1 aquamarine2 aquamarine3
" aquamarine4 DarkSeaGreen1 DarkSeaGreen2 DarkSeaGreen3 DarkSeaGreen4
" SeaGreen1 SeaGreen2 SeaGreen3 SeaGreen4 PaleGreen1 PaleGreen2
" PaleGreen3 PaleGreen4 SpringGreen1 SpringGreen2 SpringGreen3
" SpringGreen4 green1 green2 green3 green4 chartreuse1 chartreuse2
" chartreuse3 chartreuse4 OliveDrab1 OliveDrab2 OliveDrab3 OliveDrab4
" DarkOliveGreen1 DarkOliveGreen2 DarkOliveGreen3 DarkOliveGreen4 khaki1
" khaki2 khaki3 khaki4 LightGoldenrod1 LightGoldenrod2 LightGoldenrod3
" LightGoldenrod4 LightYellow1 LightYellow2 LightYellow3 LightYellow4
" yellow1 yellow2 yellow3 yellow4 gold1 gold2 gold3 gold4 goldenrod1
" goldenrod2 goldenrod3 goldenrod4 DarkGoldenrod1 DarkGoldenrod2
" DarkGoldenrod3 DarkGoldenrod4 RosyBrown1 RosyBrown2 RosyBrown3
" RosyBrown4 IndianRed1 IndianRed2 IndianRed3 IndianRed4 sienna1 sienna2
" sienna3 sienna4 burlywood1 burlywood2 burlywood3 burlywood4 wheat1
" wheat2 wheat3 wheat4 tan1 tan2 tan3 tan4 chocolate1 chocolate2
" chocolate3 chocolate4 firebrick1 firebrick2 firebrick3 firebrick4
" brown1 brown2 brown3 brown4 salmon1 salmon2 salmon3 salmon4
" LightSalmon1 LightSalmon2 LightSalmon3 LightSalmon4 orange1 orange2
" orange3 orange4 DarkOrange1 DarkOrange2 DarkOrange3 DarkOrange4 coral1
" coral2 coral3 coral4 tomato1 tomato2 tomato3 tomato4 OrangeRed1
" OrangeRed2 OrangeRed3 OrangeRed4 red1 red2 red3 red4 DeepPink1
" DeepPink2 DeepPink3 DeepPink4 HotPink1 HotPink2 HotPink3 HotPink4
" pink1 pink2 pink3 pink4 LightPink1 LightPink2 LightPink3 LightPink4
" PaleVioletRed1 PaleVioletRed2 PaleVioletRed3 PaleVioletRed4 maroon1
" maroon2 maroon3 maroon4 VioletRed1 VioletRed2 VioletRed3 VioletRed4
" magenta1 magenta2 magenta3 magenta4 orchid1 orchid2 orchid3 orchid4
" plum1 plum2 plum3 plum4 MediumOrchid1 MediumOrchid2 MediumOrchid3
" MediumOrchid4 DarkOrchid1 DarkOrchid2 DarkOrchid3 DarkOrchid4 purple1
" purple2 purple3 purple4 MediumPurple1 MediumPurple2 MediumPurple3
" MediumPurple4 thistle1 thistle2 thistle3 thistle4 gray0 gray1 gray2
" gray3 gray4 gray5 gray6 gray7 gray8 gray9 gray10 gray11 gray12 gray13
" gray14 gray15 gray16 gray17 gray18 gray19 gray20 gray21 gray22 gray23
" gray24 gray25 gray26 gray27 gray28 gray29 gray30 gray31 gray32 gray33
" gray34 gray35 gray36 gray37 gray38 gray39 gray40 gray41 gray42 gray43
" gray44 gray45 gray46 gray47 gray48 gray49 gray50 gray51 gray52 gray53
" gray54 gray55 gray56 gray57 gray58 gray59 gray60 gray61 gray62 gray63
" gray64 gray65 gray66 gray67 gray68 gray69 gray70 gray71 gray72 gray73
" gray74 gray75 gray76 gray77 gray78 gray79 gray80 gray81 gray82 gray83
" gray84 gray85 gray86 gray87 gray88 gray89 gray90 gray91 gray92 gray93
" gray94 gray95 gray96 gray97 gray98 gray99 gray100 DarkGray DarkBlue
" DarkCyan DarkMagenta DarkRed LightGreen
" END_COLOR_LIST
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let b:current_syntax = "txt"
" vim: ts=8
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
