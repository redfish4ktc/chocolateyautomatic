$packageName = 'eclipse'
$packageVersion = '4.4.1'
$32BitUrl = 'http://eclipse.mirror.triple-it.nl/technology/epp/downloads/release/luna/SR1a/eclipse-jee-luna-SR1a-win32.zip'
$64BitUrl = 'http://eclipse.mirror.triple-it.nl/technology/epp/downloads/release/luna/SR1a/eclipse-jee-luna-SR1a-win32-x86_64.zip'
$global:installLocation = "C:\Program Files\Eclipse Foundation\$packageVersion"
$checksum = '56dd66b8615ebb618180d670e9df578e'
$checksumType = 'md5'
$checksum64 = 'e704e2fc68c93a6bd66a18904d32fe80'
$checksumType64 = 'md5'

if(!$PSScriptRoot){ $PSScriptRoot = Split-Path $MyInvocation.MyCommand.Path -Parent }
. "$PSScriptRoot\OverwriteParameters030.ps1"

OverwriteParameters030

Install-ChocolateyZipPackage "$packageName" "$32BitUrl" "$global:installLocation" "$64BitUrl" -checksum "$checksum" -checksumType "$checksumType" -checksum64 "$checksum64" -checksumType64 "$checksumType64"

$eclipseExecutable = "$global:installLocation\eclipse\eclipse.exe"

Install-ChocolateyDesktopLink "$eclipseExecutable"
Install-ChocolateyPinnedTaskBarItem "$eclipseExecutable"