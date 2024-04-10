FIcon = ico\raiden_tool.ico
Menu, Tray, Icon, %FIcon%

; --- on keypress detection
*f1::
    ; active character is Raiden
    SendInput {q}
    Execute()
return

*f2::
    ; switch to Raiden
    Send {LAlt Down}
    RSleep(35, 55)
    SendInput {1}
    RSleep(355, 385)
    Send {LAlt Up}
    Execute()
return

*f3::
    Reload
    Sleep 500
return

; --- procedures
Execute() {
    RSleep(1950, 2000)

    ; Combo: N3CD * 3
    Loop 3 {
        ; 3 normal attacks
        Loop 3 {
            SendInput {click}
            RSleep(240, 250)
        }

        ; 1 charged attack
        Click, Down
        RSleep(650, 660)
        Click, Up
        RSleep(360, 370)

        ; 1 dash
        Send {LShift Down}
        RSleep(20, 30)
        Send {LShift Up}
        RSleep(420, 425)
    }

    ; Combo: N1C
    Click, Down
    RSleep(900, 950)
    Click, Up
}

RSleep(l, r) {
    Random, SleepTime, l, r
    Sleep SleepTime
}
