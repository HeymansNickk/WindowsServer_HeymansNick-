$hostname = "WIN-SQL"
Rename-Computer -ComputerName $env:COMPUTERNAME -newName $hostname -Force
Restart-Computer