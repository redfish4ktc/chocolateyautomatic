$arguments = @{};

$packageParameters = $env:chocolateyPackageParameters;

$packageName = 'eclipse'
$packageVersion = '4.4.1'
$32BitUrl = 'http://eclipse.mirror.triple-it.nl/technology/epp/downloads/release/luna/SR1/eclipse-jee-luna-SR1-win32.zip'
$64BitUrl = 'http://eclipse.mirror.triple-it.nl/technology/epp/downloads/release/luna/SR1/eclipse-jee-luna-SR1-win32-x86_64.zip'
$extractionPath = "C:\Program Files\Eclipse Foundation\$packageVersion"

if($packageParameters) {
	$MATCH_PATTERN = "/([a-zA-Z]+):([`"'])?(.*)([`"'])?"
	$PARAMATER_NAME_INDEX = 1
	$VALUE_INDEX = 3
	
	if($packageParameters -match $MATCH_PATTERN ){
		$results = $packageParameters | Select-String $MATCH_PATTERN -AllMatches 
		$results.matches | % { 
		$arguments.Add(
			$_.Groups[$PARAMATER_NAME_INDEX].Value.Trim(),
			$_.Groups[$VALUE_INDEX].Value.Trim()) 
		}
	}     
	
	if($arguments.ContainsKey("ExtractionPath")) {
		$extractionPath = $arguments["ExtractionPath"];
	}
}

Install-ChocolateyZipPackage "$packageName" "$32BitUrl" "$extractionPath" "$64BitUrl"