If Not WScript.Arguments.Named.Exists("elevate") Then
    CreateObject("Shell.Application").ShellExecute WScript.FullName, _
        """" & WScript.ScriptFullName & """ /elevate", "", "runas", 1
    WScript.Quit
End If

'== admin code bellow ===========================================================================

Set objShell = WScript.CreateObject("WScript.Shell")

'objShell.Run( "reg add ""HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\Server"" /v ""DisplayName"" /t REG_SZ /d Server" )