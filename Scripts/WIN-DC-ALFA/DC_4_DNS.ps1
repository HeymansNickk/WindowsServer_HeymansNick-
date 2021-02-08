$HoGentDNS = 193.190.173.1
$GoogleDNS = 8.8.8.8

Add-DnsServerForwarder -IPAddress $HoGentDNS 
Add-DnsServerForwarder -IPAddress $GoogleDNS 
Get-DnsServerForwarder