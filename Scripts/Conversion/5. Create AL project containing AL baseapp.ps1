# This script creates an AL project containing the AL baseapp.
# Note that you need to have Git installed.
# It is added to Git in order to compare the baseapp with the solution later.
# The AL project folder should be in a shared directory. The default path is shared.

$containerName = "BCOPAL"
$alProjectFolder = "C:\ProgramData\NavContainerHelper\AL\DemoSolution"
$name = "myapp"
$publisher = "Thomas Tarp"
$version = "1.0.0.0"

Create-AlProjectFolderFromNavContainer -containerName $containerName `
                                       -alProjectFolder $alProjectFolder `
                                       -name $name `
                                       -publisher $publisher `
                                       -version $version `
                                       -AddGIT `
                                       -useBaseLine