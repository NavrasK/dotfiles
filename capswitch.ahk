#InstallKeybdHook
SetCapsLockState AlwaysOff
Capslock::send {Esc}
;Send {LControl Down}
;KeyWait, CapsLock
;Send {LControl Up}
;if ( A_PriorKey = "CapsLock" ) {
;    Send {Esc}
;}
;return

;BetterNumLock
SetNumLockState, AlwaysOn
NumLock::send {Tab}

NumLock & NumpadDiv::send (
NumLock & NumpadMult::send )
NumLock & NumpadSub::send {=}
NumLock & NumpadEnter::send {Backspace}
