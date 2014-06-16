$packageName = 'Apache Software Foundation'
$version = '8'
$serviceName = "tomcat${version}"
$extractionPath = "C:/Program Files/$packageName"

Install-ChocolateyZipPackage "$packageName" "http://apache.hippo.nl/tomcat/tomcat-8/v8.0.8/bin/apache-tomcat-8.0.8-windows-x86.zip" "$extractionPath" "http://apache.mirrors.hostinginnederland.nl/tomcat/tomcat-8/v8.0.8/bin/apache-tomcat-8.0.8-windows-x64.zip"
Get-ChocolateyBins "$extractionPath"

$catalinaHome = "${extractionPath}/apache-tomcat-8.0.8"

Set-Variable CATALINA_HOME $catalinaHome
$Env:CATALINA_HOME += $catalinaHome

$createService = "${catalinaHome}/bin/service.bat"
& $createService install $serviceName 
net start $serviceName