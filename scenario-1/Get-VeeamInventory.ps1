<#
.SYNOPSIS
  Get-VeeamInventory.ps1 - Get Inventory from Veeam based on a Path Filter

.DESCRIPTION
  The Veeam PowerShell Cmdlet Find-VBRViEntity Looks for VMware entities created on a selected host.
  This script focuses on HostAndClusters.

.NOTES
  Version:        1.0
  Author:         John McDonough - jomcdono, Cisco
  Creation Date:  Dec, 16 2019
  Purpose: dCloud Cisco HyperFlex with Veeam Integration Lab
  Scenario: 1
  
.EXAMPLE
  Get-VeeamInventory -PathFilter "*HX-DC-B*"
#>
[CmdletBinding()]
param(
    [Parameter(Mandatory=$False, HelpMessage="Enter a Path Filter")]
    [string]$PathFilter
)

Add-PSSnapin -Name VeeamPSSnapin

Connect-VBRServer
Find-VBRViEntity -HostsAndClusters |`
  ?{$_.Path -like $PathFilter} | Sort-Object -Property Name |`
  Select-Object Name,`
    Type,`
    @{Name='UsedSize';Expression={[math]::round($_.UsedSize/1GB,0).ToString()+" GB"}},`
    @{Name='ProvisionedSize';Expression={[math]::round($_.ProvisionedSize/1GB,0).tostring()+" GB"}},`
    VmFolderName,`
    VmHostName | Format-Table -AutoSize
Disconnect-VBRServer 

Remove-PSSnapin -Name VeeamPSSnapin