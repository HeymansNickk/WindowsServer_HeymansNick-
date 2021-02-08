$ip = "192.168.100.10"
$startScope = "192.168.100.160"
$endScope = "192.168.100.200"
Install-WindowsFeature -Name 'DHCP' -IncludeManagementTools 
Add-WindowsFeature -IncludeManagementTools dhcp

Add-DhcpServerInDC
Get-DhcpServerInDC

Add-DhcpServerV4Scope -Name "HoGent-CORONA" -StartRange $startScope -EndRange $endScope -SubnetMask 255.255.255.0 
Get-DhcpServerv4Scope

Set-DhcpServerV4OptionValue -DnsServer $ip -Router $ip 
Set-DhcpServerv4Scope -ScopeId $ip -LeaseDuration 1.00:00:00 
Get-DhcpServerv4OptionValue

Restart-Service DHCPServer -Force  
Get-Service dhcpserver