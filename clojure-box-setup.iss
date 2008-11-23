[Setup]
AppId={{8BECBEE2-A1EF-4326-B1C6-8B4515E21916}
AppName=Clojure Box
AppVerName=Clojure Box r1109
AppPublisher=Clojure Box
;AppPublisherURL=http://www.example.com/
;AppSupportURL=http://www.example.com/
;AppUpdatesURL=http://www.example.com/
ChangesAssociations=yes
DefaultDirName={pf}\Clojure Box
DefaultGroupName=Clojure Box
AllowNoIcons=yes
OutputDir=C:\Documents and Settings\Shawn\Desktop\clojure-box-setup
OutputBaseFilename=setup
Compression=lzma
SolidCompression=yes

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"

[Tasks]
Name: "desktopicon"; Description: "{cm:CreateDesktopIcon}"; GroupDescription: "{cm:AdditionalIcons}"; Flags: unchecked
Name: "quicklaunchicon"; Description: "{cm:CreateQuickLaunchIcon}"; GroupDescription: "{cm:AdditionalIcons}"; Flags: unchecked

[Files]
Source: "C:\users\shawn\clojure\work\*"; Excludes: ".hg*,\classes"; DestDir: "{app}\clojure"; Flags: ignoreversion recursesubdirs createallsubdirs
Source: "C:\users\shawn\clojure\mirror\clojure-contrib-mirror\*"; Excludes: ".hg*"; DestDir: "{app}\clojure-contrib"; Flags: ignoreversion recursesubdirs createallsubdirs
Source: "C:\Program Files\Emacs\*"; Excludes: ".cvsignore,CVS,\unins*,\emacs\site-lisp\site-start.el"; DestDir: "{app}\emacs"; Flags: ignoreversion recursesubdirs createallsubdirs

; Put our own site-start.el. We're not relying on the user's .emacs,
; so we need this to load clojure-mode and start the REPL.
Source: "site-start.el"; DestDir: "{app}\emacs\site-lisp"; Flags: ignoreversion

Source: "C:\users\shawn\emacs\site-lisp\clojure\*"; DestDir: "{app}\clojure-mode"; Flags: ignoreversion recursesubdirs createallsubdirs
Source: "C:\users\shawn\emacs\site-lisp\slime-cvs\*"; DestDir: "{app}\slime-cvs"; Flags: ignoreversion recursesubdirs createallsubdirs
Source: "C:\users\shawn\emacs\site-lisp\swank-clojure\*"; DestDir: "{app}\swank-clojure"; Flags: ignoreversion recursesubdirs createallsubdirs
; NOTE: Don't use "Flags: ignoreversion" on any shared system files

[Icons]
Name: "{app}\Clojure Box"; Filename: "{app}\emacs\emacs\bin\emacsclientw.exe"; Parameters: "-n -a ""runemacs.exe -q --no-splash"""
Name: "{group}\Clojure Box"; Filename: "{app}\emacs\emacs\bin\emacsclientw.exe"; Parameters: "-n -a ""runemacs.exe -q --no-splash"""
Name: "{commondesktop}\Clojure Box"; Filename: "{app}\emacs\emacs\bin\emacsclientw.exe"; Parameters: "-n -a ""runemacs.exe -q --no-splash"""; Tasks: desktopicon
Name: "{userappdata}\Microsoft\Internet Explorer\Quick Launch\Clojure Box"; Filename: "{app}\emacs\emacs\bin\emacsclientw.exe"; Parameters: "-n -a ""runemacs.exe -q --no-splash"""; Tasks: quicklaunchicon

[Registry]
Root: HKCR; Subkey: ".clj"; ValueType: string; ValueName: ""; ValueData: "ClojureFile"; Flags: uninsdeletevalue
Root: HKCR; Subkey: "ClojureFile"; ValueType: string; ValueName: ""; ValueData: "Clojure File"; Flags: uninsdeletekey
Root: HKCR; Subkey: "ClojureFile\DefaultIcon"; ValueType: string; ValueName: ""; ValueData: "{app}\emacs\emacs\bin\emacsclientw.exe,0"
Root: HKCR; Subkey: "ClojureFile\shell\open\command"; ValueType: string; ValueName: ""; ValueData: """{app}\emacs\emacs\bin\emacsclientw.exe"" -n -a ""runemacs.exe -q --no-splash"" ""%1"""

[Run]
Filename: "{app}\emacs\emacs\bin\emacsclientw.exe"; Parameters: "-n -a ""runemacs.exe -q --no-splash"""; Description: "{cm:LaunchProgram,Clojure Box}"; Flags: nowait postinstall skipifsilent
; Filename: "{app}\emacs\emacs\bin\emacs.exe"; Description: "Byte-compile Emacs Lisp sources"; Parameters: "--batch -Q --eval ""(byte-recompile-directory \"".\"" 0)"""; WorkingDir: "{app}\emacs"; StatusMsg: "Byte-compiling Emacs Lisp sources..."

