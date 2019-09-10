# This script demonstrates how to use docker commit to save a new image and then push it to a repository on Docker Hub
# It will start a container, import a solution, and stop the container again.
# You can only use docker commit on a stopped Windows container.

$imageName = "mcr.microsoft.com/businesscentral/sandbox:dk"
$containerName = "commitBC"
$licenseFile = "C:\temp\NAV-dev-license.flf"
$DemoSolution = "C:\Users\TMTD\Desktop\Business Central on Docker Image\Business Central on Docker - MasterClass Files\Testfiles\DemoSolution2.txt" #Modify to your solution path
$dockerRepoTag = "thomastarpnetc/bcsandbox:v0.2" #Modify to your Docker Hub repo and version

New-NavContainer -accept_eula `                 -imageName $imageName `                 -containerName $containerName `                 -licenseFile $licenseFile `                 -includeCSide `                 -doNotExportObjectsToText `                 -updateHosts

if (!(Test-Path $DemoSolution)) {
    Download-File -sourceUrl "https://bcdocker.blob.core.windows.net/public/DemoSolution2.txt" -destinationFile $demoSolution2Path
}
Import-ObjectsToNavContainer -containerName $containerName -objectsFile $DemoSolution
Compile-ObjectsInNavContainer -containerName $containerName -filter "Modified=Yes"

Stop-NavContainer $containerName

# After running the script, run the following commands in the CLI.
# Remember to replace the variables with your values.
#docker commit $containerName $dockerRepo 
# You can use 'docker images' to see that your commit stored a new image on your host.
#docker push $dockerRepoTag