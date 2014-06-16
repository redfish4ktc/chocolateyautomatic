$packageName = 'ZooKeeper'
$authorVersion =  "3.4.6"
$installDir = "C:/$packageName"

Install-ChocolateyZipPackage -packagename gzip-src -url "http://apache.mirror.1000mbps.com/zookeeper/zookeeper-3.4.6/zookeeper-3.4.6.tar.gz" -unzipLocation (Join-Path $env:chocolateyPackageFolder tmp)
Get-ChocolateyUnzip -fileFullPath (Join-Path $env:chocolateyPackageFolder tmp\gzip-srcInstall) -destination "$installDir"