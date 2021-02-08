Set-Location C:\
$linkCLR = "https://download.microsoft.com/download/1/3/0/13089488-91FC-4E22-AD68-5BE58BD5C014/ENU/x64/SQLSysClrTypes.msi"
$linkReport = "https://download.microsoft.com/download/A/1/2/A129F694-233C-4C7C-860F-F73139CF2E01/ENU/x86/ReportViewer.msi"
Invoke-WebRequest $linkCLR -OutFile CLR.exe
Invoke-WebRequest $linkReport -OutFile Report.msi
.\CLR.exe
.\Report.msi