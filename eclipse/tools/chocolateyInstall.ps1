$extractionPath = "C:/Program Files/Eclipse Foundation/{{PackageVersion}}"

Install-ChocolateyZipPackage "$packageName" "{{DownloadUrl}}" "$extractionPath" "{{DownloadUrlx64}}"
Get-ChocolateyBins "$extractionPath"