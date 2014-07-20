$packageName = 'Eclipse ADT'
$extractionPath = "C:/Program Files/$packageName"

Install-ChocolateyZipPackage "$packageName" "{{DownloadUrl}}" "$extractionPath" "{{DownloadUrlx64}}"
Write-ChocolateySuccess '$packageName'