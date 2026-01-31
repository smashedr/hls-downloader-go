#define MyAppName "HLS Video Downloader"
#define MyAppPublisher "CSSNR"
#define MyAppURL "https://github.com/smashedr/hls-downloader-go"
#define MyAppExeName "client.exe"
#ifndef MyAppVersion
  #define MyAppVersion "0.0.1"
#endif
#define MyAppFolder "org.cssnr.hls.downloader"

[Setup]
AppId={{4ED2BCC3-372D-4AF2-B04C-DF4D28569834}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
AppVerName={#MyAppName} {#MyAppVersion}
AppPublisher={#MyAppPublisher}
AppPublisherURL={#MyAppURL}
AppSupportURL={#MyAppURL}
AppUpdatesURL={#MyAppURL}
;Compression=lzma
;SolidCompression=yes
DefaultDirName={localappdata}\{#MyAppFolder}
DefaultGroupName={#MyAppName}
;DisableDirPage=yes
DisableProgramGroupPage=yes
;DisableFinishedPage=yes
InfoBeforeFile=assets\pre-install.rtf
InfoAfterFile=assets\post-install.rtf

OutputBaseFilename=windows-installer
OutputDir=out
PrivilegesRequired=lowest
PrivilegesRequiredOverridesAllowed=dialog
SetupIconFile=assets\favicon.ico
UninstallDisplayIcon={uninstallexe}
WizardStyle=modern dynamic
VersionInfoVersion={#MyAppVersion}

ArchitecturesInstallIn64BitMode=x64compatible arm64

ArchiveExtraction=full
;ChangesEnvironment=yes
;LicenseFile=LICENSE

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"

[Tasks]
Name: "downloadffmpeg"; Description: "Download FFmpeg"; Flags: checkedonce

[Files]
Source: "dist\client\client_windows_386_sse2\{#MyAppExeName}"; DestDir: "{app}"; Flags: ignoreversion; Check: not Is64BitInstallMode()
Source: "dist\client\client_windows_amd64_v1\{#MyAppExeName}"; DestDir: "{app}"; Flags: ignoreversion; Check: Is64BitInstallMode() and not IsArm64()
Source: "dist\client\client_windows_arm64_v8.0\{#MyAppExeName}"; DestDir: "{app}"; Flags: ignoreversion; Check: IsArm64()
Source: "dist\manifest-chrome.json"; DestDir: "{app}"; Flags: ignoreversion
Source: "dist\manifest-firefox.json"; DestDir: "{app}"; Flags: ignoreversion
Source: "https://github.com/defisym/FFmpeg-Builds-Win32/releases/download/latest/ffmpeg-master-latest-win32-gpl.zip"; DestName: "ffmpeg-master-latest-win32-gpl.zip"; DestDir: "{app}"; \
  ExternalSize: 100_000_000; Flags: external download extractarchive recursesubdirs ignoreversion; Check: not Is64BitInstallMode() and WizardIsTaskSelected('downloadffmpeg'); AfterInstall: MyAfterInstall
Source: "https://github.com/BtbN/FFmpeg-Builds/releases/download/latest/ffmpeg-master-latest-win64-gpl.zip"; DestName: "ffmpeg-master-latest-win64-gpl.zip"; DestDir: "{app}"; \
  ExternalSize: 200_000_000; Flags: external download extractarchive recursesubdirs ignoreversion; Check: Is64BitInstallMode() and WizardIsTaskSelected('downloadffmpeg'); AfterInstall: MyAfterInstall

[Registry]
Root: HKCU; Subkey: "Software\Google\Chrome\NativeMessagingHosts\{#MyAppFolder}"; ValueType: string; ValueData: "{app}\manifest-chrome.json"; Flags: uninsdeletekey
Root: HKCU; Subkey: "Software\Chromium\NativeMessagingHosts\{#MyAppFolder}"; ValueType: string; ValueData: "{app}\manifest-chrome.json"; Flags: uninsdeletekey
Root: HKCU; Subkey: "Software\Microsoft\Edge\NativeMessagingHosts\{#MyAppFolder}"; ValueType: string; ValueData: "{app}\manifest-chrome.json"; Flags: uninsdeletekey
Root: HKCU; Subkey: "Software\Mozilla\NativeMessagingHosts\{#MyAppFolder}"; ValueType: string; ValueData: "{app}\manifest-firefox.json"; Flags: uninsdeletekey
Root: HKCU; Subkey: "Software\Waterfox\NativeMessagingHosts\{#MyAppFolder}"; ValueType: string; ValueData: "{app}\manifest-firefox.json"; Flags: uninsdeletekey

[UninstallDelete]
Type: files; Name: "{app}\ffmpeg.exe"
Type: files; Name: "{app}\log.txt"
Type: files; Name: "{app}\log-1.txt"
Type: files; Name: "{app}\client.bat"
;Type: dirifempty; Name: "{app}"

[Code]
procedure MyAfterInstall();
var
  FindRec: TFindRec;
  SourceDir: String;
  ResultCode: Integer;
begin
  FindFirst(ExpandConstant('{app}') + '\ffmpeg-*', FindRec)
  Log('FindRec.Name: ' + FindRec.Name)
  SourceDir := ExpandConstant('{app}') + '\' + FindRec.Name;
  Log('SourceDir: ' + SourceDir)
  Exec('cmd.exe', '/c copy "' + SourceDir + '\bin\ffmpeg.exe" "' + ExpandConstant('{app}') + '\ffmpeg.exe" && rmdir "' + SourceDir + '" /S /Q', '', SW_HIDE, ewWaitUntilTerminated, ResultCode);
end;
