$IPType = "IPv4"
$adapter = Get-NetAdapter | ? {$_.Status -eq "up"}
$interface = $adapter | Get-NetIPInterface -AddressFamily $IPType

Write-Host "Changing time zone to Brussels"
Set-TimeZone -name "Romance Standard Time"

If ($interface.Dhcp -eq "Disabled") {
 # Remove existing gateway
 If (($interface | Get-NetIPConfiguration).Ipv4DefaultGateway) {
 $interface | Remove-NetRoute -Confirm:$false

 }
 # Enable DHCP
 $interface | Set-NetIPInterface -DHCP Enabled

 # Configure the DNS Servers automatically
 $interface | Set-DnsClientServerAddress -InterfaceAlias Ethernet -ServerAddresses 192.168.100.10
}

Restart-Computer -Force