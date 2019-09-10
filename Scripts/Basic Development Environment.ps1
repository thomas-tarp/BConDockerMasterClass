# Basic development container
# This is all you need to setup a container for development
$imageName = "mcr.microsoft.com/businesscentral/sandbox:dk"
$containerName = "DevEnv"

# The following two commands are interchangable.
#New-NavContainer -accept_eula -imageName $imageName -containerName $containerName -updateHosts
New-BCContainer -accept_eula `                -imageName $imageName `                -containerName $containerName `                -updateHosts