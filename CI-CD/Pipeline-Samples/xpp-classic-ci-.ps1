
$Organization = Read-Host "Organization name (X in X.visualstudio.com or dev.azure.com/X)"
$Project = Read-Host "Project name"
$PATToken = Read-Host "PAT Token"
$Branch = Read-Host "Branch name (hit ENTER for default 'Main')"
if (!$Branch)
{
    $Branch = "Main"
}
$PipelineName = Read-Host "Pipeline name (hit ENTER for default 'X++ ($Branch)'"
if (!$PipelineName)
{
    $PipelineName = "X++ ($Branch)"
}

$jsonfile ="xpp-classic-ci.json"
$version = Read-Host "Type 17 for 10.0.17 or earlier, or Type 39 for 10.0.39 or earlier, or ENTER for default (40) for 10.0.40 or newer"
if ($version -eq "17")
{
    $jsonfile = "xpp-classic-ci - 10.0.17 or earlier.json"
}
elseif ($version -eq "39")
{
    $jsonfile = "xpp-classic-ci - 10.0.39 or earlier.json"
}
elseif ($version -eq "40")
{
    $jsonfile ="xpp-classic-ci.json"
}

$URI = "https://dev.azure.com/$($Organization)/$($Project)/_apis/build/definitions?api-version=5.1"

[int]$ExitCode = 0
try
{
    $TokenBytes = [Text.Encoding]::UTF8.GetBytes(":$($PATToken)")
    $TokenBase64 = [Convert]::ToBase64String($TokenBytes)
    $AuthHeader = @{ Authorization = "Basic " + $TokenBase64 }

    [string]$Pipeline = Get-Content -Raw (Join-Path -Path $PSScriptRoot -ChildPath $jsonfile)
    $Pipeline = $Pipeline.Replace('{\"mappings\":[]}', '{\"mappings\":[{\"serverPath\":\"$/' + $ProjectName + '/Trunk/' + $Branch + '\",\"mappingType\":\"map\",\"localPath\":\"\\\\\"}]}')
    $Pipeline = $Pipeline.Replace('"name": "X++ Classic Pipeline",','"name": "' + $PipelineName + '",')

    Write-Host "Calling API at $URI"
    Invoke-RestMethod -Uri $URI -Method POST -Headers $AuthHeader -Body $Pipeline -ContentType "application/json"

    Write-Host
    Write-Host
    Write-Host "New pipeline definition successfully created."
}
catch [System.Exception]
{
    $_.ErrorDetails.Message

    Write-Host
    Write-Host
    Write-Host "Please ensure that the PAT token is not expired and valid for project '$Project'"
    Write-Host "Please ensure the PAT token has access to `"Build 'read&execute'`" and `"Agent Pool 'read'`""
    Write-Host "Please ensure you have the marketplace extension installed from https://marketplace.visualstudio.com/items?itemName=Dyn365FinOps.dynamics365-finops-tools"
    $ExitCode = -1
}

Exit $ExitCode
