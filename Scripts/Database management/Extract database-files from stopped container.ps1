# This script demonstrates how you can extract database files from a stopped container.
# The script will automatically stop, extract, and restart the container.

$containerName = "dbstopped" # Modify to your specific container
$path = "C:\temp\dbstoppedcontainer"

Stop-NavContainer $containerName
Extract-FilesFromStoppedNavContainer -containerName $containerName -path $path -extract database -force
Start-NavContainer $containerName