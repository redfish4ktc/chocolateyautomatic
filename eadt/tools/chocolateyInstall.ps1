$packageName = '{{PackageName}}'
$packageVersion = '{{PackageVersion}}'
$32BitUrl = '{{DownloadUrl}}'
$64BitUrl = '{{DownloadUrlx64}}'
$global:installLocation = "C:\Google\$packageVersion"
. "$PSScriptRoot\OverwriteParameters030.ps1"

OverwriteParameters030

Install-ChocolateyZipPackage "$packageName" "$32BitUrl" "$global:installLocation" "$64BitUrl"

$eadtHome = (gci "$global:installLocation\adt-bundle-windows-x86_64-*\").FullName | sort -Descending | Select -first 1
$sdkManagerExecutable = "$eadtHome\SDK Manager.exe"
$eclipseExecutable = "$eadtHome\eclipse\eclipse.exe"

Rename-Item -path "$eclipseExecutable" -newName "Eclipse ADT.exe"

$eadtExecutable = "$eadtHome\eclipse\Eclipse ADT.exe"

Install-ChocolateyDesktopLink "$eadtExecutable"
Install-ChocolateyDesktopLink "$sdkManagerExecutable"

Install-ChocolateyPinnedTaskBarItem "$eadtExecutable"
Install-ChocolateyPinnedTaskBarItem "$sdkManagerExecutable"

Install-ChocolateyPath "$eadtHome\sdk\platform-tools"
Install-ChocolateyPath "$eadtHome\sdk\tools"