[Setup]
AllowNoIcons=yes
AppId={{8BECBEE2-A1EF-4326-B1C6-8B4515E21916}
AppName=Clojure Box
AppVerName=Clojure Box 1.1RC1
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
OutputBaseFilename=clojure-box-1.1RC1-1-setup
Compression=lzma
SolidCompression=yes

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"

[Tasks]
Name: "desktopicon"; Description: "{cm:CreateDesktopIcon}"; GroupDescription: "{cm:AdditionalIcons}"; Flags: unchecked
Name: "quicklaunchicon"; Description: "{cm:CreateQuickLaunchIcon}"; GroupDescription: "{cm:AdditionalIcons}"; Flags: unchecked

[Files]
; Clojure from the official download zip
Source: "clojure-1.1.0-rc1\*"; Excludes: ".git*,\classes,*.jar"; DestDir: "{app}\clojure"; Flags: ignoreversion recursesubdirs createallsubdirs

; contrib from github/richhickey
Source: "clojure-contrib\*"; Excludes: ".git*,*.class,*.jar,\DLR_Main,bin,obj"; DestDir: "{app}\clojure-contrib"; Flags: ignoreversion recursesubdirs createallsubdirs

; jars need to be in a dir for swank-clojure-jar-home
Source: "clojure-1.1.0-rc1\clojure.jar"; DestDir: "{app}\lib"; Flags: ignoreversion
Source: "clojure-contrib\clojure-contrib.jar"; DestDir: "{app}\lib"; Flags: ignoreversion

; Emacs from emacsw32 install
Source: "c:\program files\emacs\*"; Excludes: ".cvsignore,CVS,\unins*"; DestDir: "{app}\emacs"; Flags: ignoreversion recursesubdirs createallsubdirs

; We make no assumption of the user's .emacs existing or doing
; anything useful, so we need this to load clojure-mode and start
; the REPL. The user can (setq inhibit-default-init t) to
; prevent this from loading.
Source: "default.el"; DestDir: "{app}\emacs\site-lisp"; Flags: ignoreversion

; clojure-mode, swank-clojure, and slime from github/technomancy.
; swank-clojure is hacked with a couple fixes for Windows
Source: "clojure-mode\*"; DestDir: "{app}\clojure-mode"; Flags: ignoreversion recursesubdirs createallsubdirs
Source: "slime\*"; DestDir: "{app}\slime-cvs"; Flags: ignoreversion recursesubdirs createallsubdirs
Source: "swank-clojure\*"; Excludes: ".hg*,.git*"; DestDir: "{app}\swank-clojure"; Flags: ignoreversion recursesubdirs createallsubdirs

; Including paredit as a convenience. Users still have to turn it on
; as http://kyle-burton.tumblr.com/post/86984817/clojure-box-paredit
Source: "lisp\paredit.el"; DestDir: "{app}\emacs\site-lisp"; Flags: ignoreversion

Source: "clojure-box-setup.iss"; DestDir: "{app}"; Flags: ignoreversion
Source: "README.rtf"; DestDir: "{app}"; Flags: ignoreversion
Source: "post-install.txt"; DestDir: "{app}"; Flags: ignoreversion

[Icons]
Name: "{app}\Clojure Box"; Filename: "{app}\emacs\emacs\bin\emacsclientw.exe"; Parameters: "-n"
Name: "{group}\Clojure Box"; Filename: "{app}\emacs\emacs\bin\emacsclientw.exe"; Parameters: "-n"
Name: "{group}\Clojure REPL"; Filename: "java.exe"; Parameters: "-cp ""{app}/clojure/clojure.jar;{app}/clojure-contrib/clojure-contrib.jar"" clojure.main --repl"
Name: "{group}\Clojure Box README"; Filename: "{app}\README.rtf"
Name: "{group}\Clojure Box Post-install tips"; Filename: "{app}\post-install.txt"
Name: "{commondesktop}\Clojure Box"; Filename: "{app}\emacs\emacs\bin\emacsclientw.exe"; Parameters: "-n"; Tasks: desktopicon
Name: "{userappdata}\Microsoft\Internet Explorer\Quick Launch\Clojure Box"; Filename: "{app}\emacs\emacs\bin\emacsclientw.exe"; Parameters: "-n"; Tasks: quicklaunchicon

[Registry]
Root: HKCR; Subkey: ".clj"; ValueType: string; ValueName: ""; ValueData: "ClojureFile"; Flags: uninsdeletevalue
Root: HKCR; Subkey: "ClojureFile"; ValueType: string; ValueName: ""; ValueData: "Clojure File"; Flags: uninsdeletekey
Root: HKCR; Subkey: "ClojureFile\DefaultIcon"; ValueType: string; ValueName: ""; ValueData: "{app}\emacs\emacs\bin\emacsclientw.exe,0"
Root: HKCR; Subkey: "ClojureFile\shell\open\command"; ValueType: string; ValueName: ""; ValueData: """{app}\emacs\emacs\bin\emacsclientw.exe"" -n ""%1"""

[Run]
Filename: "{app}\emacs\emacs\bin\runemacs.exe"; Description: "{cm:LaunchProgram,Clojure Box}"; Flags: nowait postinstall skipifsilent

