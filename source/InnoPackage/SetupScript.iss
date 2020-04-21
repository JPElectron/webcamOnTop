[Setup]
AppName=webcamOnTop
AppVerName=webcamOnTop v5.4
PrivilegesRequired=admin
DefaultDirName={pf}\webcamOnTop
DefaultGroupName=webcamOnTop
AppCopyright=© 2004-2009 JPElectron.com
AllowCancelDuringInstall=false
AllowUNCPath=false
ShowLanguageDialog=no
AppPublisher=JPElectron.com
AppPublisherURL=http://www.jpelectron.com
AppVersion=5.4
AppReadmeFile=http://www.jpelectron.com/readme/webcamontop.asp
UninstallDisplayIcon={app}\webcam.exe
VersionInfoVersion=5.4
VersionInfoCompany=JPElectron.com
VersionInfoDescription=webcamOnTop Setup
VersionInfoCopyright=(c) 2004-2009 JPElectron.com
EnableDirDoesntExistWarning=false
DirExistsWarning=no
AppendDefaultGroupName=false
[Files]
Source: stdole2.tlb; DestDir: {sys}; OnlyBelowVersion: 0,6; Flags: restartreplace uninsneveruninstall sharedfile regtypelib
Source: msvbvm60.dll; DestDir: {sys}; OnlyBelowVersion: 0,6; Flags: restartreplace uninsneveruninstall sharedfile regserver
Source: oleaut32.dll; DestDir: {sys}; OnlyBelowVersion: 0,6; Flags: restartreplace uninsneveruninstall sharedfile regserver
Source: olepro32.dll; DestDir: {sys}; OnlyBelowVersion: 0,6; Flags: restartreplace uninsneveruninstall sharedfile regserver
Source: asycfilt.dll; DestDir: {sys}; OnlyBelowVersion: 0,6; Flags: restartreplace uninsneveruninstall sharedfile
Source: comcat.dll; DestDir: {sys}; OnlyBelowVersion: 0,6; Flags: restartreplace uninsneveruninstall sharedfile regserver
Source: msinet.ocx; DestDir: {sys}; Flags: restartreplace uninsneveruninstall sharedfile regserver
Source: webcam.exe; DestDir: {app}; Flags: ignoreversion
Source: webcam.ini; DestDir: {app}; Flags: confirmoverwrite
Source: Readme.url; DestDir: {app}
Source: Readme.url; DestDir: {group}
[Icons]
Name: {group}\webcamOnTop; Filename: {app}\webcam.exe; WorkingDir: {app}
[UninstallRun]
Filename: http://www.jpelectron.com/uf/frm.asp?type=new&app=wcontop; Flags: shellexec
[Messages]
FinishedLabel=Setup has finished installing webcamOnTop on your computer.
FinishedHeadingLabel=webcamOnTop Setup Complete
[Registry]
Root: HKCR; Subkey: webcamOnTop; ValueType: string; ValueName: URL Protocol; Flags: uninsdeletekey
Root: HKCR; Subkey: webcamOnTop; ValueType: string; ValueData: URL:webcamOnTop Protocol; Flags: uninsdeletekey
Root: HKCR; Subkey: webcamOnTop\shell\open\command; ValueType: string; ValueData: """{app}\webcam.exe"" %1"; Flags: uninsdeletekey
