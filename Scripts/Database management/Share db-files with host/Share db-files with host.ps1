# This script demonstrates how you can share the container database with the host.
# This script must be used with the accompanying SetupDatabase.ps1 script which must
# be placed in the directory specified in the -myScripts flag below.

$additionalParameters = @("-v c:\temp\shareddb:c:\shareddb")
New-NavContainer -accept_eula `
                 -containerName "shareddb" `
                 -imageName "mcr.microsoft.com/businesscentral/sandbox:dk" `
                 -additionalParameters $additionalParameters `
                 -myScripts @("C:\temp\navscripts\SetupDatabase.ps1") `
                 -updateHosts