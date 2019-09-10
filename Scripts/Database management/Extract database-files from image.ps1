# This script demonstrates how to extract database files (.mdf & .ldf) from a Business Central image

$imageName = "mcr.microsoft.com/businesscentral/sandbox:dk"
$path = "c:\temp\hostdbfolder"
Extract-FilesFromNavContainerImage -imageName $imageName -path $path -extract database -force