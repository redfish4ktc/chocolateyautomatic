$packageName = '{{PackageName}}'

if(!$PSScriptRoot){ $PSScriptRoot = Split-Path $MyInvocation.MyCommand.Path -Parent }
. "$PSScriptRoot\Uninstall-ZipPackage.ps1"

Uninstall-ZipPackage "$packageName"