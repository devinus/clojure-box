#!/bin/bash

mkdir -p test/emacs/site-lisp test/clojure test/clojure-contrib
cp default.el test/emacs/site-lisp
rsync -avz dotemacs/site-lisp/clojure/* test/clojure-mode
rsync -avz swank-clojure-hg/* test/swank-clojure
rsync -avz dotemacs/site-lisp/slime-cvs/* test/slime-cvs
cp /users/shawn/clojure/work/clojure.jar test/clojure
cp release/clojure-1.0.0.jar test/clojure
cp /users/shawn/clojure/mirror/clojure-contrib-mirror/clojure-contrib.jar test/clojure-contrib
/Program\ Files/Clojure\ Box/emacs/emacs/bin/emacs -q --load test/emacs/site-lisp/default.el &
