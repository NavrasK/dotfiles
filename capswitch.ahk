#InstallKeybdHook

;Capswitch
SetCapsLockState AlwaysOff
Capslock::
send {Esc down}
Sleep 10
send {Esc up}
return

;BetterNumLock
SetNumLockState, AlwaysOn
NumLock::send {Tab}

NumLock & NumpadDiv::send (
NumLock & NumpadMult::send )
NumLock & NumpadSub::send {=}
NumLock & NumpadAdd::send {$}
NumLock & NumpadEnter::send {Backspace}
NumLock & NumpadDot::send {Delete}

NumLock & Numpad0::send {Space}
NumLock & Numpad1::send {End}
NumLock & Numpad2::send {Down}
NumLock & Numpad3::send {PgDn}
NumLock & Numpad4::send {Left}
NumLock & Numpad5::send {Click}
NumLock & Numpad6::send {Right}
NumLock & Numpad7::send {Home}
NumLock & Numpad8::send {Up}
NumLock & Numpad9::send {PgUp}
