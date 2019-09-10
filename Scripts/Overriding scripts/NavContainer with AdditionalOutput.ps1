# A container that overrides the AdditionalOutput.ps1 script.
# Remember to add the override script to the defined path

$imageName = "mcr.microsoft.com/businesscentral/sandbox:dk"
$containerName = "addOutput"

New-NavContainer -accept_eula -containerName $containerName -imageName $imageName -myScripts @("C:\temp\navscripts\AdditionalOutput.ps1") -updateHosts