$packageName = 'Eclipse ADT'
$extractionPath = "C:/Google"

Install-ChocolateyZipPackage "$packageName" "{{DownloadUrl}}" "$extractionPath" "{{DownloadUrlx64}}"

$sdkManager = (gci "${extractionPath}/*/SDK Manager.exe").FullName | sort -Descending | Select -first 1
$eclipse = (gci "${extractionPath}/*/eclipse/eclipse.exe").FullName

Install-ChocolateyDesktopLink $sdkManager
Install-ChocolateyPinnedTaskBarItem $sdkManager
Install-ChocolateyDesktopLink $eclipse
Install-ChocolateyPinnedTaskBarItem $eclipse
Write-ChocolateySuccess '$packageName'