# Repro repository

Originally created to repro https://github.com/cursive-ide/cursive/issues/2360, later extended to repro other tooling quirks I came across.

Example commands can also be run using [Just](https://github.com/casey/just); check [Justfile](./Justfile) or run `just help` for more details.

## Missing :replace-paths repro case

```shell script
# works
#   just replace-paths
clojure -Srepro -Sdeps '{:aliases {:blank {:replace-deps {} :replace-paths []}}}' -M:blank

# fails as it tries to load user.clj without providing its deps
#   just replace-paths-error
clojure -Srepro -Sdeps '{:aliases {:blank {:replace-deps {}}}}' -M:blank
```

### Related PRs

- https://github.com/practicalli/clojure-deps-edn/pull/12
- https://github.com/tonsky/uberdeps/pull/36

## Uberdeps 1.0.2->1.0.3 repro case

```shell script
# works
#   just run
#   just compile
clojure -Srepro -M -m app.core
mkdir -p classes
clojure -Srepro -M -e "(compile 'app.core)"

# fails as uberdeps 1.0.2 uses incorrect deps.edn path
#   just uberjar-incorrect
#   just run-uberjar
mkdir -p classes
clojure -Srepro -Sdeps '{:aliases {:uberjar {:replace-paths [] :replace-deps {uberdeps/uberdeps {:mvn/version "1.0.2"}}}}}' -M:uberjar -m uberdeps.uberjar --aliases uberjar
java -cp target/depslink3_2.jar clojure.main -m app.core


# succeeds
#   just uberjar
#   just run-uberjar
mkdir -p classes
clojure -Srepro -Sdeps '{:aliases {:uberjar {:replace-paths [] :replace-deps {uberdeps/uberdeps {:mvn/version "1.0.3"}}}}}' -M:uberjar -m uberdeps.uberjar --aliases uberjar
java -cp target/depslink3_2.jar clojure.main -m app.core
```

### Related PRs

- https://github.com/tonsky/uberdeps/pull/35
