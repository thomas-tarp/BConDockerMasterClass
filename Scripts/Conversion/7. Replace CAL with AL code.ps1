# This script will uninstall all apps, remove C/AL objects and publish the baseapp from the AL project folder.
# The -useCleanDatabase flag removes apps and C/AL objects.
# Without it, the app will simply be published to the container.

$containerName = "BCOPAL"
$appFile = "C:\ProgramData\NavContainerHelper\AL\DemoSolution\output\Thomas Tarp_myapp_1.0.0.0.app"
$appDotNetPackagesFolder = "C:\ProgramData\NavContainerHelper\AL\DemoSolution\.netpackages"

Publish-NewApplicationToNavContainer -containerName $containerName `                                     -appDotNetPackagesFolder $appDotNetPackagesFolder `                                     -appFile $appFile `                                     -useCleanDatabase