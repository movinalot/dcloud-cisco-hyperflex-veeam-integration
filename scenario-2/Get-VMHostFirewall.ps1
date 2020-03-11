<#
.SYNOPSIS
  Get-VMHostFirewall.ps1 - Get VMhost Firewall
.DESCRIPTION
  This script is a PowerShell example of Getting VMware Host Firewall
.NOTES
  Version:        1.0
  Author:         John McDonough - jomcdono, Cisco
  Creation Date:  Mar, 11 2020
  Purpose: dCloud Cisco HyperFlex with Veeam Integration Lab
  Scenario: 2
  
.EXAMPLE
  Get-VMHostFirewall.ps1 -vCenterServer vc1.dcloud.cisco.com -vCenterUser dcloud\demouser -vCenterPassword C1sco12345 -VMhost "hx-b-*" -Rule NFSAccess
#>
[CmdletBinding()]
param(
    [Parameter(Mandatory=$true, HelpMessage="Enter a vCenter Server hostname or IP")]
    [string]$vCenterServer,

    [Parameter(Mandatory=$true, HelpMessage="Enter a vCenter Server username")]
    [string]$vCenterUser,

    [Parameter(Mandatory=$true, HelpMessage="Enter a vCenter Server password")]
    [string]$vCenterPassword,

    [Parameter(Mandatory=$true, HelpMessage="Enter a VMhost Name or Pattern")]
    [string]$VMhost,

    [Parameter(Mandatory=$true, HelpMessage="Enter a Firewall Rule Name")]
    [string]$Rule
)

Import-Module -Name VMware.VimAutomation.Core

Set-PowerCLIConfiguration -InvalidCertificateAction Ignore -Confirm:$false 2>&1 | Out-Null

Connect-VIServer -Server $vCenterServer -User $vCenterUser -Password $vCenterPassword 2>&1 | Out-Null

Get-VMHost -Name $VMhost | %{Get-VMHostFirewallException -VMHost $_.Name -Name $Rule} |`
                           Select-Object VMHost, Name, Enabled, IncomingPorts ,Protocols |`
                           Format-Table -AutoSize

Disconnect-VIServer -Confirm:$false
Remove-Module -Name VMware.VimAutomation.Core -Force
