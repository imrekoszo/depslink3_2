```shell script
# works
just run
just compile

# fails as it tries to load user.clj without providing its deps
just uberjar-no-replace-paths

# fails as uberdeps 1.0.2 uses incorrect deps.edn path
just uberjar-incorrect
just run-uberjar

# succeeds
just uberjar
just run-uberjar
```
