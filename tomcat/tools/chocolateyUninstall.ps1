$packageName = '{{PackageName}}'
$majorVersion = "{{PackageVersion}}"[0]

if(!$PSScriptRoot){ $PSScriptRoot = Split-Path $MyInvocation.MyCommand.Path -Parent }
. "$PSScriptRoot\Install-Service.ps1"
. "$PSScriptRoot\Uninstall-ZipPackage.ps1"

Uninstall-Service "$packageName${majorVersion}"

Uninstall-ZipPackage "$packageName"