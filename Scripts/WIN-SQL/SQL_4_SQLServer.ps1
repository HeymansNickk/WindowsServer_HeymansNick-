#firewall configuration
Set-NetFirewallProfile -Profile Domain,Public,Private -Enabled False
New-NetFirewallRule -DisplayName "MSSQL" -Direction Inbound -LocalPort 1433 -Protocol TCP -Action Allow
New-NetFirewallRule -DisplayName "Allow mangement sql" -Direction Inbound -Program "C:\Program Files\Microsoft SQL Server\MSSQL17.SQLEXPRESS\MSSQL\Binn\sqlservr.exe" -RemoteAddress LocalSubnet -Action Allow

$sqlDownloadLink = "https://download.microsoft.com/download/4/8/6/486005eb-7aa8-4128-aac0-6569782b37b0/SQL2019-SSEI-Eval.exe"
Set-Location C:/
Invoke-WebRequest $sqlDownloadLink -OutFile SQLServer.exe
Start-Process -FilePath ./SQLServer.exe -ArgumentList "/action=download /quiet /enu /MediaPath=C:/" -wait
Remove-Item ./SQLServer.exe
Start-Process -FilePath C:/SQLEXPR_x64_ENU.exe -WorkingDirectory C:/ /qs -wait
Start-Process -FilePath C:/SQLEXPR_x64_ENU/SETUP.EXE -ArgumentList "/Q /Action=install /IAcceptSQLServerLicenseTerms /FEATURES=SQL,RS,Tools /TCPENABLED=1 /SECURITYMODE=`"SQL`" /SQLSVCACCOUNT="$domainName\Administrator" /SQLSYSADMINACCOUNTS=`"$domainName\Domain Admins`" /INSTANCENAME=`"MSSQLSERVER`" /INSTANCEID=`"SQL`" /AGTSVCACCOUNT="NT AUTHORITY\Network Service" SQLCOLLATION=SQL_Latin1_General_CP1_CI_AS /SQLSVCPASSWORD=`"Nick123`"" -wait