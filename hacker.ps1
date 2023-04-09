<#
.SYNOPSIS
    hacker.ps1 [options]
.DESCRIPTION
    hacker.ps1 is a PowerShell script that makes it look like you are typing
    code like a hacker.
.PARAMETER speed
    Changes the typing speed.
.PARAMETER file
    Specifies the file to get code from.
.PARAMETER textcolor
    Specifies the text color.
.INPUTS
    None
.OUTPUTS
    None
.LINK
    GitHub Repository: https://github.com/IAmMoltony/ps-hackertyper
.NOTES
    Author: moltony (https://github.com/IAmMoltony)
    Creation Date: April 9, 2023
#>

param (
    [UInt16]$speed = 1,
    [string]$file = "./code.txt",
    [System.ConsoleColor]$textcolor = [System.ConsoleColor]::Green
)

$i = 0
$content = Get-Content -Path $file -Raw
Clear-Host

Write-Host "       --HackerTyper--"
Write-Host "        Start Typing!"
Write-Host

while ($true) {
    if ($Host.UI.RawUI.KeyAvailable) {
        # user pressed key
        $key = $Host.UI.RawUI.ReadKey(
            [System.Management.Automation.Host.ReadKeyOptions]::NoEcho)

        # check if it is esc, in which case we quit
        if ($key.VirtualKeyCode -eq 27) {
            break
        } else {
            # any other key
            for ($j = 0; $j -lt $speed; $j++) {
                Write-Host $content[$i + $j] -NoNewline -ForegroundColor $textcolor
            }
            $i += $speed
        }
    }
}
