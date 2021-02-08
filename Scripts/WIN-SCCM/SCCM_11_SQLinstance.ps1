$sqllink = "https://download.microsoft.com/download/d/a/2/da259851-b941-459d-989c-54a18a5d44dd/SQL2019-SSEI-Dev.exe"
Invoke-WebRequest $sqllink -OutFile sqlserv2019.exe
Start-Process -FilePath ./sqlserv2019.exe -ArgumentList "/action=download /quiet /enu /MediaPath=C:/" -wait
Remove-Item ./sqlserv2019.exe
Start-Process -FilePath C:/SQL2019_x64_ENU.exe -WorkingDirectory C:/ /qs -wait
Start-Process -FilePath C:/SQL2019_x64_ENU/SETUP.EXE -ArgumentList "/Q /Action=install /IAcceptSQLServerLicenseTerms /FEATURES=SQL,RS,Tools /TCPENABLED=1 /SECURITYMODE=`"SQL`" /SQLSVCACCOUNT="$domain\SQLServAgent" /SQLSYSADMINACCOUNTS=`"$domain\Domain Admins`" /INSTANCENAME=`"MSSQLSERVER`" /INSTANCEID=`"SQL`" /AGTSVCACCOUNT="NT AUTHORITY\Network Service" SQLCOLLATION=SQL_Latin1_General_CP1_CI_AS /SQLSVCPASSWORD=`"Nick123`"" -wait
