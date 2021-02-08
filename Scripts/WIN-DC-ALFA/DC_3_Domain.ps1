$domainname = nick.corona
$netbios = "NICK"
$password = "Nick123" | ConvertTo-SecureString -AsPlainText -Force
Install-WindowsFeature AD-Domain-Services -IncludeManagementTools -Restart
Install-ADDSForest -DomainName $domainname -SafeModeAdministratorPassword (ConvertTo-SecureString -String "Nick123" -AsPlainText -Force) -InstallDns -Force
Restart-computer