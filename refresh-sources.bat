pushd c:\users\shawn\clojure\work
hg pull -u
call ant

cd c:\users\shawn\clojure\mirror\clojure-contrib-mirror
hg pull -u
call ant -Dclojure.jar=c:\users\shawn\clojure\work\clojure.jar

popd

pushd dotemacs
hg pull -u
popd

pushd swank-clojure-hg
hg qpop -a
hg up -C default
cd ..
hg convert swank-clojure
cd swank-clojure-hg
hg qpush -a
popd
