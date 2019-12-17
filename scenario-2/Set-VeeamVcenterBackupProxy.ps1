<#
.SYNOPSIS
  Set-VeeamVcenterBackupProxy.ps1 - Set Veeam Backup Proxy

.DESCRIPTION
  This script is a PowerShell example of Setting a Veeam Backup Proxy

.NOTES
  Version:        1.0
  Author:         John McDonough - jomcdono, Cisco
  Creation Date:  Dec, 16 2019
  Purpose: dCloud Cisco HyperFlex with Veeam Integration Lab
  Scenario: 2
  
.EXAMPLE
  Set-VeeamVcenterBackupProxy -ProxyName "VMware Backup Proxy" -TransportMode DirectStorageAccess -ConnectedDatastoreMode Manual -DatastoreName hx-b-ds1 -EnableFailoverToNBD:$false -EnableHostToProxyEncryption:$false -MaxTasks 4
#>
[CmdletBinding()]
param(
    [Parameter(Mandatory=$true, HelpMessage="Enter a Proxy Name")]
    [string]$ProxyName,

    [Parameter(Mandatory=$true, HelpMessage="Enter a TransportMode")]
    [ValidateSet("Auto", "DirectStorageAccess", "HotAdd", "Nbd")]    
    [string]$TransportMode,

    [Parameter(Mandatory=$true, HelpMessage="Enter a Connected Datastore Mode")]
    [ValidateSet("Auto", "Manual")] 
    [string]$ConnectedDatastoreMode,

    [Parameter(Mandatory=$true, HelpMessage="Enter a Datastore Name")]
    [string]$DatastoreName,

    [Parameter(Mandatory=$true, HelpMessage="Enter a Max Number of Tasks")]
    [string]$MaxTasks,

    [Parameter(Mandatory=$true)]
    [switch]$EnableFailoverToNBD,

    [Parameter(Mandatory=$true)]
    [switch]$EnableHostToProxyEncryption

)

Add-PSSnapin -Name VeeamPSSnapin

Connect-VBRServer

$Datastore = @(Find-VBRViEntity -DatastoresAndVMs -Name $DatastoreName)

$params = @{ 'TransportMode' = $TransportMode;
             'ConnectedDatastoreMode' = $ConnectedDatastoreMode;
             'Datastore' = $Datastore;
             'EnableFailoverToNBD' = $EnableFailoverToNBD;
             'EnableHostToProxyEncryption' = $EnableHostToProxyEncryption;
             'MaxTasks' = $MaxTasks }

Get-VBRViProxy -Name $ProxyName | Set-VBRViProxy @params

Disconnect-VBRServer 

Remove-PSSnapin -Name VeeamPSSnapin