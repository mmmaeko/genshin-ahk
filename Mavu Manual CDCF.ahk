FIcon = ico\ganyu_tool.ico
Menu, Tray, Icon, %FIcon%

; --- on keypress detection
$`::
    ChargeDash(false)
return

*f3::
    Reload
    Sleep 500
return

ChargeDash(waitForFinisher) {
    ; total time: 170-195ms
    ; total suffix wait time:
    ;  - if waitForFinisher: 1450ms - (70-80ms + 100-115ms) = 1,255-1,280ms
    ;  - if not waitForFinisher: 300ms - (70-80ms + 100-115ms) = 105-130ms
    Random, wait_time, 70, 80
    Random, pseudo_hold_time, 100, 115

    Click, Down
    Sleep wait_time
    Send {Click Right}
    Sleep pseudo_hold_time
    Click, Up

    if (waitForFinisher) {
        ; wait for the finisher animation to finish
        Sleep 1500 - pseudo_hold_time
    } else {
        ; wait before next ChargeDash
        Sleep 300 - pseudo_hold_time
    }
}
