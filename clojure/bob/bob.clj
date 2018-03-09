(ns bob
  (:require [clojure.string :as str]))

(defn shouting? [input]
  (and
    (= input (str/upper-case input))
    (not= input(str/lower-case input))))

(defn response-for [input]
  (cond
    (str/blank? input) "Fine. Be that way!"
    (shouting? input) "Woah, chill out!"
    (str/ends-with? input "?") "Sure."
    :else "Whatever."
  )
)
