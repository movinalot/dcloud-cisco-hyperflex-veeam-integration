<#
.SYNOPSIS
  Get-VeeamVcenterBackupRepository.ps1 - Get Veeam vCenter Backup Repository Information

.DESCRIPTION
  This script PowerShell example of Retrieving Veeam vCenter Backup Repositories.

.NOTES
  Version:        1.0
  Author:         John McDonough - jomcdono, Cisco
  Creation Date:  Dec, 16 2019
  Purpose: dCloud Cisco HyperFlex with Veeam Integration Lab
  Scenario: 2
  
.EXAMPLE
  Get-VeeamVcenterBackupRepository
#>
[CmdletBinding()]
param()

Add-PSSnapin -Name VeeamPSSnapin

Connect-VBRServer
Get-VBRBackupRepository

Disconnect-VBRServer 

Remove-PSSnapin -Name VeeamPSSnapin