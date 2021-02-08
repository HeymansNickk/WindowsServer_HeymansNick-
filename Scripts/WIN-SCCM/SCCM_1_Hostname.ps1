$hostname = "SCCM"
Rename-Computer -ComputerName $env:COMPUTERNAME -newName $hostname -Force
Restart-Computer