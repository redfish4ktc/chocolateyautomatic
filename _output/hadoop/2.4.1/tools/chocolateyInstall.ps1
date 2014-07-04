$packageName = 'Hadoop'
$authorVersion =  "2.4.1"
$installDir = "C:/$packageName"

Install-ChocolateyZipPackage -packagename gzip-src -url "http://ftp.nluug.nl/internet/apache/hadoop/common/hadoop-2.4.1/hadoop-2.4.1.tar.gz" -unzipLocation (Join-Path $env:chocolateyPackageFolder tmp)
Get-ChocolateyUnzip -fileFullPath (Join-Path $env:chocolateyPackageFolder tmp\gzip-srcInstall) -destination "$installDir"