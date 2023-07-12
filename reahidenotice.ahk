﻿#Requires AutoHotkey v2.0
#SingleInstance Force
;@Ahk2Exe-SetDescription "Hide REAPER activation prompt at start"
;@Ahk2Exe-SetProductName "alphatoaster was here"
;@Ahk2Exe-AddResource empty.ico, 160
;@Ahk2Exe-AddResource empty.ico, 206
;@Ahk2Exe-AddResource empty.ico, 207
;@Ahk2Exe-AddResource empty.ico, 208 
;@Ahk2Exe-SetMainIcon empty.ico
aboutReaperWindowID := "ahk_class #32770" 
/*
Update the aboutReaperWindowID variable if activation notice window ever changes its class.
You can use AutoHotkey Window Spy to get new ahk_class, bundled with your AHK installation. 
For more information, please refer to: https://www.autohotkey.com/docs/v2/misc/WinTitle.htm
*/

A_ArgsAsString() {
    /* 
    A_ArgsToString function. Converts the internal A_Args array, containing all recieved 
    command line arguments into string, handling the quotation marks of paths with spaces.
    */
    S_Args := ""
    for argument in A_Args
        if InStr(argument, ' ')
            S_Args .= '"' StrReplace(argument, '"') . '"'
        else
            S_Args .= argument . " "
    return S_Args
}

arguments := A_ArgsAsString()

if FileExist("reaper.exe") {
    Run("reaper.exe" . " " . arguments) ; Execute Reaper with all recieved arguments
    if WinWait(aboutReaperWindowID)     ; Wait for an activation notice window
        WinHide(aboutReaperWindowID)    ; Hide the window. Yep, that's it.
} else {
    MsgBox("Please, put this executable in the same folder as your REAPER installation!", 
    "Can't found reaper.exe", 0x10)
}
