(ns reverse-string)

(defn reverse-string [string]
  (->> string
    seq
    (reduce #(cons %2 %1) [])
    (apply str))
)
