$packageName = 'eclipse'
$packageVersion = '4.4.1'
$32BitUrl = 'http://eclipse.mirror.triple-it.nl/technology/epp/downloads/release/luna/SR1/eclipse-jee-luna-SR1-win32.zip'
$64BitUrl = 'http://eclipse.mirror.triple-it.nl/technology/epp/downloads/release/luna/SR1/eclipse-jee-luna-SR1-win32-x86_64.zip'
$global:installLocation = "C:\Program Files\Eclipse Foundation\$packageVersion"

. "$PSScriptRoot\OverwriteParameters030.ps1"

OverwriteParameters030

Install-ChocolateyZipPackage "$packageName" "$32BitUrl" "$global:installLocation" "$64BitUrl"