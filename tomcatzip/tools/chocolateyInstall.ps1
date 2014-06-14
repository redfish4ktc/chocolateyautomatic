$packageName = 'Apache Software Foundation'
$version = '8'
$serviceName = "tomcat${version}"
$extractionPath = "C:/Program Files/$packageName"

Install-ChocolateyZipPackage "$packageName" "{{DownloadUrl}}" "$extractionPath" "{{DownloadUrlx64}}"
Get-ChocolateyBins "$extractionPath"

$catalinaHome = "${extractionPath}/apache-tomcat-{{PackageVersion}}"

Set-Variable CATALINA_HOME $catalinaHome
$Env:CATALINA_HOME += $catalinaHome

$createService = "${catalinaHome}/bin/service.bat"
& $createService install $serviceName 
net start $serviceName