$hostname = "WIN-EXC"
Rename-Computer -ComputerName $env:COMPUTERNAME -newName $hostname -Force
Restart-Computer
