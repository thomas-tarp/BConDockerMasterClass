# This script will convert the solution to AL code and add it to the AL project folder.
# Note that it is converted from the refactored solution container.

$containerName = "BCOPrf"
$alProjectFolder = "C:\ProgramData\NavContainerHelper\AL\DemoSolution"

Convert-ModifiedObjectsToAl -containerName $containerName `                            -startId 50100 `                            -doNotUseDeltas `                            -alProjectFolder $alProjectFolder `                            -alFilePattern "*.al,*.xlf"