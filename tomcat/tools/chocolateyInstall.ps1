﻿$packageName = '{{PackageName}}'
$32BitUrl = '{{DownloadUrl}}'
$64BitUrl = '{{DownloadUrlx64}}'
$global:installLocation = Get-BinRoot
$checksum = '{{Checksum}}'
$checksumType = 'md5'
$checksum64 = '{{Checksumx64}}'
$checksumType64 = 'md5'
$availablePort = '8080'
$majorVersion = "{{PackageVersion}}"[0]
$serviceName = "{{PackageName}}${majorVersion}"

if(!$PSScriptRoot){ $PSScriptRoot = Split-Path $MyInvocation.MyCommand.Path -Parent }
. "$PSScriptRoot\OverwriteParameters.ps1"
. "$PSScriptRoot\Install-Service.ps1"

OverwriteParameters

Install-ChocolateyZipPackage "$packageName" "$32BitUrl" "$global:installLocation" "$64BitUrl" -checksum "$checksum" -checksumType "$checksumType" -checksum64 "$checksum64" -checksumType64 "$checksumType64"

$catalinaHome = "$global:installLocation\apache-tomcat-{{PackageVersion}}"
$createServiceCommand = "${catalinaHome}\bin\service.bat install $serviceName"

Install-ChocolateyEnvironmentVariable 'CATALINA_HOME' "$catalinaHome"

Install-Service $packageName $serviceName $createServiceCommand $availablePort