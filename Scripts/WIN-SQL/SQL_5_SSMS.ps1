$SSMSDownloadLink = "https://download.microsoft.com/download/2/d/1/2d12f6a1-e28f-42d1-9617-ac036857c5be/SSMS-Setup-ENU.exe"
Set-Location C:/
Invoke-WebRequest $SSMSDownloadLink -OutFile SSMS.exe
Start-Process -FilePath "C:\SSMS.exe" -ArgumentList '/s' -Wait -PassThru