# Zus Software - Utilitar de Curățare Foldere Temporare v0.1 (2025)

## Descriere
Acest utilitar este conceput pentru a curăța folderele temporare din sistemul Windows, eliberând spațiu pe disc și îmbunătățind performanța sistemului. 

Programul oferă o interfață prietenoasă cu utilizatorul, cu indicatoare de progres și feedback vizual.

## Repository GitHub
Repository-ul codului sursă este disponibil la:
https://github.com/mcdexters/cleanertempwindows.git

### Clonare repository
```bash
git clone https://github.com/mcdexters/cleanertempwindows.git
```

## Componente
Utilitarul include două scripturi principale:

1. **CleanTempFolders.vbs** - Script VBScript
   - Oferă o interfață grafică pentru utilizator
   - Rulează scriptul PowerShell cu drepturi de administrator
   - Afișează un indicator de progres pentru utilizator
   
2. **CleanTempFolders.ps1** - Script PowerShell
   - Efectuează curățarea propriu-zisă a folderelor temporare
   - Curăță folderul Windows Temp (C:\Windows\Temp)
   - Curăță folderele Temp pentru toți utilizatorii (C:\Users\{user}\AppData\Local\Temp)

## Cerințe de sistem
- Windows 10/11
- PowerShell 5.1 sau mai recent
- Drepturi de administrator pentru curățarea folderelor sistem

## Cum se utilizează

### Metoda 1 - Utilizare script VBS (Recomandat)
1. Faceți dublu clic pe fișierul `CleanTempFolders.vbs`
2. Apăsați o tastă pentru a începe procesul
3. Așteptați finalizarea animației de încărcare
4. Confirmați solicitarea UAC pentru a acorda drepturi de administrator
5. Așteptați finalizarea procesului de curățare

### Metoda 2 - Utilizare direct script PowerShell
1. Faceți clic dreapta pe fișierul `CleanTempFolders.ps1`
2. Selectați "Rulare cu PowerShell" (cu drepturi de Administrator)
3. Apăsați o tastă pentru a începe
4. Așteptați finalizarea procesului de curățare

## Note importante
- Scriptul necesită drepturi de administrator pentru a curăța anumite foldere temporare
- Fișierele utilizate în mod activ de sistem nu vor fi șterse
- Este recomandat să închideți toate aplicațiile înainte de a rula acest utilitar

## Despre
Program dezvoltat de Zus Software v.0.1 (2025)
www.zussoftware.ro

© 2025 Zus Software. Toate drepturile rezervate.
