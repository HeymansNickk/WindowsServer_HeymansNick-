#create container for management 
#load the module
Import-Module ActiveDirectory
#find our domain
$root = (Get-ADRootDSE).defaultNamingContext
$ou = $null 
#get or create container
try 
{ 
$ou = Get-ADObject "CN=System Management,CN=System,$root" 
} 
catch 
{ 
Write-Verbose "System Management container does not currently exist." 
}
#get OU
if ($ou -eq $null) 
{ 
$ou = New-ADObject -Type Container -name "System Management" -Path "CN=System,$root" -Passthru 
}
$acl = get-acl "ad:CN=System Management,CN=System,$root"
#get computer SID
$computer = get-adcomputer $env:ComputerName 
$sid = [System.Security.Principal.SecurityIdentifier] $computer.SID
#create access enty
$ace = new-object System.DirectoryServices.ActiveDirectoryAccessRule $sid, "GenericAll", "Allow", "All"

$acl.AddAccessRule($ace) 
Set-acl -aclobject $acl "ad:CN=System Management,CN=System,$root"

#Create service and user account
Import-Module ActiveDirectory
New-ADGroup -Name "SCCM_Admins"  -GroupScope Global

New-ADUser -Name "SCCM_SQLService" -SamAccountName "sqlsccm" -Path "CN=SCCM-Admins, CN=Users, DC=nick, DC=corona" -AccountPassword(Read-Host -AsSecureString "Nick123") -Enabled $true
New-ADUser -Name "SCCM_SQLSvrAgent" -SamAccountName "sqlsvragent" -Path "CN=SCCM-Admins, CN=Users, DC=nick, DC=corona" -AccountPassword(Read-Host -AsSecureString "Nick123") -Enabled $true
New-ADUser -Name "SCCMAdmin" -SamAccountName "sccmadmin" -Path "CN=SCCM-Admins, CN=Users, DC=nick, DC=corona" -AccountPassword(Read-Host -AsSecureString "Nick123") -Enabled $true
