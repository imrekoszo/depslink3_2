(ns app.core
  (:gen-class)
  (:require [clojure.edn :as edn]
            [clojure.java.io :as io]))

(defn -main [& _]
  (println "Hello world, here's my deps.edn:"
           (-> "project-deps.edn"
               io/resource
               slurp
               edn/read-string)))
