# Bookmarks
$dot = "C:/Users/trail/dotfiles/"
$bytepath = "D:/Games/LoveTests/bytepath/"
$c350 = "D:/Academic/CMPUT350/Valkyrie/build/bin"
$notes = "D:/Notes/PersonalNotes/"

function NVimHereOrThere ($Target = ".") {
	nvim $Target
}

Set-Alias -Name vim -Value NVimHereOrThere
Set-Alias -Name v -Value NVimHereOrThere

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

# Load plugins

# Zoxide
Invoke-Expression (& {
    $hook = if ($PSVersionTable.PSVersion.Major -lt 6) { 'prompt' } else { 'pwd' }
    (zoxide init --hook $hook powershell | Out-String)
})

# Oh My Posh prompt
oh-my-posh --init --shell pwsh --config ~/dotfiles/trail_poshtheme.json | Invoke-Expression
Import-Module -Name Terminal-Icons

# PSReadLine autocomplete
Import-Module -Name PSReadLine
Set-PSReadLineOption -PredictionSource History
Set-PSReadLineOption -PredictionViewStyle ListView
Set-PSReadLineOption -EditMode Windows

