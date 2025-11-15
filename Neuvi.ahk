Speed := 6000

~XButton2::
    Random, ct, 2500, 2650
    Click, Down
    Sleep SleepTime
    while GetKeyState("XButton2", "P")  ;Left
    {
        DllCall("mouse_event", "UInt", 0x0001, "Int", -Speed, "Int", 0, "UInt", 0, "UPtr", 0)
    }
    Click, Up
return

*f3::
    Reload
    Sleep 500
return
