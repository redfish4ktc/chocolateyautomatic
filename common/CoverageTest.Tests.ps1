

$here = Split-Path -Parent $MyInvocation.MyCommand.Path
$sut = (Split-Path -Leaf $MyInvocation.MyCommand.Path).Replace(".Tests.", ".")
. "$here\$sut"

Describe 'Demonstrating Code Coverage' {
    It 'Calls FunctionOne with no switch parameter set' {
        FunctionOne | Should Be 'SwitchParam was not set'
    }

    It 'Calls FunctionTwo' {
        FunctionTwo | Should Be 'I get executed'
    }
}

#Invoke-Pester CoverageTest.Tests.ps1 -CodeCoverage CoverageTest.ps1