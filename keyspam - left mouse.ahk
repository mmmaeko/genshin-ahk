*f5::
    toggle := !toggle
    if (toggle) {
        SetTimer, Spam_Key, 47
    } else {
        SetTimer, Spam_Key, Off
    }
return

Spam_Key:
    Random, SleepTime, 0, 30
    Sleep SleepTime
    SendInput {click}
return
