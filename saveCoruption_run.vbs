'== get work area =================================================================================================================================================================================================================
Set fs = CreateObject("Scripting.FileSystemObject")
Set workLocationFile = fs.OpenTextFile(shell.ExpandEnvironmentStrings("%APPDATA%") + "\S4RA\out\execPath.dat")

workLocation = workLocationFile.ReadLine

workLocationFile.Close

'== move test =====================================================================================================================================================================================================================


