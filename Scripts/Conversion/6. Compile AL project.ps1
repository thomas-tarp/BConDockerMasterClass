# This script will compile the AL project via the development container.

$containerName = "BCOPAL"
$alProjectFolder = "C:\ProgramData\NavContainerHelper\AL\DemoSolution"

Compile-AppInNavContainer -containerName $containerName -appProjectFolder $alProjectFolder