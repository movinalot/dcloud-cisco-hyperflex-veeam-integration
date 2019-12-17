<#
.SYNOPSIS
  Set-VeeamVcenterBackupRepository.ps1 - Set Veeam Backup Repository

.DESCRIPTION
  This script is a PowerShell example of Setting a Veeam Backup Repository

.NOTES
  Version:        1.0
  Author:         John McDonough - jomcdono, Cisco
  Creation Date:  Dec, 16 2019
  Purpose: dCloud Cisco HyperFlex with Veeam Integration Lab
  Scenario: 2
  
.EXAMPLE
  Set-VeeamVcenterBackupRepository -RepositoryName "Default Backup Respository" -UsePerVMFile
#>
[CmdletBinding()]
param(
    [Parameter(Mandatory=$true, HelpMessage="Enter a Repository Name")]
    [string]$RepositoryName,

    [Parameter(Mandatory=$true)]
    [switch]$UsePerVMFile

)

Add-PSSnapin -Name VeeamPSSnapin

Connect-VBRServer


$params = @{ 'UsePerVMFile' = $UsePerVMFile}
Get-VBRBackupRepository -Name $RepositoryName | Set-VBRBackupRepository @params 

Disconnect-VBRServer 

Remove-PSSnapin -Name VeeamPSSnapin