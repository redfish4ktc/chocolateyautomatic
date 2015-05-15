$packageName = '{{PackageName}}'
$Url = '{{DownloadUrl}}'
$global:installLocation = Get-BinRoot
$availablePort = '8080'
$serviceName = '{{PackageName}}'

if(!$PSScriptRoot){ $PSScriptRoot = Split-Path $MyInvocation.MyCommand.Path -Parent }
. "$PSScriptRoot\OverwriteParameters.ps1"
. "$PSScriptRoot\Install-Service.ps1"

OverwriteParameters

Install-ChocolateyZipPackage "$packageName" "$Url" "$global:installLocation"

$createServiceCommand = "$global:installLocation\${packageName}-{{PackageVersion}}.Final\bin\service\service.bat install"

Install-Service $packageName $serviceName $createServiceCommand $availablePort