pushd

cd c:\users\shawn\clojure\work
hg pull -u
ant

cd c:\users\shawn\clojure\mirror\clojure-contrib-mirror
hg pull -u
ant

popd

pushd dotemacs
hg pull -u
popd

pushd swank-clojure-hg
hg qpop -a
hg branch default
cd ..
hg convert swank-clojure
cd swank-clojure-hg
hg qpush -a
popd
