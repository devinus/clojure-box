;; clojure-contrib is available
(require 'clojure.contrib.str-utils)
(clojure.contrib.str-utils/re-split #" " "testing the clojure box")

;; ~/.clojure jars on the the classpath. Assumes miglayout is there.
(import '(net.miginfocom.layout AC))
AC

;; Should show up in the REPL, not inferior-lisp
(.run (Thread. #(println "hi from the background thread")))
