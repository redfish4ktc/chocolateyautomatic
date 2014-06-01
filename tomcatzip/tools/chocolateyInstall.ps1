$packageName = 'Apache Software Foundation'
$version = '8'
$updateNumber = '8'
$serviceName = "tomcat${version}"
$completeVersion = "{{PackageVersion}}"

$baseUrl = "http://apache.hippo.nl/tomcat/tomcat-${version}/v${completeVersion}/bin/apache-tomcat-${completeVersion}-windows"
$url = "${baseUrl}-x86.zip"
$url64 = "${baseUrl}-x64.zip"
$extractionPath = "C:/Program Files/$packageName"

Install-ChocolateyZipPackage "$packageName" "$url" "$extractionPath" "$url64"
Get-ChocolateyBins "$extractionPath"

$catalinaHome = "${extractionPath}/apache-tomcat-${completeVersion}"

Set-Variable CATALINA_HOME $catalinaHome
$Env:CATALINA_HOME += $catalinaHome

$createService = "${catalinaHome}/bin/service.bat"
& $createService install $serviceName 
net start $serviceName