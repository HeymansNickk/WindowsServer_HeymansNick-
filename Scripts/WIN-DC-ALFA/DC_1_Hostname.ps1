$hostname = "WIN-DC-ALFA"
Rename-Computer -ComputerName $env:COMPUTERNAME -newName $hostname -Force
Restart-Computer