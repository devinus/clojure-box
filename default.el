;; Change to a directory that that has a chance of containing files the user
;; cares about.
(cd "~")

;; Keep the splash screen away from our REPL! You have to do it in this hook
;; because initialization sets it to nil after loading site-start and default.
(add-hook 'after-init-hook
          '(lambda ()
             (setq inhibit-splash-screen t)))

;; Better buffer switching. At least it makes C-x b show the open buffers.
(require 'iswitchb)
(iswitchb-mode 1)

;; Set up clojure-mode
(defvar clojure-home (concat (file-name-directory load-file-name) "../../"))
(add-to-list 'load-path (concat clojure-home "clojure-mode/"))
(require 'clojure-auto)
;; Or (require 'clojure-paredit) and never type another closing paren!

;; Start the REPL
(add-to-list 'load-path (concat clojure-home "swank-clojure/"))
(require 'swank-clojure-autoload)
(swank-clojure-config
 (setq swank-clojure-jar-path (concat clojure-home "clojure/clojure.jar"))
 (add-to-list 'swank-clojure-extra-classpaths
       (concat clojure-home "clojure-contrib/clojure-contrib.jar")))
(add-to-list 'load-path (concat clojure-home "slime-cvs/"))
(require 'slime)
(slime)
