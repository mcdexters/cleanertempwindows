# Script pentru generarea unui logo ASCII art pentru Zus Software
# Va fi folosit în scripturile principale și în consola aplicației

$logo = @"
==========================================================================================
  ________ _    _  _______    _______  _____  ______ _________          __     _______  ______
 |___  /  | |  | |/ ____\ \  / / ____|/ ____|/ __  /|__   __\ \        / /\   |  __ \ \|  ____|
    / /   | |  | | (___  \ \/ / (___ | |    | |  | |  | |   \ \  /\  / /  \  | |__) | | |__
   / /    | |  | |\___ \  \  / \___ \| |    | |  | |  | |    \ \/  \/ / /\ \ |  _  /  |  __|
  / /__   | |__| |____) |  | |  ___) | |____| |__| |  | |     \  /\  / ____ \| | \ \  | |____
 /_____|   \____/|_____/   |_| |_____/ \_____\____/   |_|      \/  \/_/    \_\_|  \_\ |______|
                                                                                     
                                          v0.1 2025
                        [ www.zussoftware.ro ]
==========================================================================================
"@

# Afișează logo-ul
Write-Host $logo -ForegroundColor Cyan

# Salvează logo-ul într-un fișier text
$logo | Out-File -FilePath ".\images\zus_ascii_logo.txt" -Encoding utf8

Write-Host "`nLogo-ul ASCII art a fost generat și salvat în fișierul zus_ascii_logo.txt"

# Funcție pentru a afișa logo-ul în consola PowerShell
function Show-ZusLogo {
    Write-Host $logo -ForegroundColor Cyan
}

# Exportă funcția pentru a putea fi utilizată în alte scripturi
Export-ModuleMember -Function Show-ZusLogo
