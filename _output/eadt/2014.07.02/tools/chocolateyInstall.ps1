$packageName = 'Eclipse ADT'
$extractionPath = "C:/Program Files/Google"
Install-ChocolateyZipPackage "$packageName" "http://dl.google.com/android/adt/adt-bundle-windows-x86-20140702.zip" "$extractionPath" "http://dl.google.com/android/adt/adt-bundle-windows-x86_64-20140702.zip"
Write-ChocolateySuccess '$packageName'