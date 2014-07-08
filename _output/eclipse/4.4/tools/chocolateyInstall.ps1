$extractionPath = "C:/Program Files/Eclipse Foundation/4.4"

Install-ChocolateyZipPackage "$packageName" "http://eclipse.mirror.triple-it.nl/technology/epp/downloads/release/luna/R/eclipse-jee-luna-R-win32.zip" "$extractionPath" "http://eclipse.mirror.triple-it.nl/technology/epp/downloads/release/luna/R/eclipse-jee-luna-R-win32-x86_64.zip"
Get-ChocolateyBins "$extractionPath"