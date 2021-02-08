$SECMDownloadlink = "https://download.microsoft.com/download/e/0/a/e0a2dd5e-2b96-47e7-9022-3030f8a1807b/MEM_Configmgr_2002.exe"
Set-Location C:/
Invoke-WebRequest $SECMDownloadlink -OutFile SECM.exe
Add-Type -AssemblyName System.IO.compression.FileSystem
[System.IO.Compression.zipFile]::ExtractToDirectory('c:\SECM.exe','c:\SECM')
Set-Location C:\SECM\SMSSETUP\bin\x64
./extendsch