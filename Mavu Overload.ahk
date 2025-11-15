FIcon = ico\ganyu_tool.ico
Menu, Tray, Icon, %FIcon%

; --- on keypress detection
$`::
    ; first rotation: 2x ChargeDash -> Finisher
    ChargeDash(false)
    ChargeDash(true)

    ; second rotation: ChargeDash -> Charge2Dash + Finisher
    ChargeDash(false)
    Charge2Dash()

    ; third rotation: ChargeDash -> Charge2Dash + Finisher
    ChargeDash(false)
    Charge2Dash()
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

Charge2Dash() {
    Random, wait_time, 70, 80
    Random, hold_time, 1100, 1115

    ; pretty similar to ChargeDash,
    ; but hold longer so as to output the 2nd charge attack
    Click, Down
    Sleep wait_time
    Send {Click Right}
    Sleep hold_time
    Click, Up

    Sleep 2100 - hold_time
}

RSleep(t) {
    Random, SleepTime, t, t + 5
    Sleep SleepTime
}
