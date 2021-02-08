$chromeEnterpriseDownloadLink = "https://dl.google.com/tag/s/appguid%3D%7B8A69D345-D564-463C-AFF1-A69D9E530F96%7D%26iid%3D%7B35715696-AF13-658A-0DF9-F9718B66B2B4%7D%26lang%3Den%26browser%3D3%26usagestats%3D0%26appname%3DGoogle%2520Chrome%26needsadmin%3Dtrue%26ap%3Dx64-stable-statsdef_0%26brand%3DGCEB/dl/chrome/install/GoogleChromeEnterpriseBundle64.zip"
$UCMADownloadLink = "https://download.microsoft.com/download/2/C/4/2C47A5C1-A1F3-4843-B9FE-84C0032C61EC/UcmaRuntimeSetup.exe"
$DOTNETDownloadLink = "https://download.visualstudio.microsoft.com/download/pr/2892493e-df43-409e-af68-8b14aa75c029/53156c889fc08f01b7ed8d7135badede/dotnet-sdk-5.0.100-win-x64.exe"
$VCRedistDownloadLink = "https://www.microsoft.com/download/details.aspx?id=40784"
Set-Location C:/
Invoke-WebRequest $chromeEnterpriseDownloadLink -OutFile GoogleChromeEnterpriseBundle.zip
Expand-Archive GoogleChromeEnterpriseBundle.zip
Invoke-WebRequest $UCMADownloadLink -OutFile UCMA.exe
Invoke-WebRequest $DOTNETDownloadLink -OutFile DOTNET.exe
Invoke-WebRequest $VCRedistDownloadLink -OutFile VCRedist.exe
.\GoogleChromeEnterpriseBundle64.zip\Installers\GoogleChromeStandaloneEnterprise64.msi /q
.\UCMA.exe -q
.\DOTNET.exe /passive /norestart
.\VCRedist.exe /passive /norestart
Start-Sleep -s 30
Restart-Computer