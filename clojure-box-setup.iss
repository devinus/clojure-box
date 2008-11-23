[Setup]
AppId={{8BECBEE2-A1EF-4326-B1C6-8B4515E21916}
AppName=Clojure Box
AppVerName=Clojure Box r1109
AppPublisher=Clojure Box
;AppPublisherURL=http://www.example.com/
;AppSupportURL=http://www.example.com/
;AppUpdatesURL=http://www.example.com/
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
Source: "C:\Program Files\Emacs\*"; Excludes: ".cvsignore,CVS"; DestDir: "{app}\emacs"; Flags: ignoreversion recursesubdirs createallsubdirs
Source: "C:\users\shawn\action\clojure-box\clojure-box.bat"; DestDir: "{app}"; Flags: ignoreversion
Source: "C:\users\shawn\action\clojure-box\clojure-box.el"; DestDir: "{app}"; Flags: ignoreversion
Source: "C:\users\shawn\action\clojure-box\compile.el"; DestDir: "{app}"; Flags: ignoreversion
Source: "C:\users\shawn\emacs\site-lisp\clojure\*"; DestDir: "{app}\clojure-mode"; Flags: ignoreversion recursesubdirs createallsubdirs
Source: "C:\users\shawn\emacs\site-lisp\slime-cvs\*"; DestDir: "{app}\slime-cvs"; Flags: ignoreversion recursesubdirs createallsubdirs
Source: "C:\users\shawn\emacs\site-lisp\swank-clojure\*"; DestDir: "{app}\swank-clojure"; Flags: ignoreversion recursesubdirs createallsubdirs
; NOTE: Don't use "Flags: ignoreversion" on any shared system files

[Icons]
Name: "{group}\Clojure Box"; Filename: "{app}\emacs\emacs\bin\emacsclientw.exe"
Name: "{commondesktop}\Clojure Box"; Filename: "{app}\emacs\emacs\bin\emacsclientw.exe"; Tasks: desktopicon
Name: "{userappdata}\Microsoft\Internet Explorer\Quick Launch\Clojure Box"; Filename: "{app}\emacs\emacs\bin\emacsclientw.exe"; Tasks: quicklaunchicon

[Run]
Filename: "{app}\emacs\emacs\bin\emacsclientw.exe"; Description: "{cm:LaunchProgram,Clojure Box}"; Flags: nowait postinstall skipifsilent
; Filename: "{app}\emacs\emacs\bin\emacs.exe"; Description: "Byte-compile Emacs Lisp sources"; Parameters: "--batch -Q --eval ""(byte-recompile-directory \"".\"" 0)"""; WorkingDir: "{app}\emacs"; StatusMsg: "Byte-compiling Emacs Lisp sources..."

