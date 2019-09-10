# List all tags for Dynamics NAV on Docker Hub
# Note that this repo might be replaced by one that is hosted on Microsoft's own servers

$ResultingObject = @()

$result = Invoke-WebRequest -Uri "https://registry.hub.docker.com/v2/repositories/microsoft/dynamics-nav/tags/?page_size=250" 
$JsonObject = ConvertFrom-Json -InputObject $result.Content
$ResultingObject = $JsonObject.results
$ParentId = 1

while ($JsonObject.next) {
    $result = Invoke-WebRequest -Uri $JsonObject.next 
    $JsonObject = ConvertFrom-Json -InputObject $result.Content
    $ResultingObject += $JsonObject.results    
    
    $percCompleted = [Math]::Round($ResultingObject.Count / $JsonObject.count, 4) * 100
    Write-Progress -Activity "Processing tags" -PercentComplete $percCompleted -ParentId $ParentId 
}

foreach ($tag in $ResultingObject) {
    Write-Host $tag.name
}

# You can also apply filters to the tags to say display only Danish versions:
# $ResultingObject | where name -like ‘*dk’ | select name