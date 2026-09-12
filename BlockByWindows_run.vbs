If Not WScript.Arguments.Named.Exists("elevate") Then
    CreateObject("Shell.Application").ShellExecute WScript.FullName, _
        """" & WScript.ScriptFullName & """ /elevate", "", "runas", 1
    WScript.Quit
End If

'== admin code bellow ===========================================================================