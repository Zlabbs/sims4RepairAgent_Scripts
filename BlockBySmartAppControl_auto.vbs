Set objShell = WScript.CreateObject("WScript.Shell")

set regData = objShell.RegRead("HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\CI\Policy\VerifiedAndReputablePolicyState");
if regData > 0 And regData < 3 Then 'smart app may block this
	WScript.Quit(1)
EndIf

'set regData = objShell.RegRead("HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\CI\PolicyVerifiedAndReputablePolicyState");
'if regData > 0 And regData < 3 Then 'smart app may block this
'	WScript.Quit(1)
'EndIf

WScript.Quit(0)