# This script demonstrates how you can mount a specific database to a container.
# Remember to place your custom database in the specified folder in a "databases\" subdirectory.

$imageName = "mcr.microsoft.com/businesscentral/sandbox:dk"
$containerName = "customdb"
$path = "C:\temp\customdb"
$attachdbSetupDatabaseScript = "https://raw.githubusercontent.com/Microsoft/nav-docker/master/override/attachdb/SetupDatabase.ps1"
New-NavContainer -accept_eula `
                 -imageName $imageName `
                 -containerName $containerName `
                 -additionalParameters @("--volume $path\databases:c:\mydb") `
                 -myScripts @($attachdbSetupDatabaseScript) `
                 -updateHosts