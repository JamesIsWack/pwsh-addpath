# Local User PATH adder script
# Written by kernaltrap
# Version 0.1
# Run "Set-ExecutionPolicy Unrestricted -Scope CurrentUser" if security policy doesnt allow unsigned scripts. Reset to default afterwards.

$addPath = '' # Paths go here, seperate with semicolons.

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
