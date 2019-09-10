# Import C/AL solution to container and compile
$container = DevEnv
$solution = "c:\temp\mysolution.fob"

Import-ObjectsToNavContainer  -containerName $container `
                              -objectsFile $solution

Compile-ObjectsInNavContainer -containerName $container `
                              -filter "modified=1"