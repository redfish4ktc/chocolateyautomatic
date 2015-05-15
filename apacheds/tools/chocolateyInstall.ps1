$packageName = '{{PackageName}}'
$Url = '{{DownloadUrl}}'
$global:installLocation = Get-BinRoot
$checksum = '{{Checksum}}'
$checksumType = 'md5'

if(!$PSScriptRoot){ $PSScriptRoot = Split-Path $MyInvocation.MyCommand.Path -Parent }
. "$PSScriptRoot\OverwriteParameters.ps1"
. "$PSScriptRoot\Install-Service.ps1"

OverwriteParameters

Install-ChocolateyZipPackage "$packageName" "$Url" "$global:installLocation" -checksum "$checksum" -checksumType "$checksumType"

$packageVersion = (gci "$global:installLocation\apacheds-*\").FullName -replace ".*apacheds-" | sort -Descending | Select -first 1
$apachedsHome = "${global:installLocation}\apacheds-${packageVersion}"

Install-Service "apacheds" "ApacheDS" "nssm install ApacheDS `"java`" -jar `"${apachedsHome}\lib\apacheds-service-${packageVersion}.jar`" `"${apachedsHome}\instances\default-$packageVersion`"" "10389"