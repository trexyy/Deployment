import-module WebAdministration

$ErrorActionPreference = "Stop"

mkdir C:\dir1\dir
mkdir C:\dir2\dir

$newsite = "newsitename"
$newsitepath = "C:\dir1\dir"
dir IIS:\Sites\ | where {$_.name -eq $newsite} | Remove-Item -Force -Recurse
New-Website $newsite -physicalPath $newsitepath -Id 3 -HostHeader $newsite


$newsite = "newsitename"
$newsitepath = "C:\dir2\dir"
    dir IIS:\Sites\ | where {$_.name -eq $newsite} | Remove-Item -Force -Recurse
    New-Website $newsite -physicalPath $newsitepath -Id 4
    New-WebBinding $newsite -hostheader $newsite
New-WebApplication "/newwebapplication" -PhysicalPath "$newsitepath\nameofthedir" -ApplicationPool "apppoolname" -site $newsite
