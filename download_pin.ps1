Add-Type -AssemblyName System.IO.Compression.FileSystem
$client = new-object System.Net.WebClient

$path=(Get-Item -Path ".\" -Verbose).FullName.toString()
$file=$path+"\\pin-2.14-71313-msvc12-windows.zip"
#download file
$client.DownloadFile("http://software.intel.com/sites/landingpage/pintool/downloads/pin-2.14-71313-msvc12-windows.zip",$path+"\\pin-2.14-71313-msvc12-windows.zip")
#extract
[System.IO.Compression.ZipFile]::ExtractToDirectory([string]$file, [string]$path)
Start-Sleep -s 2
$src=$path+"\\pin-2.14-71313-msvc12-windows"
$dst =$path+"\\Pin"
#rename file
Rename-Item -path  $src -newName $dst
$add=$path+"\\Additional\*"
$new =$path+"\\Pin"
Copy-Item $add $new"\\source\\include\\pin\\"
