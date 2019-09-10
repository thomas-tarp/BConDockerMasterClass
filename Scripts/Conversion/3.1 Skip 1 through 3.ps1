# Import refactored solution deltas into destination container.
# This lets you skip the refactoring process to test the conversion in itself.
# Note the solution will be downloaded if you haven't already.

# Settings
$imageName = "mcr.microsoft.com/businesscentral/onprem:1904-rtm"
$containerName = "BCOPrf"
$licenseFile = "C:\temp\NAV-dev-license.flf"
$demoSolution2Path = "C:\ProgramData\NavContainerHelper\DemoSolution2.txt"

# Create Business Central container
New-NavContainer -accept_eula `
                 -accept_outdated `
                 -imageName $imageName `
                 -containerName $containerName `
                 -licenseFile $licenseFile `
                 -updateHosts `
                 -includeCSide
#
# Import and compile objects
#
if (!(Test-Path $demoSolution2Path)) {
    Download-File -sourceUrl "https://bcdocker.blob.core.windows.net/public/DemoSolution2.txt" -destinationFile $demoSolution2Path
}
Import-ObjectsToNavContainer -containerName $containerName -objectsFile $demoSolution2Path
Compile-ObjectsInNavContainer -containerName $containerName -filter "Modified=Yes"