$packageName = 'Eclipse ADT'
$extractionPath = "C:/Google"

  if (!$extractionPath) {
    Write-Host "$extractionPath directory does not exist and will be created"
    New-Item -ItemType Directory -Path $extractionPath
  }

$sdkManager = (gci "${extractionPath}/*/SDK Manager.exe").FullName | sort -Descending | Select -first 1
$eclipse = (gci "${extractionPath}/*/eclipse/eclipse.exe").FullName

Install-ChocolateyZipPackage "$packageName" "http://dl.google.com/android/adt/adt-bundle-windows-x86-20140702.zip" "$extractionPath" "http://dl.google.com/android/adt/adt-bundle-windows-x86_64-20140702.zip"
Install-ChocolateyDesktopLink $sdkManager
Install-ChocolateyPinnedTaskBarItem $sdkManager
Install-ChocolateyDesktopLink $eclipse
Install-ChocolateyPinnedTaskBarItem $eclipse
Write-ChocolateySuccess '$packageName'