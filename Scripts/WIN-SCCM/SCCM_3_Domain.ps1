$domainname = "nick.corona"
$username = "$domainname\Administrator"
$password = "Nick123" | ConvertTo-SecureString -AsPlainText -Force
$credential = New-Object System.Management.Automation.PSCredential($username, $password)
Add-Computer -DomainName $domainname -Credential $credential
Restart-computer