# Script pentru generarea capturilor de ecran demonstrative
# Acest script va genera imagini pentru GitHub

# Culorile Zus Software (estimare)
$backgroundColor = "DarkBlue"
$textColor = "White"
$accentColor = "Cyan"

# Creare logo simplu folosind PowerShell și .NET
Add-Type -AssemblyName System.Drawing
$logoWidth = 400
$logoHeight = 200
$logo = New-Object System.Drawing.Bitmap $logoWidth, $logoHeight
$graphics = [System.Drawing.Graphics]::FromImage($logo)
$graphics.Clear([System.Drawing.Color]::FromName($backgroundColor))

# Adaugă text logo
$font = New-Object System.Drawing.Font "Arial", 28, [System.Drawing.FontStyle]::Bold
$brush = New-Object System.Drawing.SolidBrush ([System.Drawing.Color]::FromName($accentColor))
$format = [System.Drawing.StringFormat]::GenericDefault
$format.Alignment = [System.Drawing.StringAlignment]::Center
$format.LineAlignment = [System.Drawing.StringAlignment]::Center
$logoText = "Zus Software"
$rect = New-Object System.Drawing.RectangleF(0, 40, $logoWidth, 60)
$graphics.DrawString($logoText, $font, $brush, $rect, $format)

# Adaugă versiunea și anul
$font2 = New-Object System.Drawing.Font "Arial", 16, [System.Drawing.FontStyle]::Regular
$brush2 = New-Object System.Drawing.SolidBrush ([System.Drawing.Color]::FromName("White"))
$rect2 = New-Object System.Drawing.RectangleF(0, 100, $logoWidth, 40)
$versionText = "Cleaner Temp v0.1 (2025)"
$graphics.DrawString($versionText, $font2, $brush2, $rect2, $format)

# Salvare logo
$logoPath = ".\images\zus_logo.png"
$logo.Save($logoPath, [System.Drawing.Imaging.ImageFormat]::Png)
$graphics.Dispose()
$logo.Dispose()

Write-Host "Logo creat: $logoPath"

# Generare captură ecran inițială pentru aplicație
$appWidth = 800
$appHeight = 400
$screenshot1 = New-Object System.Drawing.Bitmap $appWidth, $appHeight
$graphics1 = [System.Drawing.Graphics]::FromImage($screenshot1)
$graphics1.Clear([System.Drawing.Color]::FromName($backgroundColor))

# Adaugă titlu
$font3 = New-Object System.Drawing.Font "Consolas", 22, [System.Drawing.FontStyle]::Bold
$rect3 = New-Object System.Drawing.RectangleF(0, 20, $appWidth, 50)
$titleText = "Zus Software v0.1 2025 - Curățare Foldere Temporare"
$graphics1.DrawString($titleText, $font3, $brush2, $rect3, $format)

# Adaugă prompt
$font4 = New-Object System.Drawing.Font "Consolas", 16, [System.Drawing.FontStyle]::Regular
$rect4 = New-Object System.Drawing.RectangleF(0, 100, $appWidth, 40)
$promptText = "Apasati o tasta pentru a incepe..."
$graphics1.DrawString($promptText, $font4, $brush, $rect4, $format)

# Salvare screenshot1
$screenshot1Path = ".\images\app_start.png"
$screenshot1.Save($screenshot1Path, [System.Drawing.Imaging.ImageFormat]::Png)
$graphics1.Dispose()
$screenshot1.Dispose()

Write-Host "Screenshot inițial creat: $screenshot1Path"

# Generare captură ecran loading
$screenshot2 = New-Object System.Drawing.Bitmap $appWidth, $appHeight
$graphics2 = [System.Drawing.Graphics]::FromImage($screenshot2)
$graphics2.Clear([System.Drawing.Color]::FromName($backgroundColor))

# Adaugă titlu
$graphics2.DrawString($titleText, $font3, $brush2, $rect3, $format)

# Adaugă bara de progres
$loadingFont = New-Object System.Drawing.Font "Consolas", 18, [System.Drawing.FontStyle]::Bold
$loadingRect = New-Object System.Drawing.RectangleF(0, 120, $appWidth, 40)
$loadingText = "Incarcare: 75%"
$graphics2.DrawString($loadingText, $loadingFont, $brush, $loadingRect, $format)

# Desenează bară de progres
$progressWidth = 600
$progressHeight = 30
$progressX = ($appWidth - $progressWidth) / 2
$progressY = 180
$progressBg = New-Object System.Drawing.Rectangle $progressX, $progressY, $progressWidth, $progressHeight
$progressFg = New-Object System.Drawing.Rectangle $progressX, $progressY, ($progressWidth * 0.75), $progressHeight
$bgBrush = New-Object System.Drawing.SolidBrush ([System.Drawing.Color]::FromName("Gray"))
$fgBrush = New-Object System.Drawing.SolidBrush ([System.Drawing.Color]::FromName("Green"))

$graphics2.FillRectangle($bgBrush, $progressBg)
$graphics2.FillRectangle($fgBrush, $progressFg)

# Salvare screenshot2
$screenshot2Path = ".\images\app_loading.png"
$screenshot2.Save($screenshot2Path, [System.Drawing.Imaging.ImageFormat]::Png)
$graphics2.Dispose()
$screenshot2.Dispose()

Write-Host "Screenshot loading creat: $screenshot2Path"

# Generare captură ecran rezultate
$screenshot3 = New-Object System.Drawing.Bitmap $appWidth, $appHeight
$graphics3 = [System.Drawing.Graphics]::FromImage($screenshot3)
$graphics3.Clear([System.Drawing.Color]::FromName($backgroundColor))

# Adaugă titlu
$graphics3.DrawString($titleText, $font3, $brush2, $rect3, $format)

# Adaugă text rezultate
$resultsFont = New-Object System.Drawing.Font "Consolas", 14, [System.Drawing.FontStyle]::Regular
$resultsBrush = New-Object System.Drawing.SolidBrush ([System.Drawing.Color]::FromName("White"))

$line1 = "Stergere: C:\Windows\Temp (Windows Temp)"
$line2 = "Folderul 'C:\Windows\Temp' a fost curatat."
$line3 = "Stergere: C:\Users\Administrator\AppData\Local\Temp (Utilizator: Administrator)"
$line4 = "Folderul 'C:\Users\Administrator\AppData\Local\Temp' a fost curatat."
$line5 = "Curatarea folderelor temporare a fost finalizata."
$line6 = ""
$line7 = "Multumim pentru utilizarea programului nostru!"
$line8 = "www.zussoftware.ro"

$format2 = [System.Drawing.StringFormat]::GenericDefault
$format2.Alignment = [System.Drawing.StringAlignment]::Near

$rect5 = New-Object System.Drawing.RectangleF(50, 100, $appWidth-100, 30)
$graphics3.DrawString($line1, $resultsFont, $resultsBrush, $rect5, $format2)

$rect6 = New-Object System.Drawing.RectangleF(50, 130, $appWidth-100, 30)
$graphics3.DrawString($line2, $resultsFont, $resultsBrush, $rect6, $format2)

$rect7 = New-Object System.Drawing.RectangleF(50, 160, $appWidth-100, 30)
$graphics3.DrawString($line3, $resultsFont, $resultsBrush, $rect7, $format2)

$rect8 = New-Object System.Drawing.RectangleF(50, 190, $appWidth-100, 30)
$graphics3.DrawString($line4, $resultsFont, $resultsBrush, $rect8, $format2)

$rect9 = New-Object System.Drawing.RectangleF(50, 220, $appWidth-100, 30)
$graphics3.DrawString($line5, $resultsFont, $resultsBrush, $rect9, $format2)

$thankyouRect = New-Object System.Drawing.RectangleF(0, 280, $appWidth, 40)
$thankyouFont = New-Object System.Drawing.Font "Consolas", 16, [System.Drawing.FontStyle]::Bold
$thankyouBrush = New-Object System.Drawing.SolidBrush ([System.Drawing.Color]::FromName("Cyan"))
$graphics3.DrawString($line7, $thankyouFont, $thankyouBrush, $thankyouRect, $format)

$websiteRect = New-Object System.Drawing.RectangleF(0, 320, $appWidth, 40)
$websiteFont = New-Object System.Drawing.Font "Consolas", 14, [System.Drawing.FontStyle]::Regular
$websiteBrush = New-Object System.Drawing.SolidBrush ([System.Drawing.Color]::FromName("Yellow"))
$graphics3.DrawString($line8, $websiteFont, $websiteBrush, $websiteRect, $format)

# Salvare screenshot3
$screenshot3Path = ".\images\app_results.png"
$screenshot3.Save($screenshot3Path, [System.Drawing.Imaging.ImageFormat]::Png)
$graphics3.Dispose()
$screenshot3.Dispose()

Write-Host "Screenshot rezultate creat: $screenshot3Path"

Write-Host "Toate imaginile au fost generate cu succes!"
