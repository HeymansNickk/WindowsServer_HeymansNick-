$domainname = "nick.corona"
$username = "$domainname\Administrator"
$password = "Nick123" | ConvertTo-SecureString -AsPlainText -Force
$credential = New-Object System.Management.Automation.PSCredential($username, $password)
$dgw = "192.168.100.10"
$dns = "192.168.100.10"
Set-DnsClientServerAddress -InterfaceAlias "Ethernet" -ServerAddresses $dgw, $dns
Add-Computer -DomainName $domainname -Credential $credential
Restart-computer