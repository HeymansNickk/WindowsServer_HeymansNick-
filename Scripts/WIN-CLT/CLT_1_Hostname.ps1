$hostname = "WIN-CLT"
Rename-Computer -ComputerName $env:COMPUTERNAME -newName $hostname -Force
Restart-Computer