# This script demonstrates how to assign a premium plan to your SUPER user
# and add test users to a container.
# The premium plan enables manufacturing, production, and more functionality.

# Define variables
$imageName = "mcr.microsoft.com/businesscentral/sandbox:dk"
$containerName = "premium"

# Add premium plan to your SUPER user when creating a container
New-NavContainer -accept_eula `
                 -assignPremiumPlan `
                 -containerName $containerName `                 -imageName $imageName `
                 -updateHosts

# Set up test users in an existing container

# Password for your test users
$securePassword = ConvertTo-SecureString -String "P@ssw0rd" -AsPlainText -Force

Setup-NavContainerTestUsers -containerName $containerName -tenant default -password $securePassword