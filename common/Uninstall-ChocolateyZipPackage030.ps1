function Uninstall-ChocolateyZipPackage030 {
param(
  [string] $packageName
)
	ChildItem "$env:ChocolateyInstall\lib\${packageName}.*" -Recurse -Filter "${packageName}Install.zip.txt" | 
	ForEach-Object{ $installLocation = (Get-Content $_.FullName | Select-Object -First 1); Write-Host "Uninstalling by removing directory $installLocation"; if (($installLocation -match "${packageName}") -and (Test-Path -Path $installLocation)){Remove-Item -Recurse -Force $installLocation}}
}