$packageName = '{{PackageName}}'
$packageVersion = '{{PackageVersion}}'
$32BitUrl = '{{DownloadUrl}}'
$64BitUrl = '{{DownloadUrlx64}}'
$extractionPath = "c:\Program Files\Eclipse Foundation\$packageVersion"

Install-ChocolateyZipPackage "$packageName" "$32BitUrl" "$extractionPath" "$64BitUrl"