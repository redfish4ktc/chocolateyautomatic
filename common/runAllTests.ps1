Import-Module "C:\ProgramData\Chocolatey\lib\pester.3.1.1\tools\Pester.psm1"

Invoke-Pester CoverageTest.Tests.ps1 -CodeCoverage CoverageTest.ps1
Invoke-Pester Install-ChocolateyService030.Tests.ps1 -CodeCoverage Install-ChocolateyService030.ps1