# Repro repository

Originally created to repro https://github.com/cursive-ide/cursive/issues/2360, later extended to repro other tooling errors I came across.

Examples use [Just](https://github.com/casey/just), check `Justfile` to see the underlying shell commands.

## Missing :replace-paths repro case

- https://github.com/practicalli/clojure-deps-edn/pull/12
- https://github.com/tonsky/uberdeps/pull/36

```shell script
# works
just replace-paths

# fails as it tries to load user.clj without providing its deps
just replace-paths-error
```

## Uberdeps 1.0.2->1.0.3 repro case

- https://github.com/tonsky/uberdeps/pull/35

```shell script
# works
just run
just compile

# fails as uberdeps 1.0.2 uses incorrect deps.edn path
just uberjar-incorrect
just run-uberjar

# succeeds
just uberjar
just run-uberjar
```
