if ($restartingInstance) {
    # Do nothing on restart
} else {
    $databaseFolder = "c:\shareddb\"
    Write-Host "Using $databaseFolder as new location for database files"

    $mdfName = Join-Path $databaseFolder "$DatabaseName.mdf"
    $ldfName = Join-Path $databaseFolder "$DatabaseName.ldf"
    $filesExists = (Test-Path $mdfName -PathType Leaf) -and (Test-Path $ldfName -PathType Leaf)

    Write-Host "Take database [$DatabaseName] offline"
    Invoke-SqlCmd -Query "ALTER DATABASE [$DatabaseName] SET OFFLINE WITH ROLLBACK IMMEDIATE"

    if ($filesExists) {
        Write-Host "Database files for [$DatabaseName] already exists"
    } else {
        Write-Host "Move database files for [$DatabaseName]"
        (Invoke-SqlCmd -Query "SELECT Physical_Name as filename FROM sys.master_files WHERE DB_NAME(database_id) = '$DatabaseName'").filename | ForEach-Object {
            $FileInfo = Get-Item -Path $_
            $DestinationFile = "{0}{1}{2}" -f $databaseFolder, $DatabaseName, $FileInfo.Extension
            if (($DestinationFile -ne $mdfName) -and ($destinationFile -ne $ldfName)) { throw "Unexpected filename: $DestinationFile" }
            Copy-Item -Path $FileInfo.FullName -Destination $DestinationFile -Force
        }
    }

    Write-Host "Drop database [$DatabaseName]"
    Invoke-SqlCmd -Query "DROP DATABASE [$DatabaseName]"

    $Files = "(FILENAME = N'$mdfName'), (FILENAME = N'$ldfName')"
    Write-Host "Attach files as new Database [$DatabaseName]"
    Invoke-SqlCmd -Query "CREATE DATABASE [$DatabaseName] ON (FILENAME = N'$mdfName'), (FILENAME = N'$ldfName') FOR ATTACH"
}