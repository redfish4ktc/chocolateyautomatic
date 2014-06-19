$packageName = 'Apache Software Foundation'
$version = '8'
$serviceName = "tomcat${version}"
$extractionPath = "C:/Program Files/$packageName"
$catalinaHome = "${extractionPath}/apache-tomcat-8.0.8"
$availablePort = '8080'
$createServiceCommand = "${catalinaHome}/bin/service.bat"
$completePackageName = 'Apache Tomcat 8.0.8'


#function installService() {
#    if (serviceExists) {
#        Write-Host "Apache Tomcat service will be installed"
#		$createService = "${catalinaHome}/bin/service.bat"
#		& $createService install $serviceName
#    }
#}

#function startService() {
#    if (portAvailable) {
#        Write-Host "Apache Tomcat service will be started"
#		start-service $serviceName
#   } else {
#		Write-ChocolateyFailure 'Apache Tomcat' "port $port is unavailable"
#		throw 
#    }
#}

#function portAvailable() {
#	Try {
#		$connection = (New-Object Net.Sockets.TcpClient)
#		$connection.Connect("127.0.0.1",$port)
#		return $FALSE
#	} Catch {
#		return $TRUE
#	}
#}

#function serviceExists() {
#	$service = Get-Service -Name $serviceName -ErrorAction SilentlyContinue
#	if ($service.Length -gt 0) {
#        Write-Host "$serviceName service already exists and will be removed"
#		stop-service $serviceName
#		$service = Get-WmiObject -Class Win32_Service -Filter "Name='$serviceName'"
#		$service.delete()
#		return $TRUE
#   } else {
#		return $TRUE
#    }
#}

Install-ChocolateyZipPackage "$packageName" "http://apache.hippo.nl/tomcat/tomcat-8/v8.0.8/bin/apache-tomcat-8.0.8-windows-x86.zip" "$extractionPath" "http://mirrors.supportex.net/apache/tomcat/tomcat-8/v8.0.8/bin/apache-tomcat-8.0.8-windows-x64.zip"

Write-Host "Adding Apache Tomcat 8.0.8 executables to Chocolatey's bin path"
Get-ChocolateyBins "$extractionPath"

Write-Host "Setting Environment Variable CATALINA_HOME to $catalinaHome"
Set-Variable CATALINA_HOME $catalinaHome
Install-ChocolateyEnvironmentVariable 'CATALINA_HOME' $catalinaHome 'Machine'

Install-ChocolateyService $packageName $serviceName $createServiceCommand $availablePort
#installService

#startService

Write-ChocolateySuccess $completePackageName