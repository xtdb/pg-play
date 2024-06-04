(ns pg-play.main
  (:require [xtdb.pgwire.playground :as pgw]))

(defn -main [& _args]
  (with-open [_ (pgw/open-playground)]
    @(promise)))
