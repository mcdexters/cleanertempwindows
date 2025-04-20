Option Explicit

' Program facut de Zus Software v.0.1 2025
' Script pentru curățarea folderelor temporare

' Inițializează consola și afișează interfața
Dim objShell, strCommand
Set objShell = CreateObject("WScript.Shell")

' Creează o consolă mai stabilă cu titlul și culorile dorite
strCommand = "cmd /c title Zus Software v.0.1 2025 - Curățare Foldere Temporare & color 1F & cls & " & _
             "C:\Scripts\logo_ascii.bat & " & _
             "echo Apasati o tasta pentru a incepe... & pause > nul"
objShell.Run strCommand, 1, True

' Afișează procesul de încărcare fără a cauza flash-uri
strCommand = "cmd /c mode con: cols=90 lines=25 & color 1F & cls"
objShell.Run strCommand, 1, True

' Afișează animația de încărcare într-o singură fereastră de comandă
Dim wshShell, tempFile, fso, tempFilePath, i, loadingText
Set wshShell = CreateObject("WScript.Shell")
Set fso = CreateObject("Scripting.FileSystemObject")

' Creează un fișier temporar pentru a afișa animația de încărcare
tempFilePath = fso.GetSpecialFolder(2) & "\loading_animation.bat"
Set tempFile = fso.CreateTextFile(tempFilePath, True)

' Scrie comenzile pentru animația de încărcare în fișierul temporar
tempFile.WriteLine("@echo off")
tempFile.WriteLine("title Zus Software v.0.1 2025 - Curățare Foldere Temporare")
tempFile.WriteLine("color 1F")
tempFile.WriteLine("cls")
tempFile.WriteLine("call C:\Scripts\logo_ascii.bat")

For i = 0 To 100 Step 5
    loadingText = "echo Incarcare: " & i & "%%"
    tempFile.WriteLine(loadingText)
    tempFile.WriteLine("ping -n 2 127.0.0.1 > nul")
    tempFile.WriteLine("cls")
    tempFile.WriteLine("call C:\Scripts\logo_ascii.bat")
Next

tempFile.WriteLine("echo Incarcare: 100%%")
tempFile.WriteLine("echo.")
tempFile.WriteLine("echo Pregatire pentru curatare...")
tempFile.WriteLine("ping -n 2 127.0.0.1 > nul")
tempFile.Close()

' Execută fișierul temporar care conține animația de încărcare
objShell.Run "cmd /c " & tempFilePath, 1, True

' Șterge fișierul temporar după utilizare
If fso.FileExists(tempFilePath) Then
    fso.DeleteFile(tempFilePath)
End If

' Definește calea către scriptul PowerShell
Dim PowerShellScriptPath
PowerShellScriptPath = "C:\Scripts\CleanTempFolders.ps1"

' Verifică dacă scriptul PowerShell există
If Not fso.FileExists(PowerShellScriptPath) Then
    MsgBox "Scriptul PowerShell nu a fost găsit la calea: " & PowerShellScriptPath, vbExclamation, "Eroare"
    WScript.Quit
End If

' Execută PowerShell cu drepturi de administrator
Dim ShellApp
Set ShellApp = CreateObject("Shell.Application")
ShellApp.ShellExecute "powershell.exe", "-ExecutionPolicy Bypass -NoProfile -Command ""Start-Process powershell.exe -ArgumentList '-ExecutionPolicy Bypass -NoProfile -File """ & PowerShellScriptPath & """' -Verb RunAs""", "", "runas", 1


' Afișează mesajul de încheiere
WScript.Sleep 2000
strCommand = "cmd /c cls & call C:\Scripts\logo_ascii.bat & echo. & echo Multumim pentru utilizarea programului nostru! & echo www.zussoftware.ro & echo. & pause"
objShell.Run strCommand, 1, True

' Eliberează resursele
Set ShellApp = Nothing
Set fso = Nothing
Set objShell = Nothing
Set wshShell = Nothing
Set tempFile = Nothing

' Sfârșit script
