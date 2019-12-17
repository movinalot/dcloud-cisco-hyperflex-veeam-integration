<#
.SYNOPSIS
  Set-VMHostFirewall.ps1 - Set VMhost Firewall

.DESCRIPTION
  This script is a PowerShell example of Setting VMware Host Firewall

.NOTES
  Version:        1.0
  Author:         John McDonough - jomcdono, Cisco
  Creation Date:  Dec, 16 2019
  Purpose: dCloud Cisco HyperFlex with Veeam Integration Lab
  Scenario: 2
  
.EXAMPLE
  Set-VMHostFirewall -VMhost "hx-b-*" -Rule -Enable
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
    [string]$Rule,

    [Parameter(Mandatory=$false)]
    [switch]$Enabled

)

if ($Enabled) {
    $isEnabled = $true
} else {
    $isEnabled = $false
}

Import-Module -Name VMware.PowerCli
Set-PowerCLIConfiguration -InvalidCertificateAction Ignore -Confirm:$false

Connect-VIServer -Server $vCenterServer -User $vCenterUser -Password $vCenterPassword

Get-VMHost -Name $VMhost | %{Get-VMHostFirewallException -VMHost $_.Name -Name $Rule | Set-VMHostFirewallException -Enabled:$isEnabled}

Disconnect-VIServer -Confirm:$false
Remove-Module -Name VMware.PowerCli