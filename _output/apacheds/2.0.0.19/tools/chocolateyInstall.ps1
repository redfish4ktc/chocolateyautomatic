$packageName = 'apacheds'
$Url = 'http://apache.hippo.nl/directory/apacheds/dist//2.0.0-M19/apacheds-2.0.0-M19.zip'
$global:installLocation = "C:\ApacheDS"
. "$PSScriptRoot\OverwriteParameters030.ps1"
. "$PSScriptRoot\Install-ChocolateyService030.ps1"

OverwriteParameters030

Install-ChocolateyZipPackage "$packageName" "$Url" "$global:installLocation"

$packageVersion = (gci "$global:installLocation\apacheds-*\").FullName -replace ".*apacheds-" | sort -Descending | Select -first 1
$apachedsHome = "${global:installLocation}\apacheds-${packageVersion}"

Install-ChocolateyService030 "apacheds" "ApacheDS" "nssm install ApacheDS `"java`" -jar `"${apachedsHome}\lib\apacheds-service-${packageVersion}.jar`" `"${apachedsHome}\instances\default-$packageVersion`"" "10389"