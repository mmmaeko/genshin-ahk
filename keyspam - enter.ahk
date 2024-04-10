*f5::
    toggle := !toggle
    if (toggle) {
        SetTimer, Spam_Key, 47
    } else {
        SetTimer, Spam_Key, Off
    }
return

Spam_Key:
    Random, SleepTime, 0, 120
    Sleep SleepTime
    SendInput {enter}
return
