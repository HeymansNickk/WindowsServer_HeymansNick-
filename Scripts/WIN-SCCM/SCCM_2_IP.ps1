$ip = "192.168.100,40" 
$dns = "192.168.100.10"
$dgw = "192.168.100.10"
New-NetIPAddress -InterfaceAlias "LAN" -IPAddress $ip -PrefixLength 24 -DefaultGateway $dgw
Set-DnsClientServerAddress -InterfaceAlias "LAN" -ServerAddresses $dgw, $dns

Write-Host "Changing time zone to Brussels"
Set-TimeZone -name "Romance Standard Time"


Restart-Computer -Force