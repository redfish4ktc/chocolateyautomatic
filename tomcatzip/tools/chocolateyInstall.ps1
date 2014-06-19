$packageName = 'Apache Software Foundation'
$version = '8'
$serviceName = "tomcat${version}"
$extractionPath = "C:/Program Files/$packageName"
$catalinaHome = "${extractionPath}/apache-tomcat-8.0.8"
$availablePort = '8080'
$createServiceCommand = "${catalinaHome}/bin/service.bat"
$completePackageName = 'Apache Tomcat 8.0.8'

Install-ChocolateyZipPackage "$packageName" "{{DownloadUrl}}" "$extractionPath" "{{DownloadUrlx64}}"

Write-Host "Adding Apache Tomcat {{PackageVersion}} executables to Chocolatey's bin path"
Get-ChocolateyBins "$extractionPath"

Write-Host "Setting Environment Variable CATALINA_HOME to $catalinaHome"
Set-Variable CATALINA_HOME $catalinaHome
Install-ChocolateyEnvironmentVariable 'CATALINA_HOME' $catalinaHome 'Machine'

Install-ChocolateyService $packageName $serviceName $createServiceCommand $availablePort

Write-ChocolateySuccess 'Apache Tomcat {{PackageVersion}}'