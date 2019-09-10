# This script will create a development container for the AL solution (code customized).
# The -includeAL flag creates a folder with the AL baseapp.

# Settings
$imageName = "mcr.microsoft.com/businesscentral/onprem:1904-rtm"
$containerName = "BCOPAL"
$licenseFile = "C:\temp\NAV-dev-license.flf"

# Create Business Central container
New-NavContainer -accept_eula `
                 -accept_outdated `
                 -imageName $imageName `
                 -containerName $containerName `
                 -licenseFile $licenseFile `
                 -updateHosts `
                 -includeAL