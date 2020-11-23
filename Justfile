help:
  @just --list

# run from source
run:
  clojure -Srepro -M -m app.core

compile:
  mkdir -p classes
  clojure -Srepro -M -e "(compile 'app.core)"

uberdeps:
  mkdir -p classes
  clojure -Srepro -Sdeps '{:aliases {:uberjar {:replace-deps {uberdeps/uberdeps {:mvn/version "1.0.2"}}}}}' -M:uberjar -m uberdeps.uberjar --aliases uberjar

uberdeps-fixed:
  mkdir -p classes
  clojure -Srepro -Sdeps '{:aliases {:uberjar {:replace-deps {uberdeps/uberdeps {:git/url "https://github.com/imrekoszo/uberdeps.git" :sha "550667ae8193c89cc1f804d8fda4bcce0ba4d614"}}}}}' -M:uberjar -m uberdeps.uberjar --aliases uberjar

# run from uberjar
run-uberjar:
  java -cp target/depslink3_2.jar clojure.main -m app.core
