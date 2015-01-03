$packageName = '{{PackageName}}'
$packageVersion = '{{PackageVersion}}'
$32BitUrl = '{{DownloadUrl}}'
$64BitUrl = '{{DownloadUrlx64}}'
$global:installLocation = "C:\Program Files\Eclipse Foundation\$packageVersion"
$eclipseExecutable = "$global:installLocation\eclipse\eclipse.exe"

if(!$PSScriptRoot){ $PSScriptRoot = Split-Path $MyInvocation.MyCommand.Path -Parent }
. "$PSScriptRoot\OverwriteParameters030.ps1"

OverwriteParameters030

Install-ChocolateyZipPackage "$packageName" "$32BitUrl" "$global:installLocation" "$64BitUrl"

Install-ChocolateyDesktopLink "$eclipseExecutable"

Install-ChocolateyPinnedTaskBarItem "$eclipseExecutable"