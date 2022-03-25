# Bookmarks
$dot = "C:/Users/trail/dotfiles/"
$byte= "D:/Games/LoveTests/bytepath/"
$notes = "D:/Notes/PersonalNotes/"
$bytepath = "C:/Users/trail/Documents/Projects/Programming/Bytepath/"
$music = "D:/Music/"

function UpOneDirectory {
	cd ..
}

Set-Alias -Name .. -Value UpOneDirectory

function NVimHereOrThere ($Target = ".") {
	nvim $Target
}

Set-Alias -Name vim -Value NVimHereOrThere
Set-Alias -Name v -Value NVimHereOrThere

function NVimOpenMainWiki () {
	nvim -c "VimwikiIndex"
}

Set-Alias -Name vw -Value NVimOpenMainWiki

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

function YTDL ($Target) {
	if ($Target) {
		youtube-dl -o (Write-Host "$($music)%%(title)s.%%(ext)s") -x --audio-format "mp3" $Target
	} else {
		Write-Host "FAILED: Enter target URL" -ForegroundColor red
	}
}

# Load plugins

# Zoxide
Invoke-Expression (& {
	$hook = if ($PSVersionTable.PSVersion.Major -lt 6) { 'prompt' } else { 'pwd' }
	(zoxide init --hook $hook powershell | Out-String)
})

# Oh My Posh prompt
oh-my-posh --init --shell pwsh --config ~/dotfiles/trail_poshtheme.json | Invoke-Expression
Import-Module -Name Terminal-Icons

# PSReadLine settings
Import-Module -Name PSReadLine
Set-PSReadLineOption -BellStyle Visual
Set-PSReadLineOption -EditMode Vi
Set-PSReadLineOption -ViModeIndicator Cursor
# History List
Set-PSReadLineOption -PredictionSource HistoryAndPlugin
Set-PSReadLineOption -PredictionViewStyle ListView
# Up and Down arrow will autocomplete if current command is not empty
Set-PSReadLineKeyHandler -Key UpArrow -Function HistorySearchBackward
Set-PSReadLineKeyHandler -Key DownArrow -Function HistorySearchForward
Set-PSReadLineKeyHandler -Key Tab -Function MenuComplete

