$ADKDownloadLink = "https://download.microsoft.com/download/B/E/6/BE63E3A5-5D1C-43E7-9875-DFA2B301EC70/adk/adksetup.exe"
$pedow = "https://download.microsoft.com/download/3/c/2/3c2b23b2-96a0-452c-b9fd-6df72266e335/adkwinpeaddons/adkwinpesetup.exe"
Invoke-WebRequest $ADKDownloadLink -OutFile ADK.exe
Invoke-WebRequest $pedown -OutFile pedown.exe
.\ADK.exe /installpath "C:\Program Files (x86)\Windows Kits\10" OptionId.DeploymentToolsOptionId.DeploymentTools /ceip off /norestart
.\pedown.exe /installpath "C:\Program Files (x86)\Windows Kits" OptionId.WindowsPreinstallationEnvironment /ceip off /norestart