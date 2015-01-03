$packageName = 'tomcat8'
$32BitUrl = 'http://apache.hippo.nl/tomcat/tomcat-8/v8.0.15/bin/apache-tomcat-8.0.15-windows-x86.zip'
$64BitUrl = 'http://apache.hippo.nl/tomcat/tomcat-8/v8.0.15/bin/apache-tomcat-8.0.15-windows-x64.zip'
$global:installLocation = "C:\ApacheSoftwareFoundation"
$checksum = 'a063c57d6b3913a46d8622c57df3dbf1'
$checksumType = 'md5'
$checksum64 = '135e9c6a54c247162f3134347b5c7895'
$checksumType64 = 'md5'
$availablePort = '8080'
$catalinaHome = "$global:installLocation\apache-tomcat-8.0.15"
$createServiceCommand = "${catalinaHome}\bin\service.bat install $packageName"
$serviceName = 'tomcat8'

if(!$PSScriptRoot){ $PSScriptRoot = Split-Path $MyInvocation.MyCommand.Path -Parent }
. "$PSScriptRoot\OverwriteParameters030.ps1"
. "$PSScriptRoot\Install-ChocolateyService030.ps1"

OverwriteParameters030

Install-ChocolateyZipPackage "$packageName" "$32BitUrl" "$global:installLocation" "$64BitUrl" -checksum "$checksum" -checksumType "$checksumType" -checksum64 "$checksum64" -checksumType64 "$checksumType64"

Install-ChocolateyEnvironmentVariable 'CATALINA_HOME' "$catalinaHome"

Install-ChocolateyService030 $packageName $serviceName $createServiceCommand $availablePort