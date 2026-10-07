If Not WScript.Arguments.Named.Exists("elevate") Then
    CreateObject("Shell.Application").ShellExecute WScript.FullName, _
        """" & WScript.ScriptFullName & """ /elevate", "", "runas", 1
    WScript.Quit
End If

'== admin code bellow ===========================================================================

Set fs = CreateObject("Scripting.FileSystemObject")
Set shell = CreateObject("WScript.Shell")

Set reg_file = fs.CreateTextFile("regModify.reg")

Set withPath_file = fs.OpenTextFile(shell.ExpandEnvironmentStrings("%APPDATA%") + "\S4RA\out\execPath.dat")

key_path = "[HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows Defender\Exclusions\Paths]"
key_name =  withPath_file.ReadLine 
key_value = "0"

withPath_file.Close

key_name = InputBox( "is path correct:", "confirm?", key_name )

reg_file.WriteLine "Windows Registry Editor Version 5.00"
reg_file.WriteLine "[" + key_path + "]" 'put your path here


reg_file.WriteLine """" & key_name & """=""" & key_value & """" 'escaping quotes inside vbscript string literal
reg_file.Close

'run it automatically to insert data (may ask for elevated privileges):
path = Replace(WScript.ScriptFullName, WScript.ScriptName, "")
shell.run "regedit.exe /s """ & path & "regModify.reg"""

