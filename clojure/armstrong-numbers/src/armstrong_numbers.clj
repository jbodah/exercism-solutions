(ns armstrong-numbers
  (:require [clojure.math.numeric-tower :as math]))

(defn digits [n]
  (->> n str seq (map int) (map #(- %1 48))))

(defn sum [coll]
  (reduce #(+ %1 %2) 0 coll))

(defn armstrong? [n]
  (let [the-digits (digits n)
        digit-count (count the-digits)]
    (->> the-digits
         (map #(math/expt %1 digit-count))
         sum
         (= n))))
