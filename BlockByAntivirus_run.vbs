If Not WScript.Arguments.Named.Exists("elevate") Then
    CreateObject("Shell.Application").ShellExecute WScript.FullName, _
        """" & WScript.ScriptFullName & """ /elevate", "", "runas", 1
    WScript.Quit
End If

'== admin code bellow ===========================================================================

Set fs = CreateObject("Scripting.FileSystemObject")
Set shell = CreateObject("WScript.Shell")

'Set reg_file = fs.CreateTextFile("regModify.reg")

key_path = "[HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows Defender\Exclusions\Paths]"
key_name = shell.CurrentDirectory 'must be escaped inside the .reg file, so they enter as single slash in the registry
key_value = "RUNASADMIN"

'reg_file.WriteLine "Windows Registry Editor Version 5.00"
'reg_file.WriteLine key_path 'put your path here


'reg_file.WriteLine """" & key_name & """=""" & key_value & """" 'escaping quotes inside vbscript string literal
'reg_file.Close

'run it automatically to insert data (may ask for elevated privileges):
'path = Replace(WScript.ScriptFullName, WScript.ScriptName, "")
'shell.run "regedit.exe /s """ & path & "regModify.reg"""

data = InputBox( key_path, key_name, key_value )