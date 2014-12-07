$here = Split-Path -Parent $MyInvocation.MyCommand.Path
$sut = (Split-Path -Leaf $MyInvocation.MyCommand.Path).Replace(".Tests.", ".")
. "$here\$sut"

$unavailablePort = 135
$serviceName = "installServiceTest"
$createServiceCommand = "nssm install installServiceTest"
$incorrectCreateServiceCommand = "\test"
$availablePort = 9999
$unlistenPort = -1
$testServiceBatPath = "$here\helpers\testService.bat"
$createServiceCommandComplete = "$createServiceCommand `"$testServiceBatPath`""

Describe "Install-ChocolateyService" {
  Context "When createServiceCommand parameter is passed to this function and is invalid" {
    Mock Write-ChocolateyFailure

	Install-ChocolateyService030 -packageName "test" -serviceName "test" -createServiceCommand "$incorrectCreateServiceCommand" -availablePort "$availablePort"
	
	It "should return an error" {
      Assert-MockCalled Write-ChocolateyFailure -parameterFilter { $failureMessage  -eq "The createServiceCommand is incorrect: 'The term '$incorrectCreateServiceCommand' is not recognized as the name of a cmdlet, function, script file, or operable program. Check the spelling of the name, or if a path was included, verify that the path is correct and try again.'."
	  }
    }
  }

  Context "When provided parameters are correct the service should be created and started" {
    Install-ChocolateyService030 -packageName "$serviceName" -serviceName "$serviceName"  -createServiceCommand "$createServiceCommandComplete" -availablePort "$availablePort"
  }

  Context "When service does not exist and tried to be started" {
    Mock Write-ChocolateyFailure
		
	Install-ChocolateyService030 -packageName "$serviceName" -serviceName "$serviceName"  -createServiceCommand "$createServiceCommandComplete" -availablePort "$unlistenPort"
		
	It "should return an error" {
	  Assert-MockCalled Write-ChocolateyFailure -parameterFilter { $failureMessage  -eq "service $serviceName cannot be started."
	  }
	}
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
	  }
    }
  }

  Context "When serviceName does not exist" {
    Mock Write-ChocolateyFailure

	Install-ChocolateyService030 -packageName "test" -serviceName "test" -createServiceCommand "test"
	
	It "should return an error" {
      Assert-MockCalled Write-ChocolateyFailure -parameterFilter { $failureMessage  -eq "service test does not exist." 
	  }
    }
  }
  
  Uninstall-ChocolateyService030 -serviceName "$serviceName"
}