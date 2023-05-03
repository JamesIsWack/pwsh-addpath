# Local User PATH adder script
# Written by kernaltrap
# Version 0.1
# Run "Set-ExecutionPolicy Unrestricted -Scope CurrentUser" if security policy doesnt allow unsigned scripts. Reset to default afterwards.

$addPath = 'C:\git-2.40.1;C:\kdenlive\bin;C:\krita-x64-5.1.5-setup\bin;C:\node-v18.15.0-win-x64;C:\OBS-Studio;C:\Python311;C:\SysGCC\powerpc-eabi\bin;C:\VSCode-win32-x64-1.74.3'

Function Add-PathVariable {
    param (
        [string]$addPath
    )
    if (Test-Path $addPath){
        $regexAddPath = [regex]::Escape($addPath)
        $arrPath = $env:Path -split ';' | Where-Object {$_ -notMatch "^$regexAddPath\\?"}
        $env:Path = ($arrPath + $addPath) -join ';'
    } else {
        Throw "'$addPath' is not a valid path."
    }
}
Write-Output ("Successfully added programs to PATH.")
