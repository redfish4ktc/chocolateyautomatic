function Uninstall-ChocolateyZipPackage030 {
param(
  [string] $packageName
)
	ChildItem "$env:ChocolateyInstall\lib\${packageName}.*" -Recurse -Filter "${packageName}Install.zip.txt" | 
	ForEach-Object{ $extractionPath = (Get-Content $_.FullName | Select-Object -First 1); Write-Host "Uninstalling by removing directory $extractionPath"; if (($extractionPath -match "${packageName}") -and (Test-Path -Path $extractionPath)){Remove-Item -Recurse -Force $extractionPath}}
}