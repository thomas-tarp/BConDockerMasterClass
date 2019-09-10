# This script demonstrates how to restore a database from a .bak-file
# both in a running container and when creating a new container.

# Running container (will stop and restart the service tier)
# Note that you need a mounted volume where you can share your .bak-file.
# This script assumes that you have mounted "C:\temp\database files".
$containerName = "restore" # Modify to your specific container
$bakFile = "C:\temp\database files\database.bak"
Restore-DatabasesinBCContainer -containerName $containerName `
                               -bakFile $bakFile
                               -databaseName "newdb" `
                               -databaseFolder "c:\databases\newdb"

# New container
# Note that the specified .bak-file path is copied into your container folder.
$imageName = "mcr.microsoft.com/businesscentral/sandbox:dk"
$containerName = "restore"
$bakFile = "C:\temp\database files\database.bak"

New-BCContainer -accept_eula `                -imageName $imageName `                -containerName $containerName `                -bakFile $bakFile `                -updateHosts