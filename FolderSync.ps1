#Author: Daniel Huang

##############################################################################################
#Description: Given two paths, it syncs all folders between the two directories. The first robocopy
#              mirrors everything from folder1 to folder2 but does not overwrite items in folder2
#              with a later "Modified Date" value. The second Robocopy simply mirrors everything from
#              folder2 to folder1 so that they become identical. 
##############################################################################################
#Copy and paste the directory path into the quotes below
$Folder1Path = "C:\ExampleFolder1"
$Folder2Path = "C:\ExampleFolder2"

Robocopy /E /XO $Folder1Path $Folder2Path

Robocopy /MIR $Folder2Path $Folder1Path

PAUSE
