#Author: Daniel Huang

<# 
Deletes everything in the folders "Source" and "Destination".
#>

function delete ($folder) {
    if (Test-Path $folder) {
        Write-Host "Deleting all files in ""$folder""."
        Remove-Item -Path "$folder/*" -Recurse
    } else {
        Write-Host """$folder"" folder doesn't exist."
        Pause
    }
}

delete("Source")
delete("Destination")

