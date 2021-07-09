#Author: Daniel Huang

function stop {
    try{
        stop-transcript|out-null
    }
    catch {
    }
    write-host "`nExiting..."
    Start-Sleep -Seconds 3.5
    exit
}

if (-not (Test-Path "Transcripts")) {
    Write-Host "No Transript Folder. Creating a Transcript Folder."
    New-Item -Path $PSScriptRoot -Name "Transcripts" -ItemType "directory"
}

Start-Transcript -Confirm -IncludeInvocationHeader -OutputDirectory ($PSScriptRoot+"\Transcripts")

#Path of the source folder (currently set to the pwd)
$Source = "Source"

#Path to the desired folder
$Destintation = "Destination"

if (-not ((Test-Path $Source) -and (Test-Path $Destintation))) {
    write-host "`nInvalid Source and Destination." -ForegroundColor Red -BackgroundColor Black
    stop
}

$FolderList = @{}

$SourceFiles = get-ChildItem $Source -Include *.pdf -recurse
$DestintationFolders = Get-ChildItem $Destintation -Recurse -Depth 1 | ?{ $_.PSIsContainer}


#Creates a string in array FolderList with format "[LastName], [FirstName]" 
foreach ($Folder in $DestintationFolders) {
    $Split = $Folder.Name -split ", " 
    $FolderName = "$($Split[0]), $($Split[1])"
    if (-not ($FolderList.ContainsKey($FolderName))) {
        $FolderList.Add($FolderName, $Folder.FullName)
    }
}

if ($SourceFiles) {

    foreach ($File in $SourceFiles) {
        $Split = $File.Name -split " "
        $OldPath = $File.FullName
        $Filename = "$($Split[1]), $($Split[0])"
        $NewPath = Join-Path -Path $Destintation -ChildPath $Filename
        $PdfName = Join-Path -Path $NewPath -ChildPath $File.BaseName

        if ($FolderList.keys -match $Filename) {
            #Move the file to the appropriate folder
            write-output "`nMoving file to folder $($Filename) with path $($NewPath)"     
            Start-Sleep -Seconds 0.5
            if (-not (Test-Path "$($PdfName).pdf")) {
                Copy-Item -Path $OldPath -Destination $NewPath
                if ($?) {
                    write-host "$($File.Name) Moved" -ForegroundColor Green
                } else {
                    write-host "Item Failed to Move (Invalid Path) `n" -ForegroundColor Red
                }
            } else {
                write-host "$($Split[0]) $($Split[1]) already has a file named ""$($File.Name)"" `n" -ForegroundColor Red

                $Counter = 1
                $NewFileName = "$($PdfName) ($($Counter)).pdf"
                while (Test-Path $NewFileName) {
                    $Counter += 1
                    $NewFileName = "$($PdfName) ($($Counter)).pdf"
                }

                $confirmation = Read-Host "Do you want to rename ""$($File.Name)"" as ""$($File.BaseName) ($($Counter)).pdf"" and add it to the folder ""$($Filename)""? [y/n]"
                while($confirmation -ne "y") {
                    if ($confirmation -eq 'n') {break}
                    $confirmation = Read-Host "Do you want to rename ""$($File.Name)"" as ""$($File.BaseName) ($($Counter)).pdf"" and add it to the folder ""$($Filename)""? [y/n]"
                }
                if ($confirmation -eq "y") {
                    Copy-Item $OldPath $NewFileName 
                    write-host "Filed moved as $($NewFileName) Moved" -ForegroundColor Green
                }
            }
                    
            write-output "`n `n"

        } else {
            #Create new Folder if the user doesn't already have one
            write-output "Creating new folder for $($Filename) with path $($NewPath) and moving file to folder"
            Start-Sleep -Seconds 0.5
            New-Item -Path $Destintation -Name $Filename -ItemType "directory"
            write-host "Folder $($Filename) has been created" -ForegroundColor Yellow -BackgroundColor Black
            $FolderList.Add($Filename, $NewPath)
            
            if (-not (Test-Path "$($PdfName).pdf")) {
                Copy-Item -Path $OldPath -Destination $NewPath
                if ($?) {
                    write-host "$($File.Name) Moved" -ForegroundColor Green
                } else {
                    write-host "Item Failed to Move (Invalid Path) `n" -ForegroundColor Red
                }
            } else {
                write-host "$($Split[0]) $($Split[1]) already has a file named $($File.Name) `n" -ForegroundColor Red

                $Counter = 1
                $NewFileName = "$($PdfName) ($($Counter)).pdf"
                while (Test-Path $NewFileName) {
                    $Counter += 1
                    $NewFileName = "$($PdfName) ($($Counter)).pdf"  
                }

                $confirmation = Read-Host "Do you want to rename $($File.Name) as $($File.BaseName) ($($Counter)).pdf? [y/n]"
                while($confirmation -ne "y") {
                    if ($confirmation -eq 'n') {
                        write-host "Did not rename $($File.Name)" -ForegroundColor Red
                        break
                    }
                    $confirmation = Read-Host "Do you want to rename $($File.Name) as $($File.BaseName) ($($Counter)).pdf? [y/n]"
                }
                if ($confirmation -eq "y") {
                    Copy-Item $OldPath $NewFileName
                    write-host "Filed moved as $($NewFileName) Moved" -ForegroundColor Green
                    Start-Sleep -Seconds 0.5
                }
            }
            write-output "`n `n"
        }   
    }
} else {
    write-host "`nNo PDFs Found in Source Location." -ForegroundColor Red -BackgroundColor Black
    stop
}

write-host "`nAll PDFs have in Source location has been processed. Press Enter to exit."
PAUSE
