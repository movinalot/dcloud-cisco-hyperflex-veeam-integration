<#
.SYNOPSIS
  Get-VeeamServerInfo.ps1 - Backup and Replication Server Connect/Disconnect

.DESCRIPTION
  This script is a PowerShell example of connecting and disconnecting from a Veeam Server
  This Script Adds the Veeam Snapin, connects to the Veeam server, Get the Veeam Server,
  disconnects from the Veeam server and Removes the Veeam Snapin.

.NOTES
  Version:        1.0
  Author:         John McDonough - jomcdono, Cisco
  Creation Date:  Dec, 16 2019
  Purpose: dCloud Cisco HyperFlex with Veeam Integration Lab
  Scenario: 1
  
.EXAMPLE
  Get-VeeamServerInfo
#>
[CmdletBinding()]
param()

Add-PSSnapin -Name VeeamPSSnapin

Connect-VBRServer
Get-VBRServer -Type Local
Get-VBRServerSession
Disconnect-VBRServer 

Remove-PSSnapin -Name VeeamPSSnapin