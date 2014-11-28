$packageName = 'eclipse'
$packageVersion = '4.4.1'
$32BitUrl = 'http://eclipse.mirror.triple-it.nl/technology/epp/downloads/release/luna/SR1/eclipse-jee-luna-SR1-win32.zip'
$64BitUrl = 'http://eclipse.mirror.triple-it.nl/technology/epp/downloads/release/luna/SR1/eclipse-jee-luna-SR1-win32-x86_64.zip'
$extractionPath = "c:\Program Files\Eclipse Foundation\$packageVersion"

Install-ChocolateyZipPackage "$packageName" "$32BitUrl" "$extractionPath" "$64BitUrl"