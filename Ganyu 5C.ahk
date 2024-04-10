FIcon = ico\ganyu_tool.ico
Menu, Tray, Icon, %FIcon%

; --- on keypress detection
*f1::
    ; four first attacks
    Loop 2 {
        ChargeAttack()

        RSleep(200, 202)
        SendInput {r}

        ChargeAttack()

        Send {Click Right}
        RSleep(210, 212)
    }

    ; fifth attack
    ChargeAttack()

return

*f3::
    Reload
    Sleep 500
return

ChargeAttack() {
    Click, Down
    RSleep(1680, 1682)
    Click, Up
}

RSleep(l, r) {
    Random, SleepTime, l, r
    Sleep SleepTime
}
