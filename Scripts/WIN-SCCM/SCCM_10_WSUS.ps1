Set-Location c:\
Install-WindowsFeature -Name UpdateServices-DB, UpdateServices-Services -IncludeManagementTools
.\wsusutil.exepostinstall SQL_INSTANCE_NAME="WIN-SCCM" CONTENT_DIR=C:\WSUS