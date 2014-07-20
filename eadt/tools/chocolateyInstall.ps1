$packageName = 'Eclipse ADT'
$extractionPath = "C:/Program Files/Google"
Install-ChocolateyZipPackage "$packageName" "{{DownloadUrl}}" "$extractionPath" "{{DownloadUrlx64}}"
Write-ChocolateySuccess '$packageName'