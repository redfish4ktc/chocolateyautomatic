$arguments = @{};

$packageParameters = $env:chocolateyPackageParameters;

$packageName = '{{PackageName}}'
$packageVersion = '{{PackageVersion}}'
$32BitUrl = '{{DownloadUrl}}'
$64BitUrl = '{{DownloadUrlx64}}'
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