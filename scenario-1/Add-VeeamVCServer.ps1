<#
.SYNOPSIS
  Add-VeeamVCServer.ps1 - Add vCenter Server to Veeam

.DESCRIPTION
  This script is a PowerShell example of adding a vCenter server to Veeam

.NOTES
  Version:        1.0
  Author:         John McDonough - jomcdono, Cisco
  Creation Date:  Dec, 16 2019
  Purpose: dCloud Cisco HyperFlex with Veeam Integration Lab
  Scenario: 1
  
.EXAMPLE
  Add-VeeamVCServer -vCenterServer vc1.dcloud.cisco.com -vCenterUser dcloud\demouser -vCenterPassword C1sco12345
#>
[CmdletBinding()]
param(
    [Parameter(Mandatory=$true, HelpMessage="Enter a vCenter Server hostname or IP")]
    [string]$vCenterServer,

    [Parameter(Mandatory=$true, HelpMessage="Enter a vCenter Server username")]
    [string]$vCenterUser,

    [Parameter(Mandatory=$true, HelpMessage="Enter a vCenter Server password")]
    [string]$vCenterPassword

)

Add-PSSnapin -Name VeeamPSSnapin

Connect-VBRServer
Add-VBRvCenter -Name $vCenterServer -User $vCenterUser -Password $vCenterPassword
Get-VBRServer -Type VC
Disconnect-VBRServer 

Remove-PSSnapin -Name VeeamPSSnapin