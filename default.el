;; Keep the splash screen away from our REPL! You have to do it in this hook
;; because initialization sets it to nil after loading site-start and default.
(add-hook 'after-init-hook
          '(lambda ()
             (setq inhibit-splash-screen t)))

;; Better buffer switching. At least it makes C-x b show the open buffers.
(require 'iswitchb)
(iswitchb-mode 1)

;; Set up clojure-mode
(let ((clojure-home (concat (file-name-directory load-file-name) "../../")))
  ;; slime tries to access this even thought it shouldn't
  (defvar package-activated-list nil)

  ;; swank-clojure assumes its autoloads run and define this before slime
  ;; is loaded.
  (defadvice slime-read-interactive-args (after add-clojure)
    ;; Unfortunately we need to construct our Clojure-launching command
    ;; at slime-launch time to reflect changes in the classpath. Slime
    ;; has no mechanism to support this, so we must resort to advice.
    (swank-clojure-reset-implementation))

  (add-to-list 'load-path (concat clojure-home "slime/"))
  (require 'slime)
  (slime-setup '(slime-repl slime-fancy))
  ;; Redefine this to not complain about the so called ChangeLog file.
  (defun slime-repl-insert-banner ()
    (when (zerop (buffer-size))
      (let ((welcome (concat "; SLIME"
                             ;;(or (slime-changelog-date)
                             ;;    "- ChangeLog file not found")
                             )))
        (insert welcome))))

  (add-to-list 'load-path (concat clojure-home "clojure-mode/"))
  (require 'clojure-mode)

  ;; swank-clojure-project expects every dependency to live under the
  ;; project. Clojure Box users may not be up to speed with Leiningen
  ;; so we append whatever the initial classpath was onto what
  ;; swank-clojure-project thinks the classpath should be. Project
  ;; jars and dirs come first, then initial swank-clojure-classpath
  ;; stuff, so the project can always override the Clojure version or
  ;; swank or anything else.
  (defvar clojure-box-initial-classpath nil)
  (defadvice swank-clojure-project (before init-clojure-box-classpath)
    (setq clojure-box-initial-classpath swank-clojure-classpath))
  (add-hook 'swank-clojure-project-hook
            (lambda ()
              (setq swank-clojure-classpath
                    (append swank-clojure-classpath
                            clojure-box-initial-classpath))
              (swank-clojure-reset-implementation)
              (message (format "clojure box hook %s" swank-clojure-classpath))))

  (add-to-list 'load-path (concat clojure-home "swank-clojure/"))
  (setq swank-clojure-jar-home (concat clojure-home "lib"))
  (require 'swank-clojure)

  ;; Classpath hackery. The user may setq this in ~/.emacs for
  ;; personal jars and dirs. If not, swank-clojure sets up the
  ;; defaults. Here we make sure the defaults are added to the end if
  ;; the user set the variable, in case they didn't add everything we
  ;; need.
  (dolist (item (swank-clojure-default-classpath))
    (add-to-list 'swank-clojure-classpath item 'append))
  ;; And of course we need our swank sources in there.
  (add-to-list 'swank-clojure-classpath
               (concat clojure-home "swank-clojure/src") 'append)

  ;; Start the REPL
  (require 'assoc)
  (swank-clojure-reset-implementation)
  (slime 'clojure))
