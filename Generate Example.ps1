#Author: Daniel Huang

<#
Description:
Creates the proper folders and example PDFs to demonstrate the script functionality.
#>

$src = "Source\"
$examplenames =  @("Paula Phelps", "Carla Hudson", "Moses Bryant", "Allen Kelly", "Krystal Rogers", "Karla Torres", "Agnes Adams", "Suzanne Adkins", "Pam Daniel", "Loretta Cannon", "Alton Vasquez", "Marion Aguilar", "Clint Williams", "Jesse Stewart", "Herman Burton", "Danny Dennis", "Clarence Pratt", "Antonio Keller", "Crystal Richards", "Thelma Foster", "Kelli Hart", "Salvatore Curry", "Rick Farmer", "Naomi Nelson", "Jane Spencer")
$exampleitems = @("Thingy", "Monitor", "iPhone 5", "Treadmill", "I have no idea")


if (-not (Test-Path $src)) {
    Write-Host "Invalid Source Path. Creating new Source folder in current directory."
    New-Item -Path $src
}

foreach ($person in $examplenames) {
    $rand = Get-Random -Maximum 5
    $name = $person + " " + $exampleitems[$rand] + ".pdf"
    if (-not (Test-Path ($src + $name))) {
        New-Item -Path $src -Name $name -ItemType "file"
    } else {
        Write-Host $file + " already exists"
    }
}

Write-Host "`nFinished creating example PDFs."

Pause


