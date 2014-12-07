$here = Split-Path -Parent $MyInvocation.MyCommand.Path
$sut = (Split-Path -Leaf $MyInvocation.MyCommand.Path).Replace(".Tests.", ".")
. "$here\$sut"

$unavailablePort = 135

Describe "Install-ChocolateyService" {
  Context "When provided parameters are correct the service should be created and started" {
    $serviceName = "installServiceTest"
    $createServiceCommand = "nssm install installServiceTest"
    $availablePort = 9999
    $testServiceBatPath = "$here\helpers\testService.bat"
    $createServiceCommandComplete = "$createServiceCommand `"$testServiceBatPath`""
    
    Install-ChocolateyService030 -packageName "$serviceName" -serviceName "$serviceName"  -createServiceCommand "$createServiceCommandComplete" -availablePort "$availablePort"
  }
  
  Context "When no packageName parameter is passed to this function" {
    Mock Write-ChocolateyFailure
		
	Install-ChocolateyService030 -serviceName "test" -createServiceCommand "test"
		
	It "should return an error" {
	  Assert-MockCalled Write-ChocolateyFailure -parameterFilter { $failureMessage  -eq "Missing PackageName input parameter." }
	}
  }
  
  Context "When no serviceName parameter is passed to this function" {
    Mock Write-ChocolateyFailure
		
	Install-ChocolateyService030 -packageName "test" -createServiceCommand "test"
		
	It "should return an error" {
	  Assert-MockCalled Write-ChocolateyFailure -parameterFilter { $failureMessage  -eq "Missing ServiceName input parameter." }
	}
  }  
  
  Context "When no createServiceCommand parameter is passed to this function" {
    Mock Write-ChocolateyFailure
		
	Install-ChocolateyService030 -packageName "test" -serviceName "test"
		
	It "should return an error" {
	  Assert-MockCalled Write-ChocolateyFailure -parameterFilter { $failureMessage  -eq "Missing CreateServiceCommand input parameter." }
	}
  }
  
  Context "When availablePort parameter is passed to this function and it is in LISTENING state and NOT available" {
    Mock Write-ChocolateyFailure

	Install-ChocolateyService030 -packageName "test" -serviceName "test" -createServiceCommand "test" -availablePort "$unavailablePort"
	
	It "should return an error" {
      Assert-MockCalled Write-ChocolateyFailure -parameterFilter { $failureMessage  -eq "$unavailablePort is in LISTENING state and not available." 
	  Write-Host $failureMessage
	  }
    }
  }  
}









#$unavailablePort = "135"
#$correctServiceName = "installServiceTest"
#$unavailableServiceName = "unavailableServiceName"
#$testDirectory = "C:\installChocolateyServiceTest"
#
#Describe "Install-ChocolateyService" {
#  Context "When provided parameters are correct the service should be created and started" {
#
#
#
#  
#	Install-ChocolateyServiceCorrectParameters030.Tests -testDirectory "$testDirectory"
#	
#	It "service creation should succeed" {
#      Get-ServiceExistence -serviceName "$correctServiceName" | should Be $true
#    }
#
#	It "service start should succeed" {
#      Get-ServiceStatus -serviceName "$correctServiceName" -eq "running" | should Be $true
#    }
#  }
#}

















#$here = Split-Path -Parent $MyInvocation.MyCommand.Definition
#$common = Join-Path (Split-Path -Parent $here)  '_Common.ps1'
#$base = Split-Path -parent (Split-Path -Parent $here)
#$baseFunctions = "$base\src\helpers\functions"
#. $common
#. "$baseFunctions\Install-ChocolateyService.ps1"
#. "$baseFunctions\Get-ServiceExistence.ps1"
#. "$baseFunctions\Get-ServiceStatus.ps1"
#. "$base\tests\unit\Install-ChocolateyServiceCorrectParameters.Tests.ps1"
#
#$unavailablePort = "135"
#$correctServiceName = "installServiceTest"
#$unavailableServiceName = "unavailableServiceName"
#$testDirectory = "C:\installChocolateyServiceTest"
#
#Describe "Install-ChocolateyService" {
#  Context "When provided parameters are correct the service should be created and started" {	
#	Install-ChocolateyServiceCorrectParameters.Tests -testDirectory "$testDirectory"
#		
#	It "service creation should succeed" {
#      Get-ServiceExistence -serviceName "$correctServiceName" | should Be $true
#    }
#
#	It "service start should succeed" {
#      Get-ServiceStatus -serviceName "$correctServiceName" -eq "running" | should Be $true
#    }
#  }
#
#  Context "When provided parameters are correct and service exist it should be removed, subsequently created and started" {	
#	Install-ChocolateyServiceCorrectParameters.Tests -testDirectory "$testDirectory"
#
#	It "service creation should succeed after deletion of previous service" {
#      Get-ServiceExistence -serviceName "$correctServiceName" | should Be $true
#    }
#
#	It "service start should succeed after deletion of previous service" {
#      Get-ServiceStatus -serviceName "$correctServiceName" -eq "running" | should Be $true
#    }
#  }  
# 
 
#  
#  Context "When no packageName parameter is passed to this function" {
#    Mock Write-ChocolateyFailure
#	
#	Install-ChocolateyService -serviceName "$unavailableServiceName" -createServiceCommand "$unavailableServiceName"
#
#	It "should return an error" {
#	  Assert-MockCalled Write-ChocolateyFailure -parameterFilter { $failureMessage  -eq "Missing PackageName input parameter." }
#	}
#  }
#	
#  Context "When no serviceName parameter is passed to this function" {
#	Mock Write-ChocolateyFailure
#		
#	Install-ChocolateyService -packageName "$unavailableServiceName" -createServiceCommand "$unavailableServiceName"
#		
#	It "should return an error" {
#	  Assert-MockCalled Write-ChocolateyFailure -parameterFilter { $failureMessage  -eq "Missing ServiceName input parameter." }
#	}
#  }
#
#  Context "When no createServiceCommand parameter is passed to this function" {
#    Mock Write-ChocolateyFailure
#		
#	Install-ChocolateyService -packageName "$unavailableServiceName" -serviceName "$unavailableServiceName"
#		
#	It "should return an error" {
#	  Assert-MockCalled Write-ChocolateyFailure -parameterFilter { $failureMessage  -eq "Missing CreateServiceCommand input parameter." }
#	}
#  }
#	
	
#
#  Context "When createServiceCommand is incorrect" {
#    Mock Write-ChocolateyFailure
#	
#	Install-ChocolateyServiceCorrectParameters.Tests -testDirectory "$testDirectory" -createServiceCommand "$unavailableServiceName"
#		
#	It "should return an error" {
#	  Assert-MockCalled Write-ChocolateyFailure -parameterFilter { $failureMessage  -eq "The createServiceCommand is incorrect: 'The term 'unavailableServiceName' is not recognized as the name of a cmdlet, function, script file, or operable program. Check the spelling of the name, or if a path was included, verify that the path is correct and try again.'." }
#	}
#  }
#
#  Uninstall-ChocolateyService -serviceName "$serviceName"
#
#  Remove-ChocolateyDirectory "$testDirectory"
#}









#$here = Split-Path -Parent $MyInvocation.MyCommand.Path
#$sut = (Split-Path -Leaf $MyInvocation.MyCommand.Path).Replace(".Tests.", ".")
#. "$here\$sut"
#
#Describe 'Demonstrating Code Coverage' {
#    It 'Calls FunctionOne with no switch parameter set' {
#        Install-ChocolateyService030 | Should Be 'SwitchParam was not set'
#    }
#}




#\r\Desktop\bitbucket-github\chocolatey-1\src\helpers\functions