$ip = "192.168.100.10"
Write-Host "Changing time zone to Brussels"
Set-TimeZone -name "Romance Standard Time"

netsh interface ip set address "Ethernet 2" static $ip 255.255.255.0
Set-DnsClientServerAddress -InterfaceAlias Ethernet -ServerAddresses $ip

Restart-Computer