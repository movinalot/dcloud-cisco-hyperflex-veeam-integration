<#
.SYNOPSIS
  Remove-VeeamVCServer.ps1 - Remove vCenter Server from Veeam

.DESCRIPTION
  This script is a PowerShell example of removing a vCenter server from Veeam

.NOTES
  Version:        1.0
  Author:         John McDonough - jomcdono, Cisco
  Creation Date:  Dec, 16 2019
  Purpose: dCloud Cisco HyperFlex with Veeam Integration Lab
  Scenario: 1
  
.EXAMPLE
  Remove-VeeamVCServer -vCenterServer vc1.dcloud.cisco.com
#>
[CmdletBinding()]
param(
    [Parameter(Mandatory=$true, HelpMessage="Enter a vCenter Server hostname or IP")]
    [string]$vCenterServer

)

Add-PSSnapin -Name VeeamPSSnapin

Connect-VBRServer
Remove-VBRServer -Server $vCenterServer
Disconnect-VBRServer 

Remove-PSSnapin -Name VeeamPSSnapin