Import-Module "C:\ProgramData\Chocolatey\lib\pester.3.1.1\tools\Pester.psm1"
. "C:\Users\r\Desktop\bitbucket-github\chocolatey-1\src\helpers\functions\Write-ChocolateyFailure.ps1"

Invoke-Pester Install-ChocolateyService030.Tests.ps1 -CodeCoverage Install-ChocolateyService030.ps1