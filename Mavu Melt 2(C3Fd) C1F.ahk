FIcon = ico\ganyu_tool.ico
Menu, Tray, Icon, %FIcon%

; --- on keypress detection
$`::
    Charge3Dash(false)
    Charge3Dash(true)
return

*f3::
    Reload
    Sleep 500
return

Charge3Dash(isFollowUp) {
    Random, wait_time, 70, 80
    Random, hold_time, 1920, 1935
    Random, sleep_time, 1250, 1269

    if isFollowUp {
        hold_time := hold_time + 10
    }

    Click, Down
    Sleep wait_time
    Send {Click Right}
    Sleep hold_time
    Click, Up

    Sleep sleep_time
}
