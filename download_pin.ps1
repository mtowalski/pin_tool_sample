Add-Type -AssemblyName System.IO.Compression.FileSystem
$client = new-object System.Net.WebClient
$zm=(Get-Item -Path ".\" -Verbose).FullName.toString()
$fil=$zm+"\\pin-2.14-71313-msvc12-windows.zip"
$res=$zm
$client.DownloadFile("http://software.intel.com/sites/landingpage/pintool/downloads/pin-2.14-71313-msvc12-windows.zip",$zm+"\\pin-2.14-71313-msvc12-windows.zip")

[System.IO.Compression.ZipFile]::ExtractToDirectory([string]$fil, [string]$res)
Start-Sleep -s 2
$fold=$zm+"\\pin-2.14-71313-msvc12-windows"
$new =$zm+"\\Pin"
Rename-Item -path  $fold -newName $new
$add=$zm+"\\Additional\*"
$new =$zm+"\\Pin"
Copy-Item $add $new"\\source\\include\\pin\\"
