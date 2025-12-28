FIcon = ico\ganyu_tool.ico
Menu, Tray, Icon, %FIcon%

; --- on keypress detection
$`::
    SendInput {e}
    Random, pre_combo_time, 350, 360
    Sleep pre_combo_time

    ; first part: 2N2D 2NQ
    N2D()
    N2D()
    N2Q()

    ; second part: 2(2N2D N3W)
    N2D()
    N2D()
    N3W()

    N2D()
    N2D()
    N3W()

    ; third part: N2CD N2D N3W
    N2CD()
    N2D()
    N3W()

    ; final part: 2N2D N2
    N2D()
    N2D()
    N2()
return

*f3::
    Reload
    Sleep 500
return

N2D() {
    ; Performs 2 normal attacks, then dash immediately.
    ; The entire sequence takes exactly 450ms. I can test if a variance of
    ; ~20-30ms affects the output, but let's leave that for later.
    total_time := 450
    Random, n1_dur, 100, 110
    Random, n2_dur, 160, 170
    dash_dur := total_time - (n1_dur + n2_dur)

    NormalAttack(n1_dur)
    NormalAttack(n2_dur)
    Send {Click Right}
    Sleep dash_dur
}

N2Q() {
    ; Performs 2 normal attacks, followed by a voidrift collect.
    total_time := 560
    Random, n1_dur, 100, 110
    Random, n2_dur, 190, 200
    collect_dur := total_time - (n1_dur + n2_dur)

    ; simple 2 hit combo
    NormalAttack(n1_dur)
    NormalAttack(n2_dur)

    ; collect voidrift
    Send {q}
    Sleep collect_dur
}

N3W() {
    ; Performs 3 normal attacks, followed by a walk cancel.
    Random, n1_dur, 100, 110
    ; Random, n2_dur, 230, 240
    Random, n2_dur, 260, 270
    Random, n3_dur, 390, 400

    ; simple 3 hit combo
    NormalAttack(n1_dur)
    NormalAttack(n2_dur)
    NormalAttack(n3_dur)

    ; the infamous walk cancel
    Send {w Down}
    Sleep 450
    Send {w Up}
    Sleep 100
}

N2CD() {
    Random, n1_dur, 100, 110
    Random, n2_dur, 190, 200

    ; simple 2 hit combo
    NormalAttack(n1_dur)
    NormalAttack(n2_dur)

    ; charged attack
    Click, Down
    Random, charge_time, 480, 490
    Sleep charge_time
    Click, Up

    ; dash cancel
    Send {Click Right}
    Sleep 350
}

N2() {
    ; simple finisher: 2 normal attacks
    Random, n1_dur, 100, 110
    ; Random, n2_dur, 190, 200

    ; simple 2 hit combo
    NormalAttack(n1_dur)
    ; NormalAttack(n2_dur)
}

NormalAttack(duration) {
    Random, down_time, 10, 20
    if (duration < down_time) {
        down_time := duration
    }

    Click, Down
    Sleep down_time
    Click, Up
    Sleep, duration - down_time
}
