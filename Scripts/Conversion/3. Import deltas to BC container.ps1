# Import the previously created and refactored deltas into a destination container

# Settings
$imageName = "mcr.microsoft.com/businesscentral/onprem:1904-rtm"
$containerName = "BCOP"
$licenseFile = "C:\temp\NAV-dev-license.flf"
$deltaFolder = "C:\ProgramData\NavContainerHelper\Extensions\nav2017\delta"

# Create Business Central container
New-NavContainer -accept_eula `
                 -accept_outdated `
                 -imageName $imageName `
                 -containerName $containerName `
                 -licenseFile $licenseFile `
                 -updateHosts `
                 -includeCSide

# Import and compile Deltas
Import-DeltasToNavContainer -containerName $containerName -deltaFolder $deltaFolder
Compile-ObjectsInNavContainer -containerName $containerName -filter "Modified=Yes"