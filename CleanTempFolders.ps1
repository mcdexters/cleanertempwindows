# Program facut de Zus Software v.0.1 2025
# Script pentru curatarea folderelor temporare

# Configuram consola
$host.UI.RawUI.WindowTitle = "Zus Software v.0.1 2025 - Curatare Foldere Temporare"
$host.UI.RawUI.BackgroundColor = "DarkBlue"
$host.UI.RawUI.ForegroundColor = "White"
Clear-Host

# Logo ASCII Art Zus Software
$zusSoftwareLogo = @"
==========================================================================================
 ________   __  __  ____
/\_____  \ /\ \/\ \/\  _`\
\/____//'/'\ \ \ \ \ \,\L\_\
     //'/'  \ \ \ \ \/_\__ \
    //'/'___ \ \ \_\ \/\ \L\ \
    /\_______\\ \_____\ `\____\
    \/_______/ \/_____/\/_____/


 ____    _____   ____    ______  __      __  ______  ____    ____
/\  _`\ /\  __`\/\  _`\ /\__  _\/\ \  __/\ \/\  _  \/\  _`\ /\  _`\
\ \,\L\_\ \ \/\ \ \ \L\_\/_/\ \/\ \ \/\ \ \ \ \ \L\ \ \ \L\ \ \ \L\_\
 \/_\__ \\ \ \ \ \ \  _\/  \ \ \ \ \ \ \ \ \ \ \  __ \ \ ,  /\ \  _\L
   /\ \L\ \ \ \_\ \ \ \/    \ \ \ \ \ \_/ \_\ \ \ \/\ \ \ \\ \\ \ \L\ \
   \ `\____\ \_____\ \_\     \ \_\ \ `\___x___/\ \_\ \_\ \_\ \_\ \____/
    \/_____/\/_____/\/_/      \/_/  '\/__//__/  \/_/\/_/\/_/\/ /\/___/

                                               v1.0 2025
                                       [ www.zussoftware.ro ]
==========================================================================================                                                                                                                                                          
"@

# Afisam logo-ul
Write-Host $zusSoftwareLogo -ForegroundColor Cyan

# Afisam interfata initiala
Write-Host "`nProgram facut de Zus Software v.0.1 2025`n" -ForegroundColor Cyan
Write-Host "Apasati o tasta pentru pornire..." -ForegroundColor Yellow
$null = $host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")

# Afisam procesul de incarcare
Clear-Host
Write-Host $zusSoftwareLogo -ForegroundColor Cyan
for ($i = 0; $i -le 100; $i += 5) {
    Write-Host "`rIncarcare: $i%" -NoNewline -ForegroundColor Green
    Start-Sleep -Milliseconds 100
}
Write-Host "`n"

# Verificare daca scriptul ruleaza cu drepturi de administrator
$isAdmin = ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)
if (-not $isAdmin) {
    Write-Warning "Acest script necesita drepturi de administrator pentru a functiona corect."
    Write-Warning "Va rugam sa-l rulati ca administrator."
    exit
}

# Calea catre folderul TEMP global (C:\Windows\Temp)
$windowsTemp = "$env:SystemRoot\Temp"

# Obtine toti utilizatorii din sistem
$userProfiles = Get-ChildItem -Path "C:\Users" -Directory

# Functie pentru stergerea fisierelor si folderelor
function Clear-TempFolder {
    param (
        [string]$Path,
        [string]$Description = ""
    )

    if (Test-Path $Path) {
        Write-Output "Stergere: $Path $Description"
        try {
            Get-ChildItem -Path $Path -Recurse -Force -ErrorAction SilentlyContinue |
            Remove-Item -Recurse -Force -ErrorAction SilentlyContinue
            Write-Output "Folderul '$Path' a fost curatat."
        } catch {
            Write-Warning "Eroare la stergerea din '$Path': $_"
        }
    } else {
        Write-Warning "Folderul '$Path' nu exista."
    }
}

# Curata folderul TEMP Windows
Clear-TempFolder -Path $windowsTemp -Description "(Windows Temp)"

# Curata folderele TEMP pentru fiecare utilizator
foreach ($userProfile in $userProfiles) {
    $userTempPath = Join-Path -Path $userProfile.FullName -ChildPath "AppData\Local\Temp"
    Clear-TempFolder -Path $userTempPath -Description "(Utilizator: $($userProfile.Name))"
}

Write-Output ""
Write-Output "Curatarea folderelor temporare a fost finalizata."

# Afisam mesajul de incheiere
Write-Host "`n`nMultumim pentru utilizarea programului nostru!" -ForegroundColor Cyan
Write-Host "www.zussoftware.ro`n" -ForegroundColor Yellow
Write-Host "Apasati o tasta pentru a inchide..." -ForegroundColor Gray
$null = $host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
