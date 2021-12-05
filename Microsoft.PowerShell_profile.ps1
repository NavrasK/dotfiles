<#
$DotfilesLocation = "C:\Users\trail\dotfiles\"
$BookmarkStorageLocation = "C:\Users\trail\dotfiles\powershellbookmarks.xml"
$BookmarkBackupLocation = "C:\Users\trail\dotfiles\powershellbookmarks.bkp"
$Global:BookmarkedDirectories = @{"Un" = "Initialized"}

function UpdateBookmarkFile () {
	Copy-Item -Path $BookmarkStorageLocation -Destination $BookmarkBackupLocation -Force
	$Global:BookmarkedDirectories | Export-Clixml -Path $BookmarkStorageLocation
}

function LoadBookmarkedDirectories () {
	if (Test-Path -Path $BookmarkStorageLocation -PathType leaf) {
		Set-Variable -Name BookmarkedDirectories -Value (Import-Clixml -Path $BookmarkStorageLocation)
		#Write-Host "Found Bookmarks"
	} else {
		Set-Variable -Name BookmarkedDirectories -Value @{"dot" = $DotfilesLocation}
		New-Item -Path $DotfilesLocation -Name "powershellbookmarks.xml"
		#Write-Host "Bookmarks not found, generating new file"
		UpdateBookmarkFile
	}
}

function ListBookmarkedDirectories () {
	$Global:BookmarkedDirectories
}

LoadBookmarkedDirectories
#>

<#
function BookmarkDirectory ($Shortcut, $Target = ".") {
	Write-Host (-Join ("Shortcut: " $($Shortcut) " | Target: " $($Target))) -ForegroundColor blue
	if (!(Test-Path -Path $Target)) {
		Write-Host "FAILED: Invalid directory to bookmark" -ForegroundColor red
		return
	}
	if (Test-Path -Path $Target -PathType leaf) {
		$Target = (Get-Item $Target).Directory.FullName
	}
	if ($BookmarkedDirectories.ContainsKey($($Shortcut))) {
		$response = Read-Host "Bookmark exists, overwrite? (y/n): "
		if ($response -eq "y") {
			$BookmarkedDirectories.Add($($Shortcut), $($Target))
			UpdateBookmarkFile
		} else {
			Write-Host (-Join ("ABORTED: " $($Shortcut) " not updated, still points to " $($BookmarkedDirectories[$($Shortcut)]))) -ForegroundColor red
		}
	}
}
#>

#Set-Alias -Name bd -Value BookmarkDirectory
#Set-Alias -Name lbd -Value ListBookmarkedDirectories

function NVimHereOrThere ($Target = ".") {
	nvim $Target
}

Set-Alias -Name vim -Value NVimHereOrThere

function TouchySubject ($NewFileName) {
	if ($NewFileName) {
		if (!(Test-Path $(-join((Get-Item .).FullName, "\", $NewFileName)) -PathType leaf)) {
			New-Item -Path . -ItemType "file" -Name $NewFileName
		} else {
			Write-Host "FAILED: File already exists" -ForegroundColor red
		}
	} else {
		Write-Host "FAILED: Enter file name" -ForegroundColor red
	}
}

Set-Alias -Name touch -Value TouchySubject

