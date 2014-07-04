$packageName = 'Apache Software Foundation'
$version = '8'
$serviceName = "tomcat${version}"
$extractionPath = "C:/Program Files/$packageName"
$catalinaHome = "${extractionPath}/apache-tomcat-8.0.9"
$availablePort = '8080'
$createServiceCommand = "${catalinaHome}/bin/service.bat"
$completePackageName = 'Apache Tomcat 8.0.9'

Install-ChocolateyZipPackage "$packageName" "http://apache.hippo.nl/tomcat/tomcat-8/v8.0.9/bin/apache-tomcat-8.0.9-windows-x86.zip" "$extractionPath" "http://apache.mirror1.spango.com/tomcat/tomcat-8/v8.0.9/bin/apache-tomcat-8.0.9-windows-x64.zip"

Write-Host "Adding $completePackageName executables to Chocolatey's bin path"
Get-ChocolateyBins "$extractionPath"

Write-Host "Setting Environment Variable CATALINA_HOME to $catalinaHome"
Set-Variable CATALINA_HOME $catalinaHome
Install-ChocolateyEnvironmentVariable 'CATALINA_HOME' $catalinaHome 'Machine'

Install-ChocolateyService $packageName $serviceName $createServiceCommand $availablePort

Write-ChocolateySuccess 'Apache Tomcat 8.0.9'