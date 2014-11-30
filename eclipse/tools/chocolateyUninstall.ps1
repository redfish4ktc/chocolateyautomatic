$extractionPath = "c:\Program Files\Eclipse Foundation"

if(Test-Path -Path $extractionPath) {
	Write-Host "Uninstalling by removing directory $extractionPath"
	Remove-Item -Recurse -Force $extractionPath
}