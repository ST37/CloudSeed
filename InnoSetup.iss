; Script generated by the Inno Script Studio Wizard.
; SEE THE DOCUMENTATION FOR DETAILS ON CREATING INNO SETUP SCRIPT FILES!

#define MyAppName "Cloud Seed"
#define MyAppVersion "1.0.1"
#define MyAppPublisher "Valdemar Erlingsson"
#define MyAppURL "https://github.com/ValdemarOrn/CloudSeed"

[Setup]
; NOTE: The value of AppId uniquely identifies this application.
; Do not use the same AppId value in installers for other applications.
; (To generate a new GUID, click Tools | Generate GUID inside the IDE.)
AppId={{E0EC7045-27E4-489C-AA0D-25727920E96F}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
;AppVerName={#MyAppName} {#MyAppVersion}
AppPublisher={#MyAppPublisher}
AppPublisherURL={#MyAppURL}
AppSupportURL={#MyAppURL}
AppUpdatesURL={#MyAppURL}
DefaultDirName=C:\Program Files\Steinberg\VstPlugins\CloudSeed
DefaultGroupName={#MyAppName}
OutputBaseFilename=CloudSeed-v{#MyAppVersion}-Setup
OutputDir=Builds
Compression=lzma
SolidCompression=yes
ArchitecturesAllowed=x64
ArchitecturesInstallIn64BitMode=x64

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"

[Tasks]
Name: netinstall; Description: "Run .NET Framework 4.5 Installation"; GroupDescription: "Additional Requirements";
Name: msvcinstall; Description: "Install Microsoft Visual C Runtime 2017"; GroupDescription: "Additional Requirements";

[Files]
Source: "C:\Src\_Tree\Audio\CloudSeed\Builds\Current\*"; DestDir: "{app}"; \
  Flags: ignoreversion recursesubdirs createallsubdirs; \

Source: "C:\Src\_Tree\Audio\CloudSeed\Binaries\VC_redist.x64.exe"; DestDir: "{tmp}"; \
  Flags: deleteafterinstall; Tasks: msvcinstall

Source: "C:\Src\_Tree\Audio\CloudSeed\Binaries\NDP462-KB3151802-Web.exe"; DestDir: "{tmp}"; \
  Flags: deleteafterinstall; Tasks: netinstall

[Run]
Filename: {tmp}\VC_redist.x64.exe; \
    Parameters: ""; \
    StatusMsg: "Installing MSVC 2017 Redistributables..."; \
    Tasks: msvcinstall


Filename: {tmp}\NDP462-KB3151802-Web.exe; \
    Parameters: ""; \
    StatusMsg: "Installing .NET 4.5 Runtime..."; \
    Tasks: netinstall