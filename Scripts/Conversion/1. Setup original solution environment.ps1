# This script starts a container with the version of NAV that the solution was built in.
# Remember to place the relevant files at the paths specified.

# Settings
$licenseFile = "C:\temp\NAV-dev-license.flf"
$demoSolutionPath = "C:\temp\DemoSolution.txt"
$containerName = "nav2017"

# Create NAV 2017 CU3 NA
New-NavContainer -accept_eula `
                 -accept_outdated `
                 -imageName "mcr.microsoft.com/dynamicsnav:2017-cu3-na" `
                 -containerName $containerName `
                 -licenseFile $licenseFile `
                 -updateHosts `
                 -includeCSide
#
# Import and compile objects
#
if (!(Test-Path $demoSolutionPath)) {
    Download-File -sourceUrl "https://bcdocker.blob.core.windows.net/public/DemoSolution.txt" -destinationFile $demoSolutionPath
}
Import-ObjectsToNavContainer -containerName $containerName -objectsFile $demoSolutionPath
Compile-ObjectsInNavContainer -containerName $containerName -filter "Modified=Yes"