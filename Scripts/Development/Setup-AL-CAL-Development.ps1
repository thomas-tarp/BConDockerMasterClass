# This script demonstrates how to set up a Business Central container
# with both AL and C/SIDE development environments

# Note: You need a license in order to include C/SIDE.
#       EnableSymbolLoading is included in case you need to make changes to the base application
#       (import .fob-files or change objects)
#       The 'includeAL' flag creates a baseline of AL objects
#       Be aware that it will take a while to export all objects.

$imageName = "mcr.microsoft.com/businesscentral/sandbox:dk"
$containerName = "ALCALEnv"
$licenseFile = "C:\temp\NAV-dev-license.flf"

New-NavContainer -accept_eula `                 -imageName $imageName `                 -containerName $containerName `                 -licensefile $licenseFile `                 -includeCSide `                 -includeAL `                 -enableSymbolLoading