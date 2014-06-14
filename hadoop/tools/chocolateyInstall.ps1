$packageName = 'Hadoop'
$authorVersion =  "{{PackageVersion}}"
$installDir = "C:/$packageName"

Install-ChocolateyZipPackage -packagename gzip-src -url "{{DownloadUrl}}" -unzipLocation (Join-Path $env:chocolateyPackageFolder tmp)
Get-ChocolateyUnzip -fileFullPath (Join-Path $env:chocolateyPackageFolder tmp\gzip-srcInstall) -destination "$installDir"