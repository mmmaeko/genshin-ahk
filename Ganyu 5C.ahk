FIcon = ico\ganyu_tool.ico
Menu, Tray, Icon, %FIcon%

; --- on keypress detection
$`::
    SendInput {e}
    RSleep(480)

    ; four first attacks
    Loop 2 {
        ChargeAttack(1675)

        RSleep(200)
        SendInput {r}

        ChargeAttack(1675)

        Send {Click Right}
        RSleep(200)
    }

    ; fifth attack
    ChargeAttack(1668)

return

*f3::
    Reload
    Sleep 500
return

ChargeAttack(t) {
    Random, ct, t, t + 4
    Click, Down
    RSleep(ct)
    Click, Up
}

RSleep(t) {
    Random, SleepTime, t, t + 4
    Sleep SleepTime
}
