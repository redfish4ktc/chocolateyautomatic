$packageName = '{{PackageName}}'
$packageVersion = '{{PackageVersion}}'
$32BitUrl = '{{DownloadUrl}}'
$64BitUrl = '{{DownloadUrlx64}}'
$global:installLocation = "C:\Program Files\Eclipse Foundation\$packageVersion"

. "$PSScriptRoot\OverwriteParameters030.ps1"

OverwriteParameters030

Install-ChocolateyZipPackage "$packageName" "$32BitUrl" "$global:installLocation" "$64BitUrl"