Install-RemoteAccess -VpnType Vpn
$ExternalInterface = "WAN"
$InternalInterface = "LAN"
netsh routing ip nat add interface $ExternalInterface
netsh routing ip nat set interface $ExternalInterface mode=full
netsh routing ip nat add interface $InternalInterface
netsh routing ip nat show interface