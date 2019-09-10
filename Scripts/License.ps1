# This script demonstrates how to define a license file-path when starting a container
# as well as importing a license-file to a running container.
# Note that the license file is added to a volume, and the specified license file path
# refers to a path inside the container.

$imageName = "mcr.microsoft.com/businesscentral/sandbox:dk"
$containerName = "license"
$licenseFile = "C:\temp\NAV-dev-license.flf"
$additionalParameters = @("-v c:\temp:c:\temp")

New-NavContainer -accept_eula `
                 -imageName $imageName `
                 -containerName $containerName `
                 -additionalParameters $additionalParameters `
                 -licensefile $licenseFile `
                 -updateHosts

# Import a license file to a running container
#Import-NavContainerLicense -containerName $containerName -licenseFile $licenseFile