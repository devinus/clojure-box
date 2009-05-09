#!/bin/bash

mkdir -p test/emacs/site-lisp test/clojure test/clojure-contrib
cp default.el test/emacs/site-lisp/default.el
rsync -avz dotemacs/site-lisp/clojure/* test/clojure-mode
rsync -avz swank-clojure-hg/* test/swank-clojure
rsync -avz dotemacs/site-lisp/slime-cvs/* test/slime-cvs
cp /users/shawn/clojure/work/clojure.jar test/clojure/clojure.jar
cp /users/shawn/clojure/mirror/clojure-contrib-mirror/clojure-contrib.jar test/clojure-contrib/clojure-contrib.jar
/Program\ Files/Clojure\ Box/emacs/emacs/bin/emacs -q --load test/emacs/site-lisp/default.el &
