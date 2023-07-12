#Requires AutoHotkey v2.0
#SingleInstance Force
;@Ahk2Exe-SetDescription "Hide REAPER evaluation prompt at start"
;@Ahk2Exe-SetProductName "alphatoaster was here"
;@Ahk2Exe-AddResource empty.ico, 160
;@Ahk2Exe-AddResource empty.ico, 206
;@Ahk2Exe-AddResource empty.ico, 207
;@Ahk2Exe-AddResource empty.ico, 208 
;@Ahk2Exe-SetMainIcon empty.ico
reaperMainWindowID := "ahk_class REAPERwnd"
evaluationNoticeWindowID := "ahk_class #32770" 
/*
Update the evaluationNoticeWindowID variable if evaluation notice window ever changes its class.
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
    Run("reaper.exe" . " " . arguments)         ; Execute Reaper with all recieved arguments.
    if WinWait(reaperMainWindowID)              ; Wait for a REAPERs main window to show.
        if WinWait(evaluationNoticeWindowID,,5) ; Wait for an evaluation notice window. (timeout: 5s)
            WinHide(evaluationNoticeWindowID)   ; Hide the evaluation notice window. Yep, that's it.
} else {
    MsgBox("Please, put this executable/script in the same folder as your REAPER installation!", 
    "Can't found reaper.exe", 0x10)
}
