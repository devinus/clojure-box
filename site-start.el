;; ****** Added by emacsw32-setup-base at Thu Sep 18 22:19:28 2008
;; Add EmacsW32/lisp to load-path if found.
(let ((lisp-dir (expand-file-name (concat exec-directory "../../EmacsW32/lisp/"))))
  (unless (file-accessible-directory-p lisp-dir)
    (lwarn "Can't find %s" lisp-dir)
    (sit-for 10))
  (when (file-accessible-directory-p lisp-dir)
    (message "Adding %s to load-path" lisp-dir)
    (add-to-list 'load-path lisp-dir))
  (require 'emacsw32 nil t)
  (unless (featurep 'emacsw32)
    (lwarn '(emacsw32) :error "Could not find emacsw32.el")))

(setq inhibit-splash-screen t)

;; Better buffer switching. At least it makes C-x b show the open buffers.
(require 'iswitchb)
(iswitchb-mode 1)

(defvar clojure-home (concat (file-name-directory load-file-name) "../../"))

;; Set up clojure-mode
(add-to-list 'load-path (concat clojure-home "clojure-mode/"))
(require 'clojure-auto)
;; Or uncomment this and never type another closing paren!
;; (require 'clojure-paredit)

;; Start the REPL
(add-to-list 'load-path (concat clojure-home "swank-clojure/"))
(require 'swank-clojure-autoload)
(swank-clojure-config
 (setq swank-clojure-jar-path (concat clojure-home "clojure/clojure.jar"))
 (setq swank-clojure-extra-classpaths
       (list (concat clojure-home "clojure-contrib/clojure-contrib.jar"))))
(add-to-list 'load-path (concat clojure-home "slime-cvs/"))
(require 'slime)
(slime)

;; Change to a directory that that has a chance of containing files the user
;; cares about.
(cd "~")

;; Start the emacs server to support opening clojure files in emacs
;; from Windows Explorer.
(server-start)
