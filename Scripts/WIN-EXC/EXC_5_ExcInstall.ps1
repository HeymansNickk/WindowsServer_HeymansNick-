$domainName = "nick.corona"
# de iso zal gedownload worden van Michiels sharepoint drive
$exchangeDownloadLink = "https://hogent-my.sharepoint.com/personal/michiel_vanreybrouck_student_hogent_be/_layouts/15/download.aspx?SourceUrl=%2Fpersonal%2Fmichiel%5Fvanreybrouck%5Fstudent%5Fhogent%5Fbe%2FDocuments%2FWINSERV%2FExchange%2Eiso"
#Installeren van de prerequisites
Install-WindowsFeature Server-Media-Foundation, NET-Framework-45-Features, RPC-over-HTTP-proxy, RSAT-Clustering, RSAT-Clustering-CmdInterface, RSAT-Clustering-Mgmt, RSAT-Clustering-PowerShell, WAS-Process-Model, Web-Asp-Net45, Web-Basic-Auth, Web-Client-Auth, Web-Digest-Auth, Web-Dir-Browsing, Web-Dyn-Compression, Web-Http-Errors, Web-Http-Logging, Web-Http-Redirect, Web-Http-Tracing, Web-ISAPI-Ext, Web-ISAPI-Filter, Web-Lgcy-Mgmt-Console, Web-Metabase, Web-Mgmt-Console, Web-Mgmt-Service, Web-Net-Ext45, Web-Request-Monitor, Web-Server, Web-Stat-Compression, Web-Static-Content, Web-Windows-Auth, Web-WMI, Windows-Identity-Foundation, RSAT-ADDS
.\Setup.exe /M:Install /R:Mailbox, ManagementTools /IAcceptExchangeServerLicenseTerms
Set-Location C:/
Invoke-WebRequest $exchangeDownloadLink -OutFile Exchange.iso
Mount-DiskImage -ImagePath .\Exchange.iso
$exchangeISO = (Get-DiskImage ".\Exchange.iso" | Get-Volume).DriveLetter
Install-WindowsFeature RSAT-ADDS
Set-Location $exchangeISO
.\Setup.exe /M:Install /R:Mailbox, ManagementTools /IAcceptExchangeServerLicenseTerms
.\Setup.exe /PrepareSchema /IAcceptExchangeServerLicenseTerms 
.\Setup.exe /PrepareAD /OrganizationName:$domainName /IAcceptExchangeServerLicenseTerms
