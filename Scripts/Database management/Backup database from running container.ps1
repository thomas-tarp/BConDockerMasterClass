# This script demonstrates how to perform a backup of a database (as .bak-file)
# from a running container.
# The .bak-file will be available in this directory:
# C:\ProgramData\NavContainerHelper\Extensions\<container>

$containerName = "backup" #Modify to your specific container

Backup-BCContainerDatabases $containerName