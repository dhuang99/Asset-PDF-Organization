# Asset PDF Organization
 A PowerShell script that organizes properly named asset PDFs into their respective folders

ITEM: Laptop, iPhone, iPad Pro, iPad Air, Monitor, Android, Cradlepoint, etc.

EXAMPLES:
	Daniel Huang Laptop Asset Form (5490) <-- for Latitude 5490
	Daniel Huang iPhone Asset Form (6s) <-- for iPhone 6s
	Daniel Huang iPad Pro Asset Form (10.5) <-- for iPad Pro 10.5"
	Daniel Huang Monitor Asset Form (E5470) <-- for monitors you may not even be able to find the 
							model on support.dell.com. In that case just
							don't include the parentheses. 
	NOTE: It is often that a user gets two monitors. In that case just add A,B,C,etc. on the end.

HOW TO RUN SCRIPT:

Copy and paste the AssetFormScript.ps1 into the folder with the renamed pdfs. Double click the path (or
URL) bar and replace all the text with "powershell". Press enter and a powershell command prompt should
pop up. Type in AssetFormScript.ps1 (or just Asset and press Tab) and then press enter. An error will
appear, ignore it, and then if you want to save a text file of the powershell session type in Y and if
not type in N and press enter. 

When running the script, the script lets you know when a folder has been created (the yellow text) and
when the pdf file has been successfully moved (the green text). If there is a duplicate the script will
prompt you on whether you want to create a new pdf with a number on the end. Type in Y or N depending 
on what is already in the user's folder on the DAVIS site and press enter.


THINGS THAT THE SCRIPT CANNOT ACCOUNT FOR (look out for these before and after running the script):
	-Suffixes (Jr., Sr., Roman Numberals)
	-Compound Last Names (example: Zac de la Cruz), account for hyphenated names
	-Alternate names/nicknames (example: Will for William, Chuck for Charles, etc.)