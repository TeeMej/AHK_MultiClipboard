#SingleInstance Force

title = ClipboardManager 0.1.0.1


^+v::
	tmpCbp := ClipboardAll
	;Transform, Clipboard, Unicode, %element%
	clipboard = %clipboard%
;	Send %clipboard%
Sleep, 500
	Send ^v
Sleep, 500
	clipboard := tmpCbp

return

^+i::
	tmpCbp := ClipboardAll
	clipboard = %clipboard%
	link = %clipboard%
	FoundPos := RegExMatch(link, "%([a-zA-Z0-9]{2})" , FoundString)
	While, FoundPos > 0 {
		Hex := StrReplace(FoundString, "%" , "0x")
		SetFormat Integer, H
		HexNum := Hex + 0
		SetFormat Integer, D
		DecNum := HexNum + 0
		;Char := Chr(%DecNum%)
		Char := Chr(146)
		MsgBox, "Print!"
		Send, % Chr(146)
		Send, %Char%

		link := StrReplace(link, FoundString, Char)
		FoundPos := RegExMatch(link, "%([a-zA-Z0-9]{2})" , FoundString)
	}
	MsgBox, , "Found", "Pos: %FoundPos%, Str: %FoundString%, Hex: %Hex%, HexNum: %HexNum%, DecNum: %DecNum%, Chr: '%Char%'`n%link%"
	;Send, %Char%
	;clipboard = %Char%
	;xxx := Chr(195)
	;clipboard = %xxx%
	/* 
	While, FoundPos > 0 {

	}
	*/
return
