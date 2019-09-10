# This script helps you explore the file system of your container.

# Run this script in the container PowerShell Prompt to see subdirectories in run folder
$folders = Get-ChildItem -Path C:\run -Recurse -Directory -Force -ErrorAction SilentlyContinue | Select-Object FullName
foreach ($folder in $folders) { Write-Host "$folder`n" }

# Run this script in the container PowerShell Prompt to see all subdirectories and files in run folder
$all = Get-ChildItem -Path C:\run -Recurse -Force -ErrorAction SilentlyContinue | Select-Object FullName
foreach ($item in $all) { Write-Host "$item`n" }

# Run this script in the container PowerShell Prompt to see all subdirectories in the entire container
$folders = Get-ChildItem -Directory -Force | Select-Object FullName
foreach ($folder in $folders) { Write-Host "$folder`n" }