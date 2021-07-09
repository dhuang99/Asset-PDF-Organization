<!-- Project Title -->
<h2 align="left">PDF Name Organizer</h2>
<p align="left">A PowerShell script that organizes properly named PDFs into their respective folders based on First and Last names.</p>


<!-- Table of Contents -->
<summary><h2 style="display: inline-block">Table of Contents</h2></summary>
<ol> 
	<li>
		<a href="#about-the-project">About The Project</a>
	</li>
	<li><a href="#getting-started">Gettings Started</a>
		<ul>
			<li> <a href="#prerequisites">Prerequisites</a> </li>
			<li> <a href="#installation">Installation</a> </li>
		</ul>
	</li>
	<li><a href="#usage">Usage</a>
		<ul>
			<li> <a href="#naming-convention">Naming Convention</a> </li>
			<li> <a href="#installation">Installation</a> </li>
			<li> <a href="#executing-the-script">Executing The Script</a> </li>
		</ul>
	</li>
	<li><a href="road-map">Road Map</a>
		<ul>
			<li> <a href="known-issues">Known Issues</a> </li>
			<li> <a href="proposed-features">Proposed Features</a> </li>
		</ul>
	</li>
			
</ol>		
	

## About The Project
During one of my summer internships, I was given the task of scanning in every asset form for every asset that each new employee would recieve and sign. Once I finished scanning each form, I would have to find/create the asset folder for the respective employee in the company's massive file system and place every asset form in it. 
</br> </br>
What made this task so tedious was that the department hated this kind of work and so most of the asset forms accumulated over time. When I was given this task, I was given a stack of 1200+ asset forms to scan and organize. I didn't want to spend my entire summer internship clicking through directories, so I self-learned PowerShell and wrote this script to automate the organization aspect of the task.
</br> </br>
The script all the PDFs in the specified source directory and places them in the correct folder/creates a new folder in the destination directory based on the name of the PDF. This script does not work unless all the PDFs are properly named according to the naming convention.

## Getting Started
To download and use this script, follow these simple steps.

### Prerequisites
You need to run this script on a Windows 10 machine. There should be no other prerequisites as I use no other third party packages. I have not tested whether it is backwards compatible with previous versions of Windows.

### Installation
To download the script, download the zip file and extract it. You can then move the script to your desired location. 

## Usage
The script is currently has its source and destintation set to the Source and Destination folders. You can change this by editing the variables at the top of the `PDF_Organizer.ps1` file.  

### Naming Convention
To allow the script to run properly, the PDFs must be named correctly. Each PDF must be named according to the following format:
```sh
[First Name] [Last Name] [Anything Else]
```
Some examples are:
```sh
Daniel Huang Laptop Asset Form (5490)
Bobby Smith Finance Sheet
Juddy Brown This Can Be Literally Anything
```
### Executing the Script
The main script is the `PDF_Organizer.ps1` file. The easiest way to run the script (and all the other scripts) would be executing with PowerShell. You can do this by right clicking the script and choosing `Run with PowerShell`. However, you can alternatively create a new shortcut and use the following as the target:
```sh
powershell.exe -noexit -ExecutionPolicy Bypass -File "Path To PDF_Organizer.ps1"
```
You will have the option of saving a transcript when you start the script. While the script is running, it will let you know when a folder is created (yellow text) and when a PDF is succesfully moved to its appropriate folder (green text). If there is a duplicate, then it will ask whether you want to add another PDF with a number at the end.

### Example
You can run the `Generate Example.ps1` script to create dummy PDFs in the Source folder so that you can run the script and see it in action. The script will create folders and PDFs in the Destination folder.

## Road Map
This script was created as a quick automation tool and a way for me to learn PowerShell. Thus, it will have a lot of places where it can improve.

### Known Issues
* The script **CANNOT** account for the following cases. If the name of a PDFs falls under these cases, you should organize them manually as the script will create a new incorrect folder and place the PDF there.
	* Suffixes (Jr., Sr., Roman Numberals)
	* Compound Last Names (example: Zac de la Cruz), account for hyphenated names
	* Alternate names/nicknames (example: Will for William, Chuck for Charles, etc.)
* The the destintation cannot be in the same directory or subdirectory as the source folder. This is because the script recursively searches for all PDFs in the source folder and will count all of the PDFs in the destination as part of the source. 
* As of now, you have to have a space and something else after the last name or else it will consider ".pdf" as part of the last name.

### Proposed Features
I've thought of a few features to add to the script in the future:
* A tag that can catch certain cases of names that are currently unable to be processed by the script
* The ability to just have the first and last name and not anything else.
* A GUI to simplify process for the user
* The ability for the script to search for people's names in the PDF name instead of requiring the name to be the first two words

 
