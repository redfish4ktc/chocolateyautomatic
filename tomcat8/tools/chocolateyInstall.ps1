$packageName = '{{PackageName}}'
$32BitUrl = '{{DownloadUrl}}'
$64BitUrl = '{{DownloadUrlx64}}'
$global:installLocation = "C:\ApacheSoftwareFoundation"
$checksum = '{{Checksum}}'
$checksumType = 'md5'
$checksum64 = '{{Checksumx64}}'
$checksumType64 = 'md5'
$availablePort = '8080'
$serviceName = '{{PackageName}}'

if(!$PSScriptRoot){ $PSScriptRoot = Split-Path $MyInvocation.MyCommand.Path -Parent }
. "$PSScriptRoot\OverwriteParameters030.ps1"
. "$PSScriptRoot\Install-ChocolateyService030.ps1"

OverwriteParameters030

Install-ChocolateyZipPackage "$packageName" "$32BitUrl" "$global:installLocation" "$64BitUrl" -checksum "$checksum" -checksumType "$checksumType" -checksum64 "$checksum64" -checksumType64 "$checksumType64"

$catalinaHome = "$global:installLocation\apache-tomcat-{{PackageVersion}}"
$createServiceCommand = "${catalinaHome}\bin\service.bat install $packageName"

Install-ChocolateyEnvironmentVariable 'CATALINA_HOME' "$catalinaHome"

Install-ChocolateyService030 $packageName $serviceName $createServiceCommand $availablePort