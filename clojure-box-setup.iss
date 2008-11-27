[Setup]
AllowNoIcons=yes
AppId={{8BECBEE2-A1EF-4326-B1C6-8B4515E21916}
AppName=Clojure Box
AppVerName=Clojure Box r1109.1
AppPublisher=Clojure Box
AppPublisherURL=http://clojure.bighugh.com
AppSupportURL=http://http://www.bitbucket.org/shoover/clojure-box
AppUpdatesURL=http://clojure.bighugh.com
ChangesAssociations=yes
DefaultDirName={pf}\Clojure Box
DefaultGroupName=Clojure Box
InfoBeforeFile=README.rtf
InfoAfterFile=post-install.txt
OutputDir=C:\Documents and Settings\Shawn\Desktop\clojure-box-setup
OutputBaseFilename=clojure-box-r1109-setup
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
Source: "C:\Program Files\Emacs\*"; Excludes: ".cvsignore,CVS,\unins*"; DestDir: "{app}\emacs"; Flags: ignoreversion recursesubdirs createallsubdirs

; We make no assumption of the user's user's .emacs,
; so we need this to load clojure-mode and start the REPL.
; The user can set inhibit-default-init to non-nil to prevent
; this from loading.
Source: "default.el"; DestDir: "{app}\emacs\site-lisp"; Flags: ignoreversion

Source: "C:\users\shawn\emacs\site-lisp\clojure\*"; DestDir: "{app}\clojure-mode"; Flags: ignoreversion recursesubdirs createallsubdirs
Source: "C:\users\shawn\emacs\site-lisp\slime-cvs\*"; DestDir: "{app}\slime-cvs"; Flags: ignoreversion recursesubdirs createallsubdirs
Source: "C:\users\shawn\emacs\site-lisp\swank-clojure\*"; DestDir: "{app}\swank-clojure"; Flags: ignoreversion recursesubdirs createallsubdirs

Source: "clojure-box-setup.iss"; DestDir: "{app}"; Flags: ignoreversion
Source: "README.rtf"; DestDir: "{app}"; Flags: ignoreversion
Source: "post-install.txt"; DestDir: "{app}"; Flags: ignoreversion

[Icons]
Name: "{app}\Clojure Box"; Filename: "{app}\emacs\emacs\bin\emacsclientw.exe"; Parameters: "-n"
Name: "{group}\Clojure Box"; Filename: "{app}\emacs\emacs\bin\emacsclientw.exe"; Parameters: "-n"
Name: "{commondesktop}\Clojure Box"; Filename: "{app}\emacs\emacs\bin\emacsclientw.exe"; Parameters: "-n"; Tasks: desktopicon
Name: "{userappdata}\Microsoft\Internet Explorer\Quick Launch\Clojure Box"; Filename: "{app}\emacs\emacs\bin\emacsclientw.exe"; Parameters: "-n"; Tasks: quicklaunchicon

[Registry]
Root: HKCR; Subkey: ".clj"; ValueType: string; ValueName: ""; ValueData: "ClojureFile"; Flags: uninsdeletevalue
Root: HKCR; Subkey: "ClojureFile"; ValueType: string; ValueName: ""; ValueData: "Clojure File"; Flags: uninsdeletekey
Root: HKCR; Subkey: "ClojureFile\DefaultIcon"; ValueType: string; ValueName: ""; ValueData: "{app}\emacs\emacs\bin\emacsclientw.exe,0"
Root: HKCR; Subkey: "ClojureFile\shell\open\command"; ValueType: string; ValueName: ""; ValueData: """{app}\emacs\emacs\bin\emacsclientw.exe"" -n ""%1"""

[Run]
Filename: "{app}\emacs\emacs\bin\runemacs.exe"; Description: "{cm:LaunchProgram,Clojure Box}"; Flags: nowait postinstall skipifsilent

