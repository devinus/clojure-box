Clojure Box
===========

An all-in-one Clojure environment built on Emacs and Slime

Requirements
------------

All you need is Java 1.5 or later. If Clojure Box can find java.exe on
your system (usually it's in C:\Windows\system32), it provides the rest.

Components
----------

Clojure Box consists of these components:

- Clojure <http://clojure.org>
- Clojure Contrib <http://clojure.org>
- Emacs, via EmacsW32 <http://ourcomments.org/Emacs/EmacsW32.html>
- clojure-mode <http://github.com/technomancy/clojure-mode>
- swank-clojure <http://github.com/technomancy/swank-clojure>
- Slime <http://common-lisp.net/project/slime/>
- Paredit <http://mumble.net/~campbell/emacs/paredit.el>

Paredit is included for your convenience, but you'll have to activate it
in ~/.emacs.

```elisp
    (require 'paredit)
    (add-hook 'slime-repl-mode-hook (lambda () (paredit-mode +1)))
```

Thanks to all the developers of these excellent packages!

Customization
-------------

Clojure Box's startup is controlled by `default.el` in the `emacs\site-lisp`
directory under the installation. You can put your own customizations in
your `.emacs` file (these customizations will not be overwritten by future
Clojure Box or Emacs installations). Type `C-x C-f` and enter `~/.emacs`.
Edit the file and save it with `C-x C-s`. `~` is the same as your `HOME`
environment variable, or the application data directory under your user
profile if you have no `HOME`.

To make your own code available to Clojure's import function, the
easiest way is to put your source files under `src` and jars under `lib` in
your project directory. Then run `M-x swank-clojure-project` and tell the
prompt your directory.

Another way is to add jars or source directories to the classpath in
your `.emacs`. To make `C:/dev/project/src/a.clj` and everything in
`C:/dev/my-lib.jar` available, put this:

```elisp
    (setq swank-clojure-classpath
        (list "C:/dev/project/src" "C:/dev/my-lib.jar"))
```

To add more, put them in the same list as above or add to that list:

```elisp
    (add-to-list 'swank-clojure-classpath "C:/dev/my-lib-c/src")
```

You'll have to restart the REPL to make new jars available.

Emacs may not respect custom `JAVA_HOME` settings on Windows Vista 64-bit.
If you're having trouble running the right Java, try specifying an
absolute `java.exe` in `~/.emacs`:

```elisp
    (setq swank-clojure-java-path
        "\"C:/Program Files/Java/XXXXX/java.exe\"")
```

Inno Setup Source
-----------------

The installer is built with Inno Setup. The installer source file is
included with Clojure Box.

