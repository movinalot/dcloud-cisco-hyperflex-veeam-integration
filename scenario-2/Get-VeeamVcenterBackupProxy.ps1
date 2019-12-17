<#
.SYNOPSIS
  Get-VeeamVcenterBackupProxy.ps1 - Get Veeam vCenter Backup Proxy Information

.DESCRIPTION
  This script PowerShell example of Retrieving Veeam vCenter Backup Proxies.

.NOTES
  Version:        1.0
  Author:         John McDonough - jomcdono, Cisco
  Creation Date:  Dec, 16 2019
  Purpose: dCloud Cisco HyperFlex with Veeam Integration Lab
  Scenario: 2
  
.EXAMPLE
  Get-VeeamVcenterBackupProxy
#>
[CmdletBinding()]
param()

Add-PSSnapin -Name VeeamPSSnapin

Connect-VBRServer
Get-VBRViProxy

Disconnect-VBRServer 

Remove-PSSnapin -Name VeeamPSSnapin